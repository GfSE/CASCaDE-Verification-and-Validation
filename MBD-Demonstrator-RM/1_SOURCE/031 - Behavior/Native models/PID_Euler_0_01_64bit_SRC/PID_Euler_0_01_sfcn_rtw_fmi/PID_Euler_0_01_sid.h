/*
 * PID_Euler_0_01_sid.h
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
 *
 * SOURCES: PID_Euler_0_01_sf.c
 */

/* statically allocated instance data for model: PID_Euler_0_01 */
{
  extern P_PID_Euler_0_01_T PID_Euler_0_01_DefaultP;

  {
    /* Local SimStruct for the generated S-Function */
    static LocalS slS;
    LocalS *lS = &slS;
    ssSetUserData(rts, lS);

    /* block I/O */
    {
      static B_PID_Euler_0_01_T sfcnB;
      void *b = (real_T *) &sfcnB;
      ssSetLocalBlockIO(rts, b);
      (void) memset(b, 0,
                    sizeof(B_PID_Euler_0_01_T));
    }

    /* model parameters */
    ssSetLocalDefaultParam(rts, (real_T *) &PID_Euler_0_01_DefaultP);

    /* model checksums */
    ssSetChecksumVal(rts, 0, 2349965430U);
    ssSetChecksumVal(rts, 1, 3179131749U);
    ssSetChecksumVal(rts, 2, 1593747129U);
    ssSetChecksumVal(rts, 3, 2116618672U);
  }
}
