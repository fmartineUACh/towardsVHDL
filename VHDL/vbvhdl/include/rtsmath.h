#ifndef RTS_MATH_H
#define RTS_MATH_H

/*
******************************************************************
*
*  VeriBest VHDL -- Runtime System
*  IEEE.MATH_REAL, MATH_COMPLEX accelerated packages
*
*  Copyright (c) 1997 VeriBest, Inc.
*  Mountain View, CA 94041
*
******************************************************************
*/

/*
******************************************************************
*
*  IEEE.MATH_REAL
*
******************************************************************
*/

vvReal64T   rtsMathRSign    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRCeil    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRFloor   (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRRound   (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRTrunc   (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRMod     (rtsDynPT dyn_ctxt, vvReal64T X, vvReal64T Y);
vvReal64T   rtsMathRSqrt    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRPowIR   (rtsDynPT dyn_ctxt, vvInt32T X, vvReal64T Y);
vvReal64T   rtsMathRPow     (rtsDynPT dyn_ctxt, vvReal64T X, vvReal64T Y);
vvReal64T   rtsMathRExp     (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRLog     (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRLog10   (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRSin     (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRCos     (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRTan     (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRAsin    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRAcos    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRAtan    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRAtan2   (rtsDynPT dyn_ctxt, vvReal64T Y, vvReal64T X);
vvReal64T   rtsMathRSinh    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRCosh    (rtsDynPT dyn_ctxt, vvReal64T X);
vvReal64T   rtsMathRTanh    (rtsDynPT dyn_ctxt, vvReal64T X);

/*
******************************************************************
*
*  IEEE.MATH_COMPLEX
*
******************************************************************
*/

void        rtsMathCCmplx   (rtsDynPT dyn_ctxt, vvReal64T X, vvReal64T Y, vvValuePT result);
vvReal64T   rtsMathCGetPrincipalValue (rtsDynPT dyn_ctxt, vvReal64T X);
void        rtsMathCComplexToPolar  (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCPolarToComplex  (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
vvReal64T   rtsMathCAbsC    (rtsDynPT dyn_ctxt, vvValuePT Zb);
vvReal64T   rtsMathCAbsCp   (rtsDynPT dyn_ctxt, vvValuePT Zb);
vvReal64T   rtsMathCArgC    (rtsDynPT dyn_ctxt, vvValuePT Zb);
vvReal64T   rtsMathCArgCp   (rtsDynPT dyn_ctxt, vvValuePT Zb);
void        rtsMathCNegC    (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCNegCp   (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCConjC   (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCConjCp  (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCSqrtC   (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCSqrtCp  (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCExpC    (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);
void        rtsMathCExpCp   (rtsDynPT dyn_ctxt, vvValuePT Zb, vvValuePT resultb);






#endif /* RTS_MATH_H */
