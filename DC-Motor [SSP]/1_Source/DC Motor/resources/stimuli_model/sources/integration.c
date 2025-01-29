/* Implementation of integration.h */

#include "conf.h"
#include "util.h"
#include "integration.h"
#include "jac.h"
#include "result.h"
#include "cexch.h"

#include "fmiFunctions_fwd.h"

/* Sundials */
#include <cvode/cvode.h>
#include <sunlinsol/sunlinsol_dense.h>
#include "ds_sundials_extensions/ds_sundials_extensions.h"
#include <sundials/sundials_math.h>
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
#include <sunmatrix/sunmatrix_sparse.h>
#endif

/* for Dymola_abs */
#include "f2c.h"

#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <assert.h>

#ifndef FMU_SOURCE_CODE_EXPORT
#include "adymosim.h"
#endif

/* ----------------- constants ----------------- */

#ifndef DYMOLA_STATIC_IMPORT
#define DYMOLA_STATIC_IMPORT DYMOLA_STATIC
#endif

extern const double cvodeTolerance;

#define RTOL_DEFAULT (1.0e-5)   /* scalar relative tolerance */

/* when testing with Modelica wrapper, the external step size may be large due to
   variable step size solvers being used externally */
#define MAX_STEPS_BEFORE_REINIT 5000	/* maximum number of internal steps before first call to reinit */
#define MAX_STEPS_TOTAL 100000			/* maximum number if internal steps for a time step */
#define STEPS_BEFORE_REINIT_FACTOR 3	/* multiplier for number of internal steps to allow before next reinit */
#define MAX_FAILURES 15       /* maximum number of error test failures permitted in attempting one step */
#define MAX_NON_LIN_ITERS 3   /* maximum number of non-linear iterations */

/* for Sundials */
/* the safety factor used in the nonlinear convergence test */
#define NON_LINEAR_CONV_TEST_COEFF 1e-1

/* ----------------- macros ----------------- */

