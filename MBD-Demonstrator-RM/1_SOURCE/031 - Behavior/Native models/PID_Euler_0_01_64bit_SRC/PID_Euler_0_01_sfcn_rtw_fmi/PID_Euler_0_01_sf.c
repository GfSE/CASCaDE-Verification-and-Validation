/*
 * PID_Euler_0_01_sf.c
 *
 * Code generation for model "PID_Euler_0_01_sf".
 *
 * Model version              : 1.4
 * Simulink Coder version : 8.11 (R2016b) 25-Aug-2016
 * C source code generated on : Fri May 18 15:43:36 2018
 *
 * Target selection: rtwsfcnfmi.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Emulation hardware selection:
 *    Differs from embedded hardware (MATLAB Host)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include <math.h>
#include "PID_Euler_0_01_sf.h"
#include "PID_Euler_0_01_sf_private.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

extern void *PID_Euler_0_01_malloc(SimStruct *S);

#endif

#ifndef __RTW_UTFREE__
#if defined (MATLAB_MEX_FILE)

extern void * utMalloc(size_t);
extern void utFree(void *);

#endif
#endif                                 /* #ifndef __RTW_UTFREE__ */

#if defined(MATLAB_MEX_FILE)
#include "rt_nonfinite.c"
#endif

static const char_T *RT_MEMORY_ALLOCATION_ERROR =
  "memory allocation error in generated S-Function";

/* System initialize for root system: '<Root>' */
#define MDL_INITIALIZE_CONDITIONS

static void mdlInitializeConditions(SimStruct *S)
{
  if (ssIsFirstInitCond(S)) {
    P_PID_Euler_0_01_T *_rtP;
    X_PID_Euler_0_01_T *_rtX;
    _rtX = ((X_PID_Euler_0_01_T *) ssGetContStates(S));
    _rtP = ((P_PID_Euler_0_01_T *) ssGetLocalDefaultParam(S));

    /* InitializeConditions for Integrator: '<S1>/Integrator' */
    _rtX->Integrator_CSTATE = _rtP->Integrator_IC;

    /* InitializeConditions for Integrator: '<S1>/Filter' */
    _rtX->Filter_CSTATE = _rtP->Filter_IC;
  } else {
    P_PID_Euler_0_01_T *_rtP;
    X_PID_Euler_0_01_T *_rtX;
    _rtX = ((X_PID_Euler_0_01_T *) ssGetContStates(S));
    _rtP = ((P_PID_Euler_0_01_T *) ssGetLocalDefaultParam(S));

    /* InitializeConditions for Integrator: '<S1>/Integrator' */
    _rtX->Integrator_CSTATE = _rtP->Integrator_IC;

    /* InitializeConditions for Integrator: '<S1>/Filter' */
    _rtX->Filter_CSTATE = _rtP->Filter_IC;
  }
}

/* Start for root system: '<Root>' */
#define MDL_START

static void mdlStart(SimStruct *S)
{
  /* instance underlying S-Function data */
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  if defined(MATLAB_MEX_FILE)

  /* non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* Check for invalid switching between solver types */
  if (ssIsVariableStepSolver(S)) {
    ssSetErrorStatus(S, "This Simulink Coder generated "
                     "S-Function cannot be used in a simulation with "
                     "a solver type of variable-step "
                     "because this S-Function was created from a model with "
                     "solver type of fixed-step and it has continuous time blocks. "
                     "See the Solver page of the simulation parameters dialog.");
    return;
  }

  if (ssGetSolverMode(S) == SOLVER_MODE_MULTITASKING) {
    ssSetErrorStatus(S, "This Simulink Coder generated "
                     "S-Function cannot be used in a simulation with "
                     "solver mode set to auto or multitasking "
                     "because this S-Function was created from a model with "
                     "solver mode set to singletasking. "
                     "See the Solver page of the simulation parameters dialog.");
    return;
  }

#  endif

  PID_Euler_0_01_malloc(S);
  if (ssGetErrorStatus(S) != (NULL) ) {
    return;
  }

#endif

  {
  }
}

