#ifndef VV_STDLOGIC_H
#define VV_STDLOGIC_H

/*
******************************************************************
*
*  VeriBest VHDL -- Runtime System
*  IEEE.STD_LOGIC_1164 handcoded definitions
*
*  Copyright (c) 1995-1997 VeriBest, Inc.
*  Mountain View, CA 94041
*
*  This file belongs in the customer's release environment.
*  It is used when compiling the generated code.
*
******************************************************************
*/

/*
******************************************************************
*
*  Modification History
*
*  05/15/95  sar  Created
*
******************************************************************
*/

typedef enum { uU, uX, u0, u1, uZ, uW, uL, uH, uD } rts1164UT, rts1164UPT;
extern rts1164UT rts1164_resolution_table[9][9];

/* resolution function */
vvUInt8T    rts1164Resolved    (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s);

/* overloaded logical operators */
vvUInt8T    rts1164AndUU       (rtsDynPT dyn_ctxt, vvUInt8T l, vvUInt8T r);
vvUInt8T    rts1164NandUU      (rtsDynPT dyn_ctxt, vvUInt8T l, vvUInt8T r);
vvUInt8T    rts1164OrUU        (rtsDynPT dyn_ctxt, vvUInt8T l, vvUInt8T r);
vvUInt8T    rts1164NorUU       (rtsDynPT dyn_ctxt, vvUInt8T l, vvUInt8T r);
vvUInt8T    rts1164XorUU       (rtsDynPT dyn_ctxt, vvUInt8T l, vvUInt8T r);
vvUInt8T    rts1164XnorUU      (rtsDynPT dyn_ctxt, vvUInt8T l, vvUInt8T r);
vvUInt8T    rts1164NotU        (rtsDynPT dyn_ctxt, vvUInt8T l);

/* vectorized overloaded logical operators */
void        rts1164AndVV       (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l, vvDescPT r_a, vvValuePT r, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164NandVV      (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l, vvDescPT r_a, vvValuePT r, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164OrVV        (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l, vvDescPT r_a, vvValuePT r, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164NorVV       (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l, vvDescPT r_a, vvValuePT r, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164XorVV       (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l, vvDescPT r_a, vvValuePT r, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164XnorVV      (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l, vvDescPT r_a, vvValuePT r, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164NotV        (rtsDynPT dyn_ctxt, vvDescPT l_a, vvValuePT l,                            vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);

/* conversion functions */
vvUInt8T    rts1164ToBitU      (rtsDynPT dyn_ctxt, vvUInt8T s, vvUInt8T xmap);
void        rts1164ToBitvecV   (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s, vvUInt8T xmap, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToStdBit    (rtsDynPT dyn_ctxt, vvUInt8T b);
void        rts1164ToStdvecBitvec (rtsDynPT dyn_ctxt, vvDescPT b_a, vvValuePT b, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
void        rts1164ToStdvecV   (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);

/* strength strippers and type convertors */
void        rts1164ToX01_V     (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToX01_U     (rtsDynPT dyn_ctxt, vvUInt8T s);
void        rts1164ToX01_Bitvec (rtsDynPT dyn_ctxt, vvDescPT b_a, vvValuePT b, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToX01_Bit   (rtsDynPT dyn_ctxt, vvUInt8T b);

void        rts1164ToX01Z_V    (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToX01Z_U    (rtsDynPT dyn_ctxt, vvUInt8T s);
void        rts1164ToX01Z_Bitvec (rtsDynPT dyn_ctxt, vvDescPT b_a, vvValuePT b, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToX01Z_Bit  (rtsDynPT dyn_ctxt, vvUInt8T b);

void        rts1164ToUX01_V    (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToUX01_U    (rtsDynPT dyn_ctxt, vvUInt8T s);
void        rts1164ToUX01_Bitvec (rtsDynPT dyn_ctxt, vvDescPT b_a, vvValuePT b, vvDescPT result_a, vvValuePT *result, rtsArenaPT result_arena);
vvUInt8T    rts1164ToUX01_Bit  (rtsDynPT dyn_ctxt, vvUInt8T b);

/* edge detection */
vvUInt8T    rts1164RisingEdge  (rtsDynPT dyn_ctxt, simSignalPT s, vvInt32T s_o);
vvUInt8T    rts1164FallingEdge (rtsDynPT dyn_ctxt, simSignalPT s, vvInt32T s_o);

/* object contains an unknown */
vvUInt8T    rts1164IsX_V       (rtsDynPT dyn_ctxt, vvDescPT s_a, vvValuePT s);
vvUInt8T    rts1164IsX_U       (rtsDynPT dyn_ctxt, vvUInt8T s);


#endif /* VV_STDLOGIC_H */
