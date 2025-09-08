/*
 * sfcn_fmi.h
 *
 *  Model-specific code required to build FMI executable
 *  from Simulink model "PID_Euler_0_01.mdl".
 *
 * Generated on : Fri May 18 15:43:36 2018
 */

#ifndef SFCN_FMI_H
#define SFCN_FMI_H

/* Include header for FMI 2.0 */
#include "fmi/fmi2Functions.h"

/* Define GUID string */
char* GUIDString = "{29374ecd-668f-4e3d-8623-887aa52eee3f}";

#if defined(MATLAB_MEX_FILE)
#define mexCallMATLAB                  sfcn_fmi_load_mexa64
#else

/* Code to enable global tunable parameters in stand-alone mode */
#define RTW_GENERATED_SFCN_TUNABLE_PRMS_PID_Euler_0_01_sf
#define RTW_GENERATED_S_FUNCTION
#include "simstruc.h"
#define mxGetData(x)                   x
#define PIDController_D(S)             &(((P_PID_Euler_0_01_T *) ssGetLocalDefaultParam(S))->PIDController_D)
#define PIDController_I(S)             &(((P_PID_Euler_0_01_T *) ssGetLocalDefaultParam(S))->PIDController_I)
#define PIDController_N(S)             &(((P_PID_Euler_0_01_T *) ssGetLocalDefaultParam(S))->PIDController_N)
#define PIDController_P(S)             &(((P_PID_Euler_0_01_T *) ssGetLocalDefaultParam(S))->PIDController_P)
#include "rt_nonfinite.c"
#endif

/* Include Simulink Coder-generated model code */
#include "PID_Euler_0_01_sf.c"

/* Solver settings selected in Simulink */
int_T SFCN_FMI_IS_VARIABLE_STEP_SOLVER = 0;
real_T SFCN_FMI_FIXED_STEP_SIZE = 0.01;
int_T SFCN_FMI_IS_MT = 0;
int_T SFCN_FMI_EXTRAPOLATION_ORDER = -1;
int_T SFCN_FMI_NEWTON_ITER = -1;

/* Model sizes */
int_T SFCN_FMI_ZC_LENGTH = 0;
int_T SFCN_FMI_NBR_INPUTS = 2;
int_T SFCN_FMI_NBR_OUTPUTS = 1;
int_T SFCN_FMI_NBR_PARAMS = 6;
int_T SFCN_FMI_NBR_BLOCKIO = 2;
int_T SFCN_FMI_NBR_DWORK = 0;

/* Model identifier */
char* SFCN_FMI_MODEL_IDENTIFIER = "PID_Euler_0_01_sf";

/* Loading of MEX binaries, path to MATLAB bin */
int_T SFCN_FMI_LOAD_MEX = 0;
const char* SFCN_FMI_MATLAB_BIN = "/usr/local/MATLAB/R2016b/bin/glnxa64";
int_T SFCN_FMI_NBR_MEX = 0;
char* SFCN_FMI_MEX_NAMES[1] = { "" };

/* Register model callback routines in SimStruct */
void sfcn_fmi_registerMdlCallbacks_(SimStruct*S)
{
  ssSetmdlInitializeSizes(S, mdlInitializeSizes);
  ssSetmdlInitializeSampleTimes(S, mdlInitializeSampleTimes);

#if defined(MDL_INITIALIZE_CONDITIONS)

  ssSetmdlInitializeConditions(S, mdlInitializeConditions);

#else

  ssSetmdlInitializeConditions(S, NULL);

#endif

#if defined(MDL_START)

  ssSetmdlStart(S, mdlStart);

#else

  ssSetmdlStart(S, NULL);

#endif

#if defined(RTW_GENERATED_ENABLE)

  _ssSetRTWGeneratedEnable(S, mdlEnable);

#else

  _ssSetRTWGeneratedEnable(S, NULL);

#endif

  ssSetmdlOutputs(S,mdlOutputs);

#if defined(MDL_ZERO_CROSSINGS)

  ssSetmdlZeroCrossings(S, mdlZeroCrossings);

#else

  ssSetmdlZeroCrossings(S, NULL);

#endif

#if defined(MDL_DERIVATIVES)

  ssSetmdlDerivatives(S, mdlDerivatives);

#else

  ssSetmdlDerivatives(S, NULL);

#endif

#if defined (MDL_UPDATE)

  ssSetmdlUpdate(S, mdlUpdate);

#else

  ssSetmdlUpdate(S, NULL);

#endif

  ssSetmdlTerminate(S, mdlTerminate);
}

