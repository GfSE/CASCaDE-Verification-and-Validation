/*
 * PID_Euler_0_01_sf_data.c
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

#include "PID_Euler_0_01_sf.h"
#include "PID_Euler_0_01_sf_private.h"

/* Block parameters (auto storage) */
P_PID_Euler_0_01_T PID_Euler_0_01_DefaultP = {
  20.0,                                /* Mask Parameter: PIDController_D
                                        * Referenced by: '<S1>/Derivative Gain'
                                        */
  30.0,                                /* Mask Parameter: PIDController_I
                                        * Referenced by: '<S1>/Integral Gain'
                                        */
  100.0,                               /* Mask Parameter: PIDController_N
                                        * Referenced by: '<S1>/Filter Coefficient'
                                        */
  20.0,                                /* Mask Parameter: PIDController_P
                                        * Referenced by: '<S1>/Proportional Gain'
                                        */
  0.0,                                 /* Expression: InitialConditionForIntegrator
                                        * Referenced by: '<S1>/Integrator'
                                        */
  0.0                                  /* Expression: InitialConditionForFilter
                                        * Referenced by: '<S1>/Filter'
                                        */
};