/* Outputs for root system: '<Root>' */
static void mdlOutputs(SimStruct *S, int_T tid)
{
  real_T rtb_Sum_e;
  B_PID_Euler_0_01_T *_rtB;
  X_PID_Euler_0_01_T *_rtX;
  _rtX = ((X_PID_Euler_0_01_T *) ssGetContStates(S));
  _rtB = ((B_PID_Euler_0_01_T *) ssGetLocalBlockIO(S));
  if (1) {
    /* Sum: '<Root>/Sum' incorporates:
     *  Inport: '<Root>/In1'
     *  Inport: '<Root>/In2'
     */
    rtb_Sum_e = *((const real_T **)ssGetInputPortSignalPtrs(S, 0))[0] - *((const
      real_T **)ssGetInputPortSignalPtrs(S, 1))[0];

    /* Gain: '<S1>/Filter Coefficient' incorporates:
     *  Gain: '<S1>/Derivative Gain'
     *  Integrator: '<S1>/Filter'
     *  Sum: '<S1>/SumD'
     */
    _rtB->FilterCoefficient = ((*(real_T *)(mxGetData(PIDController_D(S)))) *
      rtb_Sum_e - _rtX->Filter_CSTATE) * (*(real_T *)(mxGetData(PIDController_N
      (S))));

    /* Outport: '<Root>/Out1' incorporates:
     *  Gain: '<S1>/Proportional Gain'
     *  Integrator: '<S1>/Integrator'
     *  Sum: '<S1>/Sum'
     */
    ((real_T *)ssGetOutputPortSignal(S, 0))[0] = ((*(real_T *)(mxGetData
      (PIDController_P(S)))) * rtb_Sum_e + _rtX->Integrator_CSTATE) +
      _rtB->FilterCoefficient;

    /* Gain: '<S1>/Integral Gain' */
    _rtB->IntegralGain = (*(real_T *)(mxGetData(PIDController_I(S)))) *
      rtb_Sum_e;
  }

  UNUSED_PARAMETER(tid);
}

/* Update for root system: '<Root>' */
#define MDL_UPDATE

static void mdlUpdate(SimStruct *S, int_T tid)
{
  UNUSED_PARAMETER(tid);
}

/* Derivatives for root system: '<Root>' */
#define MDL_DERIVATIVES

static void mdlDerivatives(SimStruct *S)
{
  B_PID_Euler_0_01_T *_rtB;
  XDot_PID_Euler_0_01_T *_rtXdot;
  _rtXdot = ((XDot_PID_Euler_0_01_T *) ssGetdX(S));
  _rtB = ((B_PID_Euler_0_01_T *) ssGetLocalBlockIO(S));

  /* Derivatives for Integrator: '<S1>/Integrator' */
  _rtXdot->Integrator_CSTATE = _rtB->IntegralGain;

  /* Derivatives for Integrator: '<S1>/Filter' */
  _rtXdot->Filter_CSTATE = _rtB->FilterCoefficient;
}

/* Termination for root system: '<Root>' */
static void mdlTerminate(SimStruct *S)
{

#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

  if (ssGetUserData(S) != (NULL) ) {
    rt_FREE(ssGetLocalBlockIO(S));
  }

  rt_FREE(ssGetUserData(S));

#endif

}

/* This function checks the attributes of tunable parameters. */
#define MDL_CHECK_PARAMETERS
#if defined(MDL_CHECK_PARAMETERS) && defined(MATLAB_MEX_FILE)