/* Register SolverInfo model method pointers */
extern void mdlNoOpFunc(SimStruct* S);
void sfcn_fmi_registerRTModelCallbacks_(SimStruct*S)
{

#if defined(MDL_DERIVATIVES)

  S->mdlInfo->solverInfo->modelMethodsPtr->rtmDervisFcn = (rtMdlDerivativesFcn)
    mdlDerivatives;

#else

  S->mdlInfo->solverInfo->modelMethodsPtr->rtmDervisFcn = (rtMdlProjectionFcn)
    mdlNoOpFunc;

#endif

  S->mdlInfo->solverInfo->modelMethodsPtr->rtmProjectionFcn =
    (rtMdlProjectionFcn) mdlNoOpFunc;
  S->mdlInfo->solverInfo->modelMethodsPtr->rtmOutputsFcn = (rtMdlOutputsFcn)
    mdlOutputs;
}

/* Pointers to input variables */
void sfcn_fmi_assignInputs_(SimStruct* S, void** inputs)
{
  inputs[0] = (((real_T **) ssGetInputPortSignalPtrs(S, 0))[0]);
  inputs[1] = (((real_T **) ssGetInputPortSignalPtrs(S, 1))[0]);
}

/* Pointers to output variables */
void sfcn_fmi_assignOutputs_(SimStruct* S, void** outputs)
{
  outputs[0] = &(((real_T *) ssGetOutputPortSignal(S, 0))[0]);
}

/* Parameter assignment functions */
static void sfcn_fmi_paramFunc0_(P_PID_Euler_0_01_T* p, void** parameters)
{
  parameters[0] = &(p->PIDController_D);
  parameters[1] = &(p->PIDController_I);
  parameters[2] = &(p->PIDController_N);
  parameters[3] = &(p->PIDController_P);
  parameters[4] = &(p->Filter_IC);
  parameters[5] = &(p->Integrator_IC);
}

/* Pointers to model parameters */
void sfcn_fmi_assignParameters_(SimStruct* S, void** parameters)
{
  P_PID_Euler_0_01_T* p = allocateMemory0(1, sizeof(P_PID_Euler_0_01_T));
  (*p) = PID_Euler_0_01_DefaultP;
  sfcn_fmi_paramFunc0_(p, parameters);
  ssSetLocalDefaultParam(S, p);
}

/* Copy parameter values to S-function mxArrays */
void sfcn_fmi_copyToSFcnParams_(SimStruct* S)
{
  return;                              /* No loading of binary MEX files */
}

/* Return pointer to parameter struct in UserData */
void* sfcn_fmi_getParametersP_(SimStruct* S)
{
  return ssGetLocalDefaultParam(S);
}

/* Handle mxArrays for global tunable parameters */
void sfcn_fmi_mxGlobalTunable_(SimStruct* S, int_T create, int_T update)
{
  return;                              /* no global tunable parameters as mxArrays */
}

/* Pointers to block output variables */
void sfcn_fmi_assignBlockOutputs_(SimStruct* S, void** blockoutputs)
{
  /* Called from fmiInitialize after mdlStart has assigned BlockIO to Simstruct UserData */
  blockoutputs[0] = &(((B_PID_Euler_0_01_T *) ssGetLocalBlockIO(S))
                      ->FilterCoefficient);
  blockoutputs[1] = &(((B_PID_Euler_0_01_T *) ssGetLocalBlockIO(S))
                      ->IntegralGain);
}

/* Pointers to DWork variables for discrete states */
void sfcn_fmi_assignDWork_(SimStruct* S, void** dwork)
{
  return;                              /* No DWork variables for discrete states */
}

/* Sizes of bus I/O structs for allocation in FMU */
void* sfcn_fmi_allocateBusObject(int_T isInput, int_T portid, int_T width)
{
  return 0;
}

#if !defined(MATLAB_MEX_FILE)

int_T _ssSetInputPortMatrixDimensions(SimStruct *S, int_T port, int_T m, int_T n)
{
  extern int_T _ssSetInputPortMatrixDimensions_FMI(SimStruct *S, int_T port,
    int_T m, int_T n);
  return _ssSetInputPortMatrixDimensions_FMI(S, port, m, n);
}

int_T _ssSetOutputPortMatrixDimensions(SimStruct *S, int_T port, int_T m, int_T
  n)
{
  extern int_T _ssSetOutputPortMatrixDimensions_FMI(SimStruct *S, int_T port,
    int_T m, int_T n);
  return _ssSetOutputPortMatrixDimensions_FMI(S, port, m, n);
}

int_T _ssSetInputPortVectorDimension(SimStruct *S, int_T port, int_T m)
{
  extern int_T _ssSetInputPortVectorDimension_FMI(SimStruct *S, int_T port,
    int_T m);
  return _ssSetInputPortVectorDimension_FMI(S, port, m);
}

int_T _ssSetOutputPortVectorDimension(SimStruct *S, int_T port, int_T m)
{
  extern int_T _ssSetOutputPortVectorDimension_FMI(SimStruct *S, int_T port,
    int_T m);
  return _ssSetOutputPortVectorDimension_FMI(S, port, m);
}

#endif
#endif