#define CALL_SET(function, val)                               \
    flag = function(cvode_mem, val);                          \
	if (util_check_flag(&flag, #function, 1, comp)) goto fail \

#define CALL_SET2(function, val1, val2)                       \
    flag = function(cvode_mem, val1, val2);                   \
    if (util_check_flag(&flag, #function, 1, comp)) goto fail \

#define GET_STATISTIC(function, var)                          \
	flag = function(comp->iData->cvode_mem, &var);            \
	if (util_check_flag(&flag, #function, 1, comp)) {         \
	  var = -1;                                               \
	}

#define INT_RESULT_SAMPLE(atEvent)                            \
if (comp->storeResult == FMITrue) {                           \
		result_sample(comp, atEvent);                         \
}

/* ----------------- local function declarations ----------------- */

/* clones integration data */
static IntegrationStatus clone_data(Component* target, Component* source);

/* clones interpolation data */
static FMIStatus clone_ipData(Component* target, Component* source);

/* frees integration data */
static IntegrationStatus free_data(Component* comp, Component* target);

/* root function used for event indicators */
static int g(realtype t, N_Vector y, realtype *gout, void *user_data);

/* step event check function */
static int check_step_event(void* user_data);

/* error message handler */
static void err_msg_handler(int error_code, const char *module,
							const char *function, char *msg,
							void *eh_data);

/* sets the weights for the weighted norm */
static int cvEwtSetVV(N_Vector y, N_Vector ewt, void *user_data);

/* checks if a steady state has been reached */
static int steady_state_reached(Component* comp);

/* checks if the embedded max run time has been reached */
static int max_run_time_reached(Component* comp);

/* initialize SparseFixData struct */
static void InitializeSparseFixData(SparseFixData* sparseData);

/* copy SparseFixData struct */
static void CopySparseFixData(const size_t nStates, SparseFixData* target, const SparseFixData* source);

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
/* checks if sparse solver is to be used and returns number of nonzero elements */
static int EnableSparse(int nx, SparseFixData *sparseData);

/* computes fixed Jacobian structure data to be used when calculating numeric Jacobian using grouping */
static int PrepareSparse(Component *comp, SparseFixData *sparseData, int N, int nz);

/* return the number of cores to be used by the multithreaded sparse SuperLU */
static int getNumProcsCvode(SparseFixData *sparseData, int nx, int nnz, int bw);
#endif

// Called by CVode after each successful step. Gives access to the internal memory structure for logging.
// Do not modify the CVode memory as leads to undefined behaviour.
static int MyMonitorFn(void* cvode_mem, void* user_data);

/* ----------------- local variables ----------------- */

static size_t nGroups;

/* ----------------- external variables ----------------- */

extern int QJacobianCG_[];
extern struct QJacobianTag_ QJacobianGC2_[];

/* ----------------- external function declarations ----------------- */

extern void initializeData2(double* t);
DYMOLA_STATIC void DYNPropagateDidToThread(struct DYNInstanceData* did);


/* ----------------- function definitions ----------------- */

/* ------------------------------------------------------ */
DYMOLA_STATIC IntegrationStatus integration_setup(FMIComponent c, FMIReal relTol)
{
	Component* comp = (Component*) c;
	realtype *abstol_data, *reltol_data;
	void *cvode_mem;
	int flag;
	size_t i;

	IntegrationData* iData;
	
	assert(comp->iData == NULL);
	assert(sizeof(realtype) == sizeof(FMIReal));

	if (comp->nStates == 0) {
		/* Add dummy state fo simplify code and avoid extra conditions for the vast majority of models.
		Note that concerned arrays already have 1 allocated element due to guarding offset 1 during instantiation. */
		comp->nStates = 1;
		comp->states[0] = 0;
		comp->statesNominal[0] = 1;
	}

	if (relTol <= 0) {
		relTol = RTOL_DEFAULT;
	}
	comp->iData = (IntegrationData*) ALLOCATE_MEMORY(1, sizeof(IntegrationData));
	if (comp->iData == NULL) goto fail;

	iData = comp->iData;

	iData->y = iData->abstol = iData->reltol = iData->ewt = iData->tmp1 = iData->tmp2 = NULL;
	iData->cvode_mem = NULL;

	InitializeSparseFixData(&iData->sparseData);

	iData->steadyStateUtils = NULL;

	iData->sunctx = NULL;
	iData->A = NULL;
	iData->linearSolver = NULL;
	SUNContext_Create(NULL, &iData->sunctx);
	if (util_check_flag((void*)iData->sunctx, "SUNContext_Create", 0, comp)) goto fail;

	/* create serial vector from states */
	assert(comp->nStates > 0);
	/* it turns out using N_VNew_Serial(comp->nStates) gives worse accuracy for some reason */
	iData->y = N_VMake_Serial((long)comp->nStates, comp->states, iData->sunctx);
	if (util_check_flag((void *)(iData->y), "N_VMake_Serial", 0, comp)) goto fail;

	/* Backward Differentiation Formula and the use of a Newton iteration */
	cvode_mem = CVodeCreate(CV_BDF, iData->sunctx);
	if (util_check_flag((void *)cvode_mem, "CVodeCreate", 0, comp)) goto fail;

	/* initialize the integrator memory and specify the
	   user's right hand side function in y'=f(t,y), the inital time and
	   the initial dependent variable vector y */
	flag = CVodeInit(cvode_mem, jac_f, comp->time, iData->y);
	if (util_check_flag(&flag, "CVodeInit", 1, comp)) goto fail;

	/* need to provide the context from FMI */
	CALL_SET(CVodeSetUserData, comp);
	CALL_SET(CVodeSetMonitorFn, MyMonitorFn);
	CALL_SET(CVodeSetMonitorFrequency, 1);

	/* specify the relative and absolute tolerances */
	iData->abstol = N_VNew_Serial((long)comp->nStates, iData->sunctx);
	if (util_check_flag((void *)(iData->abstol), "N_VNew_Serial", 0, comp)) goto fail;
	iData->reltol = N_VNew_Serial((long)comp->nStates, iData->sunctx);
	if (util_check_flag((void *)(iData->reltol), "N_VNew_Serial", 0, comp)) goto fail;
	abstol_data = N_VGetArrayPointer(iData->abstol);
	reltol_data = N_VGetArrayPointer(iData->reltol);
	for (i = 0; i < comp->nStates; i++) {
		realtype nom = comp->statesNominal[i];
		if (nom == 0) nom = 1;
		if (nom >= 0) {
			abstol_data[i] = relTol * nom;
			reltol_data[i] = relTol;
		} else {
			abstol_data[i] = relTol * (-nom);
			reltol_data[i] = 0.0;
		}
	}
	CALL_SET(CVodeWFtolerances, cvEwtSetVV);

	/* specify the safety factor used in the nonlinear convergence test */
	CALL_SET(CVodeSetNonlinConvCoef, NON_LINEAR_CONV_TEST_COEFF);

	/* specify the root function to handle event indicators */
	CALL_SET2(CVodeRootInit, (long)comp->nCross, g);

	/* specify step event detection function */
	CALL_SET(DSCVodeStepRootInit, check_step_event);

	nGroups = (size_t) QJacobianCG_[0];
	jac_setup(nGroups);

	{
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
		DYNPropagateDidToThread(comp->did);
		/* Check if SuperLU sparse solver is to be used and compute number non-zero elements */
		DYNPropagateDidToThread(comp->did);
		EXCEPTION_TRY
		const int nz = EnableSparse((int)comp->nStates, &(iData->sparseData));
		int nsparse = 0;
		if (nz)	{
			/* Compute Jacobian structure data to be used for sparse Jacobian evaluation */
			int band_width = PrepareSparse(comp, &(iData->sparseData), (int) comp->nStates, nz);
			int nprocs = getNumProcsCvode(&(iData->sparseData), (int) comp->nStates, nz, band_width);
			if (nprocs <= 0) nprocs = 4;

			util_logger(comp, comp->instanceName, FMIOK, loggUndef,
				"Using SuperLU sparse solver on %d core%s for the integrator Jacobian.", nprocs, (nprocs > 1 ? "s" : ""));

			DSSetSparseFunctions(&iData->sparseData.functions);
			if (iData->sparseData.functions.sun_sparse_matrix && iData->sparseData.functions.sun_linsol_superlumt) {
				iData->A = (*iData->sparseData.functions.sun_sparse_matrix)((int)comp->nStates, (int)comp->nStates, nz, CSC_MAT, iData->sunctx);
				if (util_check_flag((void*)iData->A, "SUNSparseMatrix", 0, comp)) goto fail;
				iData->linearSolver = (*iData->sparseData.functions.sun_linsol_superlumt)(iData->y, iData->A, nprocs, iData->sunctx);
				if (util_check_flag((void*)iData->linearSolver, "SUNLinSol_SuperLUMT", 0, comp)) goto fail;
			} else
				util_logger(comp, comp->instanceName, FMIFatal, loggUndef, "SUNDIALS sparse functions not found.");
			iData->sparseData.nprocs = nprocs;
#else
		if (0){
		
#endif /* FMU_SOURCE_CODE_EXPORT */
		} else {
			iData->A = SUNDenseMatrix((int)comp->nStates, (int)comp->nStates, iData->sunctx);
			if (util_check_flag((void*)iData->A, "SUNDenseMatrix", 0, comp)) goto fail;

			iData->linearSolver = SUNLinSol_Dense(iData->y, iData->A, iData->sunctx);
			if (util_check_flag((void*)iData->linearSolver, "SUNLinSol_Dense", 0, comp)) goto fail;
		}

		/* Set linear solver */
		CALL_SET2(CVodeSetLinearSolver, iData->linearSolver, iData->A);
		/* use own Jacobian function to enable use of grouping */
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
		CALL_SET(CVodeSetJacFn, nz ? jac_JacobianSparse : jac_Jacobian);
#else
		CALL_SET(CVodeSetJacFn, jac_Jacobian);
#endif

#if !defined(FMU_SOURCE_CODE_EXPORT)
		nsparse = GetAdditionalFlags(23);
		if (nsparse)
			util_logger(comp, comp->instanceName, FMIOK, loggUndef, 
				"Using SuperLU sparse solver for %d system%s of equations.\n", nsparse, (nsparse > 1 ? "s" : ""));
#endif
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
		EXCEPTION_CATCH_ALL
			return integrationFatal;
		EXCEPTION_END;
#endif
	}

	/* set maximum number of internal steps for a time step */
	CALL_SET(CVodeSetMaxNumSteps, MAX_STEPS_BEFORE_REINIT);

	/* set maximum no. of nonlinear iterations */
	CALL_SET(CVodeSetMaxNonlinIters, MAX_NON_LIN_ITERS);

	/* set maximum number of error test failures permitted in attempting one step */
	CALL_SET(CVodeSetMaxErrTestFails, MAX_FAILURES);

	iData->tmp1 = N_VNew_Serial((long)comp->nStates, iData->sunctx);
	iData->tmp2 = N_VNew_Serial((long)comp->nStates, iData->sunctx);
	if (util_check_flag((void *)(iData->tmp1), "N_VNew_Serial", 0, comp) ||
		util_check_flag((void *)(iData->tmp2), "N_VNew_Serial", 0, comp)) {
			goto fail;
	}
	N_VConst(0.0,iData->tmp1);
	N_VConst(0.0,iData->tmp2);
	iData->cvode_mem = cvode_mem;
	iData->ewt = N_VNew_Serial((long)comp->nStates, iData->sunctx);
	if (util_check_flag((void *)(iData->ewt), "N_VNew_Serial", 0, comp)) goto fail;
	N_VConst(0.0,iData->ewt);
	CALL_SET2(CVodeSetErrHandlerFn, err_msg_handler, comp);

#ifdef FMU_VERBOSITY
	if (nGroups > 0) {
		util_logger(c, comp->instanceName, FMIOK, loggUndef,
			"grouping will be used when computing J (N = %d)", comp->nStates);
	} else {
		util_logger(c, comp->instanceName, FMIOK, loggUndef,
			"grouping will not be used when computing J (N = %d)", comp->nStates);
	}
#endif

	/*  turned out to be faster to set to 0 */
	comp->istruct->mSolverHandleEq = 0;

	comp->steadyStateReached = 0;

	/* initialize statistics */
	iData->stat.fCalls = 0;
	iData->stat.totTime = (float) clock();


	iData->stat.rejSteps = 0;
	iData->stat.rejIntSteps = 0;
	iData->stat.rejFCalls = 0;
	iData->stat.rejJacCalls = 0;

	iData->stat.maxOrder = 0;

#ifdef SAVE_STATE_SUNDIALS
	iData->cvode_called = 0;
#endif

	return integrationOK;

fail:
	if(integration_teardown(comp) == integrationFatal)
		return integrationFatal;
	return integrationError;
}

/* ------------------------------------------------------ */
DYMOLA_STATIC IntegrationStatus integration_teardown(FMIComponent c)
{
	Component* comp = (Component*) c;
	IntegrationStatus ret = integrationOK;
	if (comp == NULL || comp->iData == NULL) {
		return ret;
	}

#ifdef LOG_STATISTICS
	/* log statistics */
	if (comp->iData->cvode_mem != NULL) {
		realtype tolsfac = 0;
		int flag = 0;
		IntegrationData* iData = comp->iData;
		Statistics* stat = &(comp->iData->stat);

		stat->totTime = clock() - stat->totTime;
		stat->totTime /= CLOCKS_PER_SEC;

		updateIntegrationStatistics(comp,&comp->iData->stat);
		GET_STATISTIC(CVodeGetTolScaleFactor, tolsfac);

		util_logger(comp, comp->instanceName, FMIOK, loggStats,
			"Sundials CVode Statistics\n"
			"    Stop time                                : %.2f s\n"
			"    Simulation time                          : %.2f s\n"
			"    Number of external steps                 : %d\n"
			"    Number of internal steps                 : %d\n"
			"    Number of non-linear iterations          : %ld\n"
			"    Number of non-linear convergence failures: %ld\n"
			"    Number of f function evaluations         : %ld\n"
			"    Number of g function evaluations         : %ld\n"
			"    Number of Jacobian-evaluations (direct)  : %ld\n"
			"    Maximum integration order                : %d\n"
			"    Suggested tolerance scale factor         : %.1f\n"
			"    Grouping used                            : %s\n",
			comp->time, stat->totTime, stat->steps, stat->intSteps, stat->niters, stat->ncfails, 
			stat->fCalls, stat->ngevals, stat->njevals, stat->maxOrder, tolsfac,	nGroups > 0 ? "yes" : "no");
#if (FMI_VERSION >= FMI_2)
		util_logger(comp, comp->instanceName, FMIOK, loggUndef,
			"Rejected count\n"
			"    Number of external steps                 : %d\n"
			"    Number of internal steps                 : %d\n"
			"    Number of f function evaluations         : %d\n"
			"    Number of Jac function evaluations       : %d\n",
			stat->rejSteps, stat->rejIntSteps,
			stat->rejFCalls, stat->rejJacCalls);
#endif
	}
#endif /* LOG_STATISTICS */
	ret =free_data(comp, comp);
	return ret;
}

#ifdef SAVE_STATE_SUNDIALS
#include "cvode_impl.h"
#endif

/* ------------------------------------------------------ */
DYMOLA_STATIC IntegrationStatus integration_step(Component* comp, FMIReal* tout)
{
	IntegrationData* iData = comp->iData;
	void* cvode_mem = iData->cvode_mem;
	InterpolationData* ipData = comp->ipData;
	/* initialize in case tret needs to be reported before set by Sundials */
	realtype tret = comp->time;
	IntegrationStatus iStat = integrationOK;
	int done = 0;
	int current_steps_before_reinit = MAX_STEPS_BEFORE_REINIT;
	int accumulated_steps_before_reinit = MAX_STEPS_BEFORE_REINIT;
	const double mNextTimeEventIn = comp->dstruct->mNextTimeEvent;
	{ int flag;	CALL_SET(CVodeSetMaxNumSteps, MAX_STEPS_BEFORE_REINIT); }

	assert(comp->nStates > 0);
	assert(*tout > comp->time);

	while (!done) {
		int flag;

		/* store previous outputs for use in fmiGetRealOutputDerivatives */
		if (!util_refresh_cache(comp, iDemandOutput, "fetching current output", NULL)) {
			memcpy(ipData->outputsPrev, comp->outputs, comp->nOut * sizeof(FMIReal));
			ipData->timePrev = comp->time;
		}

		if (comp->ipData->useDerivatives && GetAdditionalFlags(25))
			CVodeSetStopTime(cvode_mem, *tout);

		flag = CVode(cvode_mem, *tout, iData->y, &tret, CV_NORMAL);
#ifdef SAVE_STATE_SUNDIALS
		iData->cvode_called = 1;
#endif
		if (comp->istruct)
			comp->istruct->mBlockUnblockSmoothCrossings = 2;
		switch (flag) {

		   case CV_SUCCESS:
			   done = 1;
			   break;

		   case CV_TOO_CLOSE:
			   /* Sundials simply gives up on finding initial step size if the next step after a restart is too small.
			   *  Must explicitly set initial step size as a workaround. */
			   {
				   realtype hcur;

				   flag = CVodeGetCurrentStep(cvode_mem, &hcur);
				   if (util_check_flag(&flag, "CVodeGetCurrentStep", 1, comp)) {
					   iStat = integrationError;
					   goto fail;
				   }
				   if (hcur == 0) {
					   /* next step size not yet computed */ 
					   /* somewhat arbitrary value but should never happen on sane usage */ 
					   hcur = 2 * UNIT_ROUNDOFF * (1 + SUNMAX(SUNRabs(*tout), SUNRabs(comp->time)));
				   }
				   util_logger(comp, comp->instanceName, FMIOK, loggUndef,
					   "Internal step too small at t = %f, setting initial step size explicitly to %.16e", comp->time, hcur);
				   CALL_SET(CVodeSetInitStep, hcur);
			   }
			   break;

		   case CV_TOO_MUCH_WORK:
			   {
				   /* CVode may get stuck with a small step size. It sometimes helps to reinitialize. 
				      The number of internal steps between reinitialization are successively increased. */
				   if (accumulated_steps_before_reinit < MAX_STEPS_TOTAL) {
					   int diff;
					   current_steps_before_reinit *= STEPS_BEFORE_REINIT_FACTOR;
					   accumulated_steps_before_reinit += current_steps_before_reinit;
					   diff = MAX_STEPS_TOTAL - accumulated_steps_before_reinit;
					   if (diff < 0) {
						   current_steps_before_reinit += diff;
						   accumulated_steps_before_reinit += diff;
					   }
					   fmiSetTime_(comp, tret);
			   		   if (iStat = integration_reinit(comp, 1)) {
						   goto fail;
					   }
					   CALL_SET(CVodeSetMaxNumSteps, current_steps_before_reinit);
				   } else {
					   util_check_flag(&flag, "CVode", 1, comp);
					   iStat = integrationError;
					   goto fail;
				   }
			   }
			   break;

		   case CV_ROOT_RETURN:
			   {
				   /* state or step event occurred */
				   FMIStatus status;
#if (FMI_VERSION >= FMI_2)
				   FMIBoolean terminateSimulation;
#else
				   FMIEventInfo eventInfo;
#endif
				   comp->anyNonEvent = FMIFalse;

				   integration_extrapolate_inputs(comp, tret);
				   fmiSetTime_(comp, tret);
#ifdef LOG_EVENTS
				   if (comp->istruct->mTriggerStepEvent != 0) {
					   util_logger(comp, comp->instanceName, FMIOK, loggUndef, "%.12f: step event", comp->time);
				   } else {
					   util_logger(comp, comp->instanceName, FMIOK, loggUndef,
						   "%.12f: state event", tret);
				   }
#endif
				   INT_RESULT_SAMPLE(FMITrue);
				   status = util_event_update(comp, FMIFalse, 
#if (FMI_VERSION >= FMI_2)					   
					   &terminateSimulation
#else					   
					   &eventInfo
#endif					  
					   );
				   if (status != FMIOK) {
					   iStat = integrationError;
					   goto fail;
				   }
				   INT_RESULT_SAMPLE(FMITrue);

#if (FMI_VERSION >= FMI_2)
				   if (terminateSimulation == FMITrue) {
#else
				   if (eventInfo.terminateSimulation == FMITrue) {
#endif
					   return integrationTerminate;
				   }

				   if (!comp->anyNonEvent) {
					   if (iStat = integration_reinit(comp, 1)) {
						   goto fail;
					   }
				   }

				   comp->istruct->mBlockUnblockSmoothCrossings = 1;

				   if (comp->dstruct->mNextTimeEvent != mNextTimeEventIn && comp->dstruct->mNextTimeEvent < *tout)
					   /* An event has revealed a new time event before tout, reduce tout */
					   *tout = comp->dstruct->mNextTimeEvent;

				   done = (tret == *tout);
			   }
			   break;

		   default:
				util_check_flag(&flag, "CVode", 1, comp);
				iStat = integrationError;
				goto fail;
		}
	}

	/* check if we are reasonably close to requested stop time */
	if (fabs(tret) - fabs(*tout) > SMALL_TIME_DEV(comp->time)) {
		util_logger(comp, comp->instanceName, FMIError, loggUndef,
			"Internal step error: tret = %.16e  !=  tout = %.16e", tret, *tout);
		iStat = integrationError;
		goto fail;
	}

	iData->stat.steps++;
	return integrationOK;

fail:
	return iStat;
}
#if (FMI_VERSION >= FMI_2)
DYMOLA_STATIC IntegrationStatus integration_step_return_at_event(Component* comp, FMIReal* tout, FMIBoolean handleEvent, FMIBoolean earlyReturn, FMIReal* tRet, FMIBoolean* anyEvent)
{
	IntegrationData* iData = comp->iData;
	void* cvode_mem = iData->cvode_mem;
	InterpolationData* ipData = comp->ipData;
	/* initialize in case tret needs to be reported before set by Sundials */
	realtype tret = comp->time;
	IntegrationStatus iStat = integrationOK;
	int done = 0;
	int current_steps_before_reinit = MAX_STEPS_BEFORE_REINIT;
	int accumulated_steps_before_reinit = MAX_STEPS_BEFORE_REINIT;
	const double mNextTimeEventIn = comp->dstruct->mNextTimeEvent;
	{ int flag;	CALL_SET(CVodeSetMaxNumSteps, MAX_STEPS_BEFORE_REINIT); }

	assert(comp->nStates > 0);
	assert(*tout > comp->time);

	while (!done) {
		int flag;

		/* store previous outputs for use in fmiGetRealOutputDerivatives */
		if (!util_refresh_cache(comp, iDemandOutput, "fetching current output", NULL)) {
			memcpy(ipData->outputsPrev, comp->outputs, comp->nOut * sizeof(FMIReal));
			ipData->timePrev = comp->time;
		}

		flag = CVode(cvode_mem, *tout, iData->y, &tret, CV_NORMAL);
#ifdef SAVE_STATE_SUNDIALS
		iData->cvode_called = 1;
#endif
		if (comp->istruct)
			comp->istruct->mBlockUnblockSmoothCrossings = 2;
		switch (flag) {

		   case CV_SUCCESS:
			   done = 1;
			   break;

		   case CV_TOO_CLOSE:
			   /* Sundials simply gives up on finding initial step size if the next step after a restart is too small.
			   *  Must explicitly set initial step size as a workaround. */
			   {
				   realtype hcur;

				   flag = CVodeGetCurrentStep(cvode_mem, &hcur);
				   if (util_check_flag(&flag, "CVodeGetCurrentStep", 1, comp)) {
					   iStat = integrationError;
					   goto fail;
				   }
				   if (hcur == 0) {
					   /* next step size not yet computed */ 
					   /* somewhat arbitrary value but should never happen on sane usage */ 
					   hcur = 2 * UNIT_ROUNDOFF * (1 + SUNMAX(SUNRabs(*tout), SUNRabs(comp->time)));
				   }
				   util_logger(comp, comp->instanceName, FMIOK, loggUndef,
					   "Internal step too small at t = %f, setting initial step size explicitly to %.16e", comp->time, hcur);
				   CALL_SET(CVodeSetInitStep, hcur);
			   }
			   break;

		   case CV_TOO_MUCH_WORK:
			   {
				   /* CVode may get stuck with a small step size. It sometimes helps to reinitialize.
					  The number of internal steps between reinitialization are successively increased. */
				   if (accumulated_steps_before_reinit < MAX_STEPS_TOTAL) {
					   int diff;
					   current_steps_before_reinit *= STEPS_BEFORE_REINIT_FACTOR;
					   accumulated_steps_before_reinit += current_steps_before_reinit;
					   diff = MAX_STEPS_TOTAL - accumulated_steps_before_reinit;
					   if (diff < 0) {
						   current_steps_before_reinit += diff;
						   accumulated_steps_before_reinit += diff;
					   }
					   fmiSetTime_(comp, tret);
			   		   if (iStat = integration_reinit(comp, 1)) {
						   goto fail;
					   }
					   CALL_SET(CVodeSetMaxNumSteps, current_steps_before_reinit);
				   } else {
					   util_check_flag(&flag, "CVode", 1, comp);
					   iStat = integrationError;
					   goto fail;
				   }
			   }
			   break;

		   case CV_ROOT_RETURN:
		   {
			   /* state or step event occurred */

			   integration_extrapolate_inputs(comp, tret);
			   fmiSetTime_(comp, tret);
			   *tRet = (FMIReal)tret;
			   *anyEvent = FMITrue;
#ifdef LOG_EVENTS
			   if (comp->istruct->mTriggerStepEvent != 0) {
				   util_logger(comp, comp->instanceName, FMIOK, loggUndef, "%.12f: step event", comp->time);
			   } else {
				   util_logger(comp, comp->instanceName, FMIOK, loggUndef,
					   "%.12f: state event", tret);
			   }
#endif
			   INT_RESULT_SAMPLE(FMITrue);

			   if (handleEvent) {
				   FMIStatus status;
				   FMIBoolean terminateSimulation;
				   /* Handle the event as in integrator_step */
				   status = util_event_update(comp, FMIFalse,
					   &terminateSimulation
				   );
				   if (status != FMIOK) {
					   iStat = integrationError;
					   goto fail;
				   }
				   INT_RESULT_SAMPLE(FMITrue);

				   if (terminateSimulation == FMITrue) {
					   return integrationTerminate;
				   }

				   if (!comp->anyNonEvent) {
					   if (iStat = integration_reinit(comp, 1)) {
						   goto fail;
					   }
				   }

			   }
			   comp->istruct->mBlockUnblockSmoothCrossings = 1;
			   if (earlyReturn) {
				   /* Return at event point */
				   
				   return integrationEvent;
			   } else {
				   if (comp->dstruct->mNextTimeEvent != mNextTimeEventIn && comp->dstruct->mNextTimeEvent < *tout)
					   /* An event has revealed a new time event before tout, reduce tout */
					   *tout = comp->dstruct->mNextTimeEvent;
				   break;
			   }
			   done = (tret == *tout);
		   }

		   default:
				util_check_flag(&flag, "CVode", 1, comp);
				iStat = integrationError;
				goto fail;
		}
	}

	/* check if we are reasonably close to requested stop time */
	if (fabs(tret) - fabs(*tout) > SMALL_TIME_DEV(comp->time)) {
		util_logger(comp, comp->instanceName, FMIError, loggUndef,
			"Internal step error: tret = %.16e  !=  tout = %.16e", tret, *tout);
		goto fail;
	}
	*tRet = (FMIReal) tret;
	iData->stat.steps++;
	return integrationOK;

fail:
	*tRet = (FMIReal) tret;
	return integrationError;
}
#endif


DYMOLA_STATIC void updateIntegrationStatistics(Component* comp, Statistics* stat){

	long nniters, nncfails, ngevals, njevals, nfevals, nsteps;
	int flag;
	GET_STATISTIC(CVodeGetNumRhsEvals, nfevals);
	stat->fCalls += nfevals;
	GET_STATISTIC(CVodeGetNumNonlinSolvIters, nniters);
	stat->niters += nniters;
	GET_STATISTIC(CVodeGetNumNonlinSolvConvFails, nncfails);
	stat->ncfails += nncfails;
	GET_STATISTIC(CVodeGetNumGEvals, ngevals);
	stat->ngevals += ngevals;
	GET_STATISTIC(CVodeGetNumJacEvals, njevals);	
	stat->njevals += njevals;
	GET_STATISTIC(CVodeGetNumSteps, nsteps);
	stat->intSteps += nsteps;
}

/* ------------------------------------------------------ */
DYMOLA_STATIC IntegrationStatus integration_reinit(Component* comp, int updateStatistics)
{
	int flag;

	assert(comp->nStates > 0);
  
	if (updateStatistics) {
		updateIntegrationStatistics(comp, &comp->iData->stat);
	}

	flag = CVodeReInit(comp->iData->cvode_mem, comp->time, comp->iData->y);

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
	DYNPropagateDidToThread(comp->did);
	EXCEPTION_TRY
	if (comp->iData->sparseData.nnz && comp->iData->sparseData.functions.ds_superlumt_reinit)
		(*comp->iData->sparseData.functions.ds_superlumt_reinit)(comp->iData->linearSolver);
	EXCEPTION_CATCH_ALL
		return integrationFatal;
	EXCEPTION_END;

#endif

	if (util_check_flag(&flag, "CVodeReInit", 1, comp)) return integrationError;
	comp->reinitCvode = 0;
	return integrationOK;
}

/* ------------------------------------------------------ */
DYMOLA_STATIC void integration_sync_extrapolation_input(Component* comp, size_t ix)
{
	if (comp->ipData != NULL && comp->ipData->inputsT0 != NULL) {
		comp->ipData->inputsT0[ix] = comp->inputs[ix];
	}
}

/* ------------------------------------------------------ */
DYMOLA_STATIC void integration_extrapolate_inputs(Component* comp, double t)
{
#if (FMI_VERSION >= FMI_3)
	if (comp->intermediateUpdate && comp->nRequiredIntermediateInputs>0) {
		fmi3Boolean earlyReturnRequested = FMIFalse;
		fmi3Float64 earlyReturnTime = FMIFalse;
		/* Allowed to set inputs - not to get variables, and step not completed and early return not allowed */
		(*(comp->intermediateUpdate))(comp->ie, t, FMITrue, FMIFalse, FMIFalse, FMIFalse, &earlyReturnRequested, &earlyReturnTime);
	} else
#endif
	if (comp->ipData->useDerivatives) {
		size_t i;
		double dt = (t - comp->ipData->derivativeTime);
		for (i = 0; i < comp->nIn; i++) {
			comp->inputs[i] = comp->ipData->inputsT0[i] + comp->ipData->inputDerivatives[i] * dt;
		}
	}
}

#if (FMI_VERSION >= FMI_2)
/* ------------------------------------------------------ */
DYMOLA_STATIC FMIStatus integration_get_state(Component* source, Component* target)
{
	if (source->nStates > 0) {
		if (source->iData != NULL) {
			/* possible to reuse iData allocation from target since no sizes of sub parts can have changed */
			Statistics stat = source->iData->stat;
			if (clone_data(target, source) != integrationOK) {
				goto mem_fail;
			}
			if (clone_ipData(target, source) != FMIOK)
				goto mem_fail;
			updateIntegrationStatistics(source,&stat);
			target->iData->stat = stat;
		} else if (target->iData != NULL) {
			/* free old iData to avoid memory leak */
			if(free_data(source, target) == integrationFatal)
				return FMIFatal;
		}
	}
	
	return FMIOK;

mem_fail:
	util_logger(source, source->instanceName, FMIError, loggMemErr, "memory allocation failed");
	if(free_data(source, target)== integrationFatal)
		return FMIFatal;
	return util_error(source);
}

/* ------------------------------------------------------ */
DYMOLA_STATIC FMIStatus integration_set_state(Component* source, Component* target)
{
	if (target->nStates == 0) {
		// may occur when saving FMU states into uninitialized components
		// as in integration_setup, use dummy state to simplify logic
		target->nStates = 1;
	}

	if (source->iData != NULL) {
		
		if (clone_data(target, source) != integrationOK) {
			goto mem_fail;
		}
		if (clone_ipData(target, source) != FMIOK){
				goto mem_fail;
		}

		/* count of rejected steps before copying statistics */
		source->iData->stat.rejSteps += target->iData->stat.steps - source->iData->stat.steps;
		source->iData->stat.rejIntSteps += target->iData->stat.intSteps - source->iData->stat.intSteps;
		source->iData->stat.rejFCalls += target->iData->stat.fCalls - source->iData->stat.fCalls;

		memcpy(&target->iData->stat, &source->iData->stat, sizeof(Statistics));

#ifdef SAVE_STATE_SUNDIALS
		integration_reinit(target, 1);
		/* code fetched from CVAckpntGet and modified */
		{
			CVodeMem cv_mem = (CVodeMem)target->iData->cvode_mem;
			CVodeCheckPointData* ck_mem = &target->iData->ck_mem;
			N_Vector* cv_zn = cv_mem->cv_zn;
			N_Vector* ck_zn = ck_mem->ck_zn;
			int q = cv_mem->cv_q;
			int qmax = cv_mem->cv_qmax;
			int j;

			/* Copy parameters from check point data structure */
			cv_mem->cv_nst = ck_mem->ck_nst;
			cv_mem->cv_tretlast = ck_mem->ck_tretlast;
			cv_mem->cv_q = ck_mem->ck_q;
			cv_mem->cv_qprime = ck_mem->ck_qprime;
			cv_mem->cv_qwait = ck_mem->ck_qwait;
			cv_mem->cv_L = ck_mem->ck_L;
			cv_mem->cv_gammap = ck_mem->ck_gammap;
			cv_mem->cv_h = ck_mem->ck_h;
			cv_mem->cv_hprime = ck_mem->ck_hprime;
			cv_mem->cv_hscale = ck_mem->ck_hscale;
			cv_mem->cv_eta = ck_mem->ck_eta;
			cv_mem->cv_etamax = ck_mem->ck_etamax;
			cv_mem->cv_saved_tq5 = ck_mem->ck_saved_tq5;

			/* Copy the arrays from check point data structure */
			for (j = 0; j <= q; j++) N_VScale(1.0, ck_zn[j], cv_zn[j]);
			if (q < qmax) N_VScale(1.0, ck_zn[qmax], cv_zn[qmax]);

			for (j = 0; j <= L_MAX; j++)     cv_mem->cv_tau[j] = ck_mem->ck_tau[j];
			for (j = 0; j <= NUM_TESTS; j++) cv_mem->cv_tq[j] = ck_mem->ck_tq[j];
			for (j = 0; j <= q; j++)         cv_mem->cv_l[j] = ck_mem->ck_l[j];
		}
#endif
	}
	else if (target->iData == NULL) {
		/* need to setup integration data from scratch */
		IntegrationStatus ret = integrationOK;
		switch(integration_setup(target, source->relativeTolerance)){
		case integrationOK:
			break;
		case integrationError:
			return util_error(target);
		case integrationFatal:
		default:
			return FMIFatal;
		}
	}

/* for explicit saving of Sundials states, we already re-initialized _before_ restoring */
#ifndef SAVE_STATE_SUNDIALS
	integration_reinit(target,0);
#endif
	return FMIOK;

mem_fail:
	util_logger(target, target->instanceName, FMIError, loggMemErr, "memory allocation failed");
	return util_error(source);
}

/* ------------------------------------------------------ */
DYMOLA_STATIC IntegrationStatus integration_free_state(Component* comp, Component* target)
{
	IntegrationStatus ret = integrationOK;
	if (target->nStates > 0) {
#ifdef SAVE_STATE_SUNDIALS
		/* free cloned Sundials internal data */
		CVodeCheckPointData* ck_mem = &target->iData->ck_mem;
		N_Vector* ck_zn = ck_mem->ck_zn;

		int q = ck_mem->ck_q;
		int j;

		for (j = 0; j < q; j++) {
			N_VDestroy(ck_zn[j]);
		}

		if (q < ck_mem->ck_qmax) {
			N_VDestroy(ck_zn[ck_mem->ck_qmax]);
		}
#endif
		ret = free_data(comp, target);
	}
	integration_free_ipData(target);
	return ret;
}

#endif /* FMI_2 */


/* ----------------- local function definitions ----------------- */


static FMIStatus clone_ipData(Component* target, Component* source)
{

	InterpolationData* ipData = target->ipData;

	if(ipData == NULL){
		FMIStatus s = integration_allocate_ipData(target);
		if(s == FMIError || s == FMIFatal)
			goto mem_fail;
		ipData = target->ipData;
	}
	/* handle input derivative data */
	ipData->useDerivatives = source->ipData->useDerivatives;
	if (ipData->useDerivatives) {
		size_t nu = source->nIn;
		assert(source->ipData->inputDerivatives != NULL);
		assert(nu > 0);
		memcpy(ipData->inputDerivatives, source->ipData->inputDerivatives, nu * sizeof(FMIReal));
		memcpy(ipData->inputsT0, source->ipData->inputsT0, nu * sizeof(FMIReal));
		ipData->derivativeTime = source->ipData->derivativeTime;
	}

	/* handle ouput derivative data */
	{
		size_t ny = source->nOut;
		assert(ipData->outputsPrev != NULL);
		memcpy(ipData->outputsPrev, source->ipData->outputsPrev, ny * sizeof(FMIReal));
		ipData->timePrev = source->ipData->timePrev;
	}
	return FMIOK;
mem_fail:
	util_logger(source, source->instanceName, FMIError, loggMemErr, "memory allocation failed");
	integration_free_ipData(target);
	return FMIError;
}

static IntegrationStatus clone_data(Component* target, Component* source)
{
	IntegrationData* iData;
	
	assert(target->nStates > 0);
	assert(source->nStates > 0);
	assert(source->iData != NULL);

	iData = target->iData;
	if (iData == NULL) {
		IntegrationStatus ret;
		ret = integration_setup(target, 1e-4);
		if(ret != integrationOK)
			return ret;
		iData = target->iData;
	}

	/* don't use N_V_COPY since it also copies ops member */
	N_VScale(1.0, source->iData->abstol, iData->abstol);
	N_VScale(1.0, source->iData->reltol, iData->reltol);
	N_VScale(1.0, source->iData->ewt, iData->ewt);
	N_VScale(1.0, source->iData->tmp1, iData->tmp1);
	N_VScale(1.0, source->iData->tmp2, iData->tmp2);
	
	CopySparseFixData(source->nStates, &iData->sparseData, &source->iData->sparseData);

#ifndef FMU_SOURCE_CODE_EXPORT
	if (source->iData->steadyStateUtils) {
		extern struct SteadyStateUtils* CopySteadyStateUtils(struct SteadyStateUtils* utils);
		iData->steadyStateUtils = CopySteadyStateUtils(source->iData->steadyStateUtils);
	}
#endif

#ifdef SAVE_STATE_SUNDIALS
	/* code fetched from CVAckpntNew and modified */
	if (iData->cvode_called)
	{
		CVodeMem cv_mem = (CVodeMem)iData->cvode_mem;
		CVodeCheckPointData* ck_mem = &iData->ck_mem;
		N_Vector* cv_zn = cv_mem->cv_zn;
		N_Vector* ck_zn = ck_mem->ck_zn;
		int q = cv_mem->cv_q;
		int qmax = cv_mem->cv_qmax;
		int j;

		if (!target->allocDone) {
			/* Test if we need to allocate space for the last zn.
			* NOTE: zn(qmax) may be needed for a hot restart, if an order
			* increase is deemed necessary at the first step after a check point */
			for (j=0; j<=q; j++) {
				ck_zn[j] = N_VClone(cv_mem->cv_tempv);
				if (ck_zn[j] == NULL) {
					int jj;
					for (jj=0; jj<j; jj++) N_VDestroy(ck_zn[jj]);
					goto mem_fail;
				}
			}

			if (q < qmax) {
				ck_zn[qmax] = N_VClone(cv_mem->cv_tempv);
				if (ck_zn[qmax] == NULL) {
					int jj;
					for (jj=0; jj<=q; jj++) N_VDestroy(ck_zn[jj]);
					goto mem_fail;
				}
			}
		}

		/* Load check point data from cv_mem */

		for (j=0; j<=q; j++) N_VScale(1.0, cv_zn[j], ck_zn[j]);
		if ( q < qmax ) N_VScale(1.0, cv_zn[qmax], ck_zn[qmax]);

		/* TODO: try memcpy */
		for (j=0; j<=L_MAX; j++)     ck_mem->ck_tau[j] = cv_mem->cv_tau[j];
		for (j=0; j<=NUM_TESTS; j++) ck_mem->ck_tq[j] = cv_mem->cv_tq[j];
		for (j=0; j<=q; j++)         ck_mem->ck_l[j] = cv_mem->cv_l[j];

		ck_mem->ck_nst       = cv_mem->cv_nst;
		ck_mem->ck_tretlast  = cv_mem->cv_tretlast;
		ck_mem->ck_q         = cv_mem->cv_q;
		ck_mem->ck_qmax         = cv_mem->cv_qmax;
		ck_mem->ck_qprime    = cv_mem->cv_qprime;
		ck_mem->ck_qwait     = cv_mem->cv_qwait;
		ck_mem->ck_L         = cv_mem->cv_L;
		ck_mem->ck_gammap    = cv_mem->cv_gammap;
		ck_mem->ck_h         = cv_mem->cv_h;
		ck_mem->ck_hprime    = cv_mem->cv_hprime;
		ck_mem->ck_hscale    = cv_mem->cv_hscale;
		ck_mem->ck_eta       = cv_mem->cv_eta;
		ck_mem->ck_etamax    = cv_mem->cv_etamax;
		ck_mem->ck_saved_tq5 = cv_mem->cv_saved_tq5;
	}
	/* End of: code fetched from CVAckpntNew and modified */
#endif

	return integrationOK;
#ifdef SAVE_STATE_SUNDIALS
mem_fail:
	util_logger(source, source->instanceName, FMIError, loggMemErr, "memory allocation failed");
	FREE_MEMORY(target->iData);
#ifndef FMU_SOURCE_CODE_EXPORT
	if (iData->steadyStateUtils) {
		extern void FreeSteadyStateUtils(struct SteadyStateUtils* utils);
		FreeSteadyStateUtils(iData->steadyStateUtils);
		iData->steadyStateUtils = NULL;
	}
#endif
	return integrationError;
#endif
}

DYMOLA_STATIC FMIStatus integration_allocate_ipData(Component* comp){

	if(!comp)
		return FMIFatal;
	if(!comp->ipData){

		comp->ipData = (InterpolationData*) ALLOCATE_MEMORY(1, sizeof(InterpolationData));
		if( comp->ipData == NULL) {
			goto fail;
		}

		comp->ipData->inputDerivatives = (FMIReal*) ALLOCATE_MEMORY(comp->nIn + 1, sizeof(FMIReal));
		comp->ipData->inputsT0 = (FMIReal*) ALLOCATE_MEMORY(comp->nIn + 1, sizeof(FMIReal));
		comp->ipData->outputsPrev = (FMIReal*) ALLOCATE_MEMORY(comp->nOut + 1, sizeof(FMIReal));

		if (comp->ipData->inputDerivatives == NULL || comp->ipData->inputsT0 == NULL || comp->ipData->outputsPrev == NULL) {
				goto fail;
		}

		comp->ipData->useDerivatives = 0;
	}
	return FMIOK;
fail:
	util_logger(comp, comp->instanceName, FMIFatal, loggMemErr, "memory allocation failed\n");
	return FMIFatal;
}

DYMOLA_STATIC void integration_free_ipData(Component* comp){
	if(comp && comp->ipData){
		InterpolationData* ipData = comp->ipData;
		FREE_MEMORY(ipData->outputsPrev);
		FREE_MEMORY(ipData->inputDerivatives);
		FREE_MEMORY(ipData->inputsT0);
		FREE_MEMORY(comp->ipData);
	}
}

/* ------------------------------------------------------ */
static IntegrationStatus free_data(Component* comp, Component* target)
{
	IntegrationData* iData;

	if (target == NULL || target->iData == NULL) {
		return integrationOK;
	}
	iData = target->iData;

	if (iData->cvode_mem)
	{ 
		CVodeFree(&iData->cvode_mem);
		if (iData->A)
			SUNMatDestroy(iData->A);
		iData->A = NULL;
		if (iData->linearSolver) {
#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
			DYNPropagateDidToThread(comp->did);
			EXCEPTION_TRY
			if (iData->sparseData.nnz && iData->sparseData.functions.ds_superlumt_free_global_data)
				(*iData->sparseData.functions.ds_superlumt_free_global_data)(iData->linearSolver);
			EXCEPTION_CATCH_ALL
				return integrationFatal;
			EXCEPTION_END;
#endif
			SUNLinSolFree(iData->linearSolver);
		}
		iData->linearSolver = NULL;
	}

	if (iData->y != NULL)      N_VDestroy_Serial(target->iData->y);
	if (iData->abstol != NULL) N_VDestroy_Serial(target->iData->abstol);
	if (iData->reltol != NULL) N_VDestroy_Serial(target->iData->reltol);
	if (iData->ewt != NULL)    N_VDestroy_Serial(target->iData->ewt);
	if (iData->tmp1 != NULL)   N_VDestroy_Serial(target->iData->tmp1);
	if (iData->tmp2 != NULL)   N_VDestroy_Serial(target->iData->tmp2);

	if (iData->sunctx)
		SUNContext_Free(&iData->sunctx);
	iData->sunctx = NULL;

	if (iData->sparseData.nnz) {
		FREE_MEMORY(iData->sparseData.colPtrs);
		FREE_MEMORY(iData->sparseData.index);
		memset(&iData->sparseData,0,sizeof(iData->sparseData));
	}
#ifndef FMU_SOURCE_CODE_EXPORT
	if (iData->steadyStateUtils) {
		extern void FreeSteadyStateUtils(struct SteadyStateUtils* utils);
		FreeSteadyStateUtils(iData->steadyStateUtils);
		iData->steadyStateUtils = NULL;
	}
#endif
	FREE_MEMORY(target->iData);
	return integrationOK;
}

/* ------------------------------------------------------ */
static int g(realtype t, N_Vector y, realtype *gout, void *user_data)
{
	FMIComponent* c = (FMIComponent*) user_data;
	Component* comp = (Component*) c;
	int retval = 0;

	/* temporarily change time, states and inputs to be able to reuse fmiGetEventIndicators */
	FMIReal time = comp->time;
	FMIReal* states = comp->states;

	assert(comp->nStates > 0);
	comp->states = N_VGetArrayPointer(y);

	integration_extrapolate_inputs(comp, t);

	comp->time = t;
	comp->icall = 0;
	if (fmiGetEventIndicators_(c, gout, comp->nCross) != FMIOK) {
		retval= -1;
	}

	/* restore time, states and inputs */
	integration_extrapolate_inputs(comp, time);
	comp->states = states;
	comp->time = time;
	return retval;
}

/* ------------------------------------------------------ */
static int check_step_event(void* user_data) {
	Component* comp = (Component*) user_data;
	comp->istruct->mBlockUnblockSmoothCrossings = 2;
	return (comp->istruct->mTriggerStepEvent != 0) || steady_state_reached(comp) || max_run_time_reached(comp);
}

/* ------------------------------------------------------ */
static void err_msg_handler(int error_code, const char *module, const char *function,
					 char *msg, void *eh_data)
{
	Component* comp = (Component*) eh_data;
	char * CVodeFlagName = CVodeGetReturnFlagName(error_code);
	util_logger(comp, comp->instanceName, FMIWarning, loggUndef, "%s: %s failed with %s:\n %s",
		module, function,  CVodeFlagName, msg);
	free(CVodeFlagName);
}

/* ------------------------------------------------------ */
/*
* cvEwtSetVV
*
* Function used to set the weight vector for the weighted norm. This allows elementwise relTol. Weights are set according to:
*
*	struct CVGodessData* comp = (struct CVGodessData*) user_data;
*  	ewt[i] = 1 / (comp->relTol[i] * SUNRabs(y[i]) + comp->absTol[i]), i=0,...,neq-1.
*
* - Erik Henningsson, 2017-05-30
*/
static int cvEwtSetVV(N_Vector y, N_Vector ewt, void *user_data) {

	Component* comp = (Component*) user_data; // user_data points to Component here
	IntegrationData* iData = comp->iData;
	int n;

	if (iData->abstol == NULL || iData->reltol == NULL) return -1;
	n = NV_LENGTH_S(y);
	if (NV_LENGTH_S(ewt) != n || NV_LENGTH_S(iData->reltol) != n || NV_LENGTH_S(iData->abstol) != n) return -1;

	N_VAbs(y, ewt);
	N_VProd(iData->reltol, ewt, ewt);
	N_VLinearSum(1.0, ewt, 1.0, iData->abstol, ewt);
	if (N_VMin(ewt) <= 0.0) return -1;
	N_VInv(ewt, ewt);
	return 0;
}

/* ------------------------------------------------------ */

#ifndef FMU_SOURCE_CODE_EXPORT
static int PrepareSteadyStateDerivativesToSkip(Component* comp)
{
	if (comp && comp->iData && comp->basetype) {

		extern int HasInitializedSteadyStateDerivativesToSkip_Internal(struct SteadyStateUtils* utils);
		extern int PrepareSteadyStateDerivativesToSkip_Internal(const int n, int* const ignored_derivatives, 
																const int has_ignored_derivatives, struct SteadyStateUtils* utils);

		const size_t n = comp->nStates;
		struct SteadyStateUtils* utils = comp->iData->steadyStateUtils;

		if (HasInitializedSteadyStateDerivativesToSkip_Internal(utils))
			return PrepareSteadyStateDerivativesToSkip_Internal((int) n, NULL, 0, utils);

		else {
			size_t i;
			int has_ignored_derivatives = 0;

			int* ignored_derivatives = (int*) ALLOCATE_MEMORY(n, sizeof(int));
			if (!ignored_derivatives) return 0;

			for (i = 0; i < n; ++i) {
				if (comp->basetype[i] & dsIsLowOrder) {
					ignored_derivatives[i] = 1;
					has_ignored_derivatives = 1;
				} else
					ignored_derivatives[i] = 0;
			}

			return PrepareSteadyStateDerivativesToSkip_Internal((int) n, ignored_derivatives, -has_ignored_derivatives, utils);
		}
	}

	return 0;
}
#endif

static int steady_state_reached(Component* comp) {
	if (!comp || GetAdditionalFlags(22))
		return FMIFalse;
	else if (comp->steadyStateReached)
		return FMITrue;
	else {
		const double detection_start_time = GetAdditionalReals(5);
		if (comp->time < detection_start_time)
			return FMIFalse;
	}
	if (GetAdditionalFlags(9) && comp->iData) {
		IntegrationData* iData = comp->iData;
		double* abstol_data = N_VGetArrayPointer(iData->abstol);
		double* reltol_data = N_VGetArrayPointer(iData->reltol);
		if (abstol_data && reltol_data) {
			const double tolerance_flag = GetAdditionalReals(2);
			const double default_dynamic_tolerance = GetAdditionalFlags(15) ? 1.0e-4 : 2.0e-2;
			const double relativeTolerance = comp->relativeToleranceDefined ? comp->relativeTolerance : cvodeTolerance;
#ifdef FMU_SOURCE_CODE_EXPORT
			const double tolerance = (tolerance_flag > 0 ? tolerance_flag : (default_dynamic_tolerance / (comp->tStop - comp->tStart)));
			const double quotient = tolerance / (relativeTolerance > 0.0 ? relativeTolerance : 0.0001) / 2.0;
			unsigned i;
			for (i = 0; i < comp->nStates; ++i) {
				const double limit = quotient * (abstol_data[i] + Dymola_abs(comp->states[i]) * reltol_data[i]);
				if (Dymola_abs(comp->derivatives[i]) > limit)
					return comp->steadyStateReached = FMIFalse;
			}
			return comp->steadyStateReached = FMITrue;
#else		
			{
				extern struct SteadyStateUtils* InitializeSteadyStateUtils(const int n, void* (*alloc_ptr)(size_t, size_t),
																		   void (*dealloc_ptr)(void*), const int num_closing_in_required);
				extern int CheckSteadyState_Internal(const int static_simulation, const int final_call,
													 const int has_ignored_derivatives, const double tolerance_flag,
													 const double default_dynamic_tolerance, const double t0,
													 const double tend, const double interval,
													 const double tol, const double* const x,
													 const double* const xd, const double* const scale,
													 const double* const abs_tol, const double* const rel_tol,
													 const int n, const int steady_state_reached,
													 struct SteadyStateUtils* utils, const double time);
				if (!iData->steadyStateUtils)
					iData->steadyStateUtils = InitializeSteadyStateUtils((int) comp->nStates, ALLOCATE_MEMORY_PTR, FREE_MEMORY_PTR, GetAdditionalFlags(9) ? 1 : 0);
				{
					const int hasIgnoredDerivatives = GetAdditionalFlags(21) && PrepareSteadyStateDerivativesToSkip(comp);
					return comp->steadyStateReached = CheckSteadyState_Internal(0, 0, hasIgnoredDerivatives, tolerance_flag,
						default_dynamic_tolerance, comp->tStart, comp->tStop, 0.0, relativeTolerance, comp->states, comp->derivatives,
						NULL, abstol_data, reltol_data, (int) comp->nStates, comp->steadyStateReached, iData->steadyStateUtils, comp->time);
				}
			}
#endif
		}
	}
	return comp->steadyStateReached = FMIFalse;
}

/* ------------------------------------------------------ */
static int max_run_time_reached(Component* comp) {
	if (!comp) return FMIFalse;
#ifndef FMU_SOURCE_CODE_EXPORT
	if (!comp->maxRunTimeReached) {
		const double max_run_time = GetAdditionalReals(4);
		if (max_run_time > 0.0) {
			extern double dymosimtime2_(int action, double* tbegin);
			if (dymosimtime2_(1, &comp->oneSimulationTotalTimerStart) >= max_run_time)
				return comp->maxRunTimeReached = FMITrue;
		}
	}
#endif
	return comp->maxRunTimeReached = FMIFalse;
}

static void InitializeSparseFixData(SparseFixData* sparseData)
{
	if (!sparseData) return;

	sparseData->nnz = sparseData->nGroups = sparseData->nprocs = sparseData->sparseEnabledVar = 0;
	sparseData->colPtrs = sparseData->index = NULL;

	sparseData->functions.sun_sparse_matrix = NULL;
	sparseData->functions.sun_linsol_superlumt = NULL;
	sparseData->functions.sun_sparse_matrix_index_pointers = NULL;
	sparseData->functions.sun_sparse_matrix_index_values = NULL;
	sparseData->functions.sun_sparse_matrix_data = NULL;
	sparseData->functions.ds_superlumt_free_global_data = NULL;
	sparseData->functions.ds_superlumt_reinit = NULL;
}

static void CopySparseFixData(const size_t nStates, SparseFixData* target, const SparseFixData* source)
{
	if (!target || !source) return;

	target->nnz = source->nnz;
	target->nGroups = source->nGroups;
	target->nprocs = source->nprocs;
	target->sparseEnabledVar = source->sparseEnabledVar;
	if (source->nnz) {
		size_t i;
		for (i = 0; i < nStates+1; ++i)
			target->colPtrs[i] = source->colPtrs[i];
		for (i = 0; i < nStates * source->nGroups; ++i)
			target->index[i] = source->index[i];
	}
}

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
/* checks if sparse solver is to be used and returns number of nonzero elements */
static int EnableSparse(int nx, SparseFixData *sparseData) {
	int nGroups = QJacobianCG_[0];
	int sparse_enabled = 0;
	if (!sparseData)
		return 0;
	sparse_enabled = GetAdditionalFlags(1);
	sparseData->sparseEnabledVar = sparse_enabled;
	if (!sparse_enabled)
		return 0;
	if (nGroups > 0) {
		// Count non-zero elements
		int i;
		int group_nr, group_ix = 1;
		int nz = 0;
		for (group_nr = 0; group_nr < nGroups; group_nr++) {
			int nmembers = QJacobianCG_[group_ix];
			const struct QJacobianTag_ pair = QJacobianGC2_[group_nr];
			const int * const b = pair.b;
			if (pair.a == 0) {
				for (i = 0; i<nx; ++i) if (b[i]>0) ++nz;
			} else if (pair.a == 1) {
				int ind = 1;
				for (i = 0; i < b[0]; ++i) {
					int num_rows = 0;
					++ind;
					num_rows = b[ind++];
					nz += num_rows;
					ind += num_rows;
				}
			}
			group_ix += 1 + nmembers;
		}
		return nz;
	} else
		return 0;
}

/* computes fixed Jacobian structure data to be used when calculating numeric Jacobian using grouping */
static int PrepareSparse(Component *comp, SparseFixData *sparseData, int N, int nz) {
	int band_width = 0;
	int nGroups = QJacobianCG_[0];
	int i;

	sparseData->nnz = nz;
	sparseData->nGroups = nGroups;
	sparseData->colPtrs = (int *) ALLOCATE_MEMORY(N+1, sizeof(int));
	sparseData->index = (int *) ALLOCATE_MEMORY(N*nGroups, sizeof(int));
	
	for(i=0;i<N*nGroups;++i) sparseData->index[i]=-1;

	{
		int nnz=0,j=0;
		for(;j<N;++j) {
			int group_nr;
			int group_ix=1;
			/* Set values */
			sparseData->colPtrs[j]=nnz;
			/* Find group */
			for (group_nr = 0; group_nr < nGroups; group_nr++) {
				int i, i2;
				int nmembers = QJacobianCG_[group_ix];
				int gc_ix = (int)(N * group_nr);
				const struct QJacobianTag_ pair = QJacobianGC2_[group_nr];
				const int * const b = pair.b;
				for(i2=0;i2<nmembers;++i2) {
					if (QJacobianCG_[group_ix+i2+1]==j+1) {
						/* Found group containing it, copy specific values */
						if (pair.a == 0) {
							for (i = 0; i < N; i++) {
								int col = b[i] - 1;
								if (col == j) {
									sparseData->index[gc_ix + i] = nnz;
									++nnz;
									band_width = Dymola_max(band_width, Dymola_abs(i - col));
								}
							}
						} else if (pair.a == 1) {
							int j2, ind = 1;
							for (i = 0; i < b[0]; ++i) {
								int column, num_rows;
								column = b[ind++] - 1;
								num_rows = b[ind++];
								if (column == j) {
									for (j2 = 0; j2 < num_rows; ++j2) {
										const int row = b[ind++] - 1;
										sparseData->index[gc_ix + row] = nnz;
										++nnz;
										band_width = Dymola_max(band_width, Dymola_abs(row - column));
									}
									break;
								} else
									ind += num_rows;
							}
						}
					}
				}
				group_ix += 1 + nmembers;
			}
		}
		sparseData->colPtrs[j]=nnz;
	}
	return band_width;
}

/* return the number of cores to be used by the multithreaded sparse SuperLU */
static int getNumProcsCvode(SparseFixData *sparseData, int nx, int nnz, int bw) {

	int np = 0;
	if (!sparseData)
		return 1;
	np = sparseData->sparseEnabledVar;
	if (np <= 0)
		return 1;
	else
		return np;
}
#endif

// Called by CVode after each successful step. Gives access to the internal memory structure for logging.
// Do not modify the CVode memory as leads to undefined behaviour.
static int MyMonitorFn(void* cvode_mem, void* user_data)
{
	Component* comp = (Component*) user_data;
	int qlast = -1;

	if (!comp || !comp->iData)
		return -1;

	if (CV_SUCCESS == CVodeGetLastOrder(cvode_mem, &qlast)) {
		if (qlast > comp->iData->stat.maxOrder)
			comp->iData->stat.maxOrder = qlast;
	} else 
		return -1;

	return 0;
}