static void mdlCheckParameters(SimStruct *S)
{
  /* Parameter check for 'PIDController_D' */
  if (mxIsComplex(ssGetSFcnParam(S, 0))) {
    ssSetErrorStatus(S,
                     "Parameter 'PIDController_D' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 0))) {
    ssSetErrorStatus(S,"Parameter 'PIDController_D' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 0)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 0))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 0))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'PIDController_D' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'PIDController_I' */
  if (mxIsComplex(ssGetSFcnParam(S, 1))) {
    ssSetErrorStatus(S,
                     "Parameter 'PIDController_I' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 1))) {
    ssSetErrorStatus(S,"Parameter 'PIDController_I' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 1)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 1))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 1))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'PIDController_I' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'PIDController_N' */
  if (mxIsComplex(ssGetSFcnParam(S, 2))) {
    ssSetErrorStatus(S,
                     "Parameter 'PIDController_N' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 2))) {
    ssSetErrorStatus(S,"Parameter 'PIDController_N' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 2)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 2))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 2))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'PIDController_N' has to be a [1x1] array.");
    return;
  }

  /* Parameter check for 'PIDController_P' */
  if (mxIsComplex(ssGetSFcnParam(S, 3))) {
    ssSetErrorStatus(S,
                     "Parameter 'PIDController_P' has to be a non complex array.");
    return;
  }

  if (!mxIsDouble(ssGetSFcnParam(S, 3))) {
    ssSetErrorStatus(S,"Parameter 'PIDController_P' has to be a double array.");
    return;
  }

  if ((mxGetNumberOfDimensions(ssGetSFcnParam(S, 3)) != 2) ||
      (mxGetDimensions(ssGetSFcnParam(S, 3))[0] != 1) ||
      (mxGetDimensions(ssGetSFcnParam(S, 3))[1] != 1) ) {
    ssSetErrorStatus(S,"Parameter 'PIDController_P' has to be a [1x1] array.");
    return;
  }
}

#endif                                 /* MDL_CHECK_PARAMETERS */

#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  include "PID_Euler_0_01_mid.h"
#endif

/* Function to initialize sizes. */
static void mdlInitializeSizes(SimStruct *S)
{
  ssSetNumSampleTimes(S, 2);           /* Number of sample times */
  ssSetNumContStates(S, 2);            /* Number of continuous states */
  ssSetNumPeriodicContStates(S, 0);    /* Number of periodic continuous states */
  ssSetNumNonsampledZCs(S, 0);         /* Number of nonsampled ZCs */

  /* Number of output ports */
  if (!ssSetNumOutputPorts(S, 1))
    return;

  /* outport number: 0 */
  if (!ssSetOutputPortVectorDimension(S, 0, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 0, 0.0);
  ssSetOutputPortOffsetTime(S, 0, 0.0);
  ssSetOutputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);

  /* Number of input ports */
  if (!ssSetNumInputPorts(S, 2))
    return;

  /* inport number: 0 */
  {
    if (!ssSetInputPortVectorDimension(S, 0, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 0, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 0, 1);
    ssSetInputPortSampleTime(S, 0, 0.0);
    ssSetInputPortOffsetTime(S, 0, 0.0);
    ssSetInputPortOverWritable(S, 0, 0);
    ssSetInputPortOptimOpts(S, 0, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 1 */
  {
    if (!ssSetInputPortVectorDimension(S, 1, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 1, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 1, 1);
    ssSetInputPortSampleTime(S, 1, 0.0);
    ssSetInputPortOffsetTime(S, 1, 0.0);
    ssSetInputPortOverWritable(S, 1, 0);
    ssSetInputPortOptimOpts(S, 1, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  ssSetRTWGeneratedSFcn(S, 1);         /* Generated S-function */

  /* Tunable Parameters */
  ssSetNumSFcnParams(S, 4);

  /* Number of expected parameters */
#if defined(MATLAB_MEX_FILE)

  if (ssGetNumSFcnParams(S) == ssGetSFcnParamsCount(S)) {

#if defined(MDL_CHECK_PARAMETERS)

    mdlCheckParameters(S);

#endif                                 /* MDL_CHECK_PARAMETERS */

    if (ssGetErrorStatus(S) != (NULL) ) {
      return;
    }
  } else {
    return;                            /* Parameter mismatch will be reported by Simulink */
  }

#endif                                 /* MATLAB_MEX_FILE */

  /* Options */
  ssSetOptions(S, (SS_OPTION_RUNTIME_EXCEPTION_FREE_CODE |
                   SS_OPTION_PORT_SAMPLE_TIMES_ASSIGNED ));

#if SS_SFCN_FOR_SIM

  {
    ssSupportsMultipleExecInstances(S, true);
    ssHasStateInsideForEachSS(S, false);
  }

#endif

}

/* Function to initialize sample times. */
static void mdlInitializeSampleTimes(SimStruct *S)
{
  /* task periods */
  ssSetSampleTime(S, 0, 0.0);
  ssSetSampleTime(S, 1, 0.01);

  /* task offsets */
  ssSetOffsetTime(S, 0, 0.0);
  ssSetOffsetTime(S, 1, 0.0);
}

#if defined(MATLAB_MEX_FILE)
# include "fixedpoint.c"
# include "simulink.c"
#else
# undef S_FUNCTION_NAME
# define S_FUNCTION_NAME               PID_Euler_0_01_sf
# include "cg_sfun.h"
#endif                                 /* defined(MATLAB_MEX_FILE) */
