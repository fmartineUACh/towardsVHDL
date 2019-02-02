#ifndef RTS_NUMERIC_H
#define RTS_NUMERIC_H

/*
******************************************************************
*
*  VeriBest VHDL -- Runtime System
*  IEEE.NUMERIC_BIT, NUMERIC_STD accelerated packages
*
*  Copyright (c) 1997 VeriBest, Inc.
*  Mountain View, CA 94041
*
******************************************************************
*/

#define RTS_NUM_BITS_PER_INT   32

/*
******************************************************************
*
*  IEEE.NUMERIC_BIT
*
******************************************************************
*/

vvInt32T    rtsNumMax       (rtsDynPT dyn_ctxt, vvInt32T left, vvInt32T right);
vvInt32T    rtsNumMin       (rtsDynPT dyn_ctxt, vvInt32T left, vvInt32T right);
vvInt32T    rtsNumSignedNumBits     (rtsDynPT dyn_ctxt, vvInt32T arg);
vvInt32T    rtsNumUnsignedNumBits   (rtsDynPT dyn_ctxt, vvInt32T arg);
void        rtsNumbAddSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbSubSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbDivMod (
                rtsDynPT dyn_ctxt,
                vvDescPT NUM_a, vvValuePT NUM,
                vvDescPT XDENOM_a, vvValuePT XDENOM,
                vvDescPT XQUOT_a, vvValuePT XQUOT,
                vvDescPT XREMAIN_a, vvValuePT XREMAIN
            );
void        rtsNumbXsll     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbXsrl     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbXsra     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbXrol     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbXror     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

vvBooleanT  rtsNumEqualSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R
            );
vvBooleanT  rtsNumUnsignedLess (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R
            );
vvBooleanT  rtsNumSignedLess (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R
            );
vvBooleanT  rtsNumUnsignedLessOrEqual (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R
            );
vvBooleanT  rtsNumSignedLessOrEqual (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R
            );

void        rtsNumbNeg (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
vvInt32T    rtsNumbU2I (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg
            );
vvInt32T    rtsNumbS2I (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg
            );
void        rtsNumbI2U (
                rtsDynPT dyn_ctxt,
                vvInt32T arg,
                vvInt32T size,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbI2S (
                rtsDynPT dyn_ctxt,
                vvInt32T arg,
                vvInt32T size,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );


void        rtsNumbSResize (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbUResize (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumbNot (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );


/* */

vvUInt8T rtsNumbUUGe (
    rtsDynPT	dyn_ctxt
    ,vvDescT	*L_a
    ,vvByteT	*L
    ,vvDescT	*R_a
    ,vvByteT	*R
);
void rtsNumbUUSub (
    rtsDynPT	dyn_ctxt
    ,vvDescT	*L_a
    ,vvByteT	*L
    ,vvDescT	*R_a
    ,vvByteT	*R
    ,vvDescT	*result_a
    ,vvByteT	**result
    ,rtsArenaPT	result_arena
);

/*
******************************************************************
*
*  IEEE.NUMERIC_STD
*
******************************************************************
*/

void        rtsNumtAddSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

void        rtsNumtSubSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

void        rtsNumtDivMod (
                rtsDynPT dyn_ctxt,
                vvDescPT NUM_a, vvValuePT NUM,
                vvDescPT XDENOM_a, vvValuePT XDENOM,
                vvDescPT XQUOT_a, vvValuePT XQUOT,
                vvDescPT XREMAIN_a, vvValuePT XREMAIN
            );
void        rtsNumtXsll     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtXsrl     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtXsra     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtXrol     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtXror     (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvByteT *ARG,
                vvInt32T COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

/* */

void        rtsNumtAbs (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtNeg (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

vvInt32T    rtsNumtU2I (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg
            );
vvInt32T    rtsNumtS2I (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg
            );
void        rtsNumtI2U (
                rtsDynPT dyn_ctxt,
                vvInt32T arg,
                vvInt32T size,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtI2S (
                rtsDynPT dyn_ctxt,
                vvInt32T arg,
                vvInt32T size,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );


void        rtsNumtSResize (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsNumtUResize (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

void        rtsNumtTo01 (
                rtsDynPT dyn_ctxt,
                vvDescPT S_a, vvValuePT S,
                vvUInt8T XMAP,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

/* */

void rtsNumtUUSub (
    rtsDynPT	dyn_ctxt
    ,vvDescT	*L_a
    ,vvByteT	*L
    ,vvDescT	*R_a
    ,vvByteT	*R
    ,vvDescT	*result_a
    ,vvByteT	**result
    ,rtsArenaPT	result_arena
);
vvUInt8T rtsNumtUUGe (
    rtsDynPT	dyn_ctxt
    ,vvDescT	*L_a
    ,vvByteT	*L
    ,vvDescT	*R_a
    ,vvByteT	*R
);
void rtsNumtNot (
    rtsDynPT	dyn_ctxt
    ,vvDescT	*L_a
    ,vvByteT	*L
    ,vvDescT	*result_a
    ,vvByteT	**result
    ,rtsArenaPT	result_arena
);


/*
******************************************************************
*
*  IEEE_SYN.STD_LOGIC_ARITH
*
******************************************************************
*/

vvUInt8T    rtsSynTMakeBinary (
                rtsDynPT dyn_ctxt,
                vvUInt8T a
            );
void        rtsSynMakeBinary (
                rtsDynPT dyn_ctxt,
                vvDescPT A_a, vvValuePT A,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void rtsSynSMult (
    rtsDynPT    dyn_ctxt
    ,vvDescT    *A_a
    ,vvByteT    *A
    ,vvDescT    *B_a
    ,vvByteT    *B
    ,vvDescT    *result_a
    ,vvByteT    **result
    ,rtsArenaPT result_arena
);
void rtsSynUMult (
    rtsDynPT    dyn_ctxt
    ,vvDescT    *A_a
    ,vvByteT    *A
    ,vvDescT    *B_a
    ,vvByteT    *B
    ,vvDescT    *result_a
    ,vvByteT    **result
    ,rtsArenaPT result_arena
);
void        rtsSynSubSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsSynAddSameSize (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT R_a, vvValuePT R,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

/* */
void        rtsSynAbs (
                rtsDynPT dyn_ctxt,
                vvDescPT L_a, vvValuePT L,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );

void        rtsSynShl (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvValuePT ARG,
                vvDescPT COUNT_a, vvValuePT COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsSynUShr (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvValuePT ARG,
                vvDescPT COUNT_a, vvValuePT COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsSynSShr (
                rtsDynPT dyn_ctxt,
                vvDescPT ARG_a, vvValuePT ARG,
                vvDescPT COUNT_a, vvValuePT COUNT,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
vvInt32T    rtsSynI2I (
                rtsDynPT dyn_ctxt,
                vvInt32T arg
            );
vvInt32T    rtsSynU2I (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg
            );
vvInt32T    rtsSynS2I (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg
            );
vvInt32T    rtsSynT2I (
                rtsDynPT dyn_ctxt,
                vvUInt8T arg
            );
void        rtsSynI2V (
                rtsDynPT dyn_ctxt,
                vvInt32T arg,
                vvInt32T size,
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsSynUResize (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsSynSResize (
                rtsDynPT dyn_ctxt,
                vvDescPT arg_a, vvValuePT arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );
void        rtsSynT2V (
                rtsDynPT dyn_ctxt,
                vvUInt8T arg,
                vvInt32T new_size, 
                vvDescPT result_a, vvValuePT *resultPP,
                rtsArenaPT result_arena
            );


#endif /* RTS_NUMERIC_H */
