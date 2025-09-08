/*
 * PID_Euler_0_01_sf.h
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

#ifndef RTW_HEADER_PID_Euler_0_01_sf_h_
#define RTW_HEADER_PID_Euler_0_01_sf_h_
#include <string.h>
#include <stddef.h>
#ifndef PID_Euler_0_01_sf_COMMON_INCLUDES_
# define PID_Euler_0_01_sf_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME                PID_Euler_0_01_sf
#define S_FUNCTION_LEVEL               2
#define RTW_GENERATED_S_FUNCTION
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if !defined(MATLAB_MEX_FILE)
#include "rt_matrx.h"
#endif

#if !defined(RTW_SFUNCTION_DEFINES)
#define RTW_SFUNCTION_DEFINES

typedef struct {
  void *blockIO;
  void *defaultParam;
  void *nonContDerivSig;
} LocalS;

#define ssSetLocalBlockIO(S, io)       ((LocalS *)ssGetUserData(S))->blockIO = ((void *)(io))
#define ssGetLocalBlockIO(S)           ((LocalS *)ssGetUserData(S))->blockIO
#define ssSetLocalDefaultParam(S, paramVector) ((LocalS *)ssGetUserData(S))->defaultParam = (paramVector)
#define ssGetLocalDefaultParam(S)      ((LocalS *)ssGetUserData(S))->defaultParam
#define ssSetLocalNonContDerivSig(S, pSig) ((LocalS *)ssGetUserData(S))->nonContDerivSig = (pSig)
#define ssGetLocalNonContDerivSig(S)   ((LocalS *)ssGetUserData(S))->nonContDerivSig
#endif
#endif                                 /* PID_Euler_0_01_sf_COMMON_INCLUDES_ */

#include "PID_Euler_0_01_sf_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"

/* Block signals (auto storage) */
typedef struct {
  real_T FilterCoefficient;            /* '<S1>/Filter Coefficient' */
  real_T IntegralGain;                 /* '<S1>/Integral Gain' */
} B_PID_Euler_0_01_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
  real_T Filter_CSTATE;                /* '<S1>/Filter' */
} X_PID_Euler_0_01_T;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S1>/Integrator' */
  real_T Filter_CSTATE;                /* '<S1>/Filter' */
} XDot_PID_Euler_0_01_T;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE;         /* '<S1>/Integrator' */
  boolean_T Filter_CSTATE;             /* '<S1>/Filter' */
} XDis_PID_Euler_0_01_T;

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T *In1;                         /* '<Root>/In1' */
  real_T *In2;                         /* '<Root>/In2' */
} ExternalUPtrs_PID_Euler_0_01_T;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T *Out1;                        /* '<Root>/Out1' */
} ExtY_PID_Euler_0_01_T;

/* Parameters (auto storage) */
struct P_PID_Euler_0_01_T_ {
  real_T PIDController_D;              /* Mask Parameter: PIDController_D
                                        * Referenced by: '<S1>/Derivative Gain'
                                        */
  real_T PIDController_I;              /* Mask Parameter: PIDController_I
                                        * Referenced by: '<S1>/Integral Gain'
                                        */
  real_T PIDController_N;              /* Mask Parameter: PIDController_N
                                        * Referenced by: '<S1>/Filter Coefficient'
                                        */
  real_T PIDController_P;              /* Mask Parameter: PIDController_P
                                        * Referenced by: '<S1>/Proportional Gain'
                                        */
  real_T Integrator_IC;                /* Expression: InitialConditionForIntegrator
                                        * Referenced by: '<S1>/Integrator'
                                        */
  real_T Filter_IC;                    /* Expression: InitialConditionForFilter
                                        * Referenced by: '<S1>/Filter'
                                        */
};

extern P_PID_Euler_0_01_T PID_Euler_0_01_DefaultP;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'PID_Euler_0_01_sf'
 * '<S1>'   : 'PID_Euler_0_01_sf/PID Controller'
 */
#endif                                 /* RTW_HEADER_PID_Euler_0_01_sf_h_ */
