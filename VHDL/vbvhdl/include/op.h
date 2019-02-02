/* static char sccsid[] = "@(#)op.h	1.3 Intergraph(C) 8/16/95 11:25:54 /tmp_mnt/net/supremes/usr6/home/vb93/SCCS/op/h/s.op.h"; */

#ifndef OP_H
#define OP_H

/*
******************************************************************
*
*  VeriBest VHDL -- Runtime Libraries
*  Operations -- Exported definitions
*
*  Copyright (c) 1995-2005 Intergraph Electronics
*  Mountain View, CA 94041
*
******************************************************************
*/

/*
******************************************************************
*
*  Modification History
*
*  06/24/92  B. Jorde  Created 64-bit math functions based on Knuth
*  07/05/95  msgresha  Updated for VeriBest VHDL
*  08/04/95  sarice    More revisions for VeriBest VHDL
*
******************************************************************
*/

#ifdef __cplusplus
extern "C" {
#endif


/* Return status codes */

typedef enum TopResultT {
    OP_SUCCESS,
    OP_BAD_RADIX,
    OP_BAD_CHAR,
    OP_STRING_TOO_SHORT,
    OP_OVERFLOW
} opResultT, *opResultPT;

/* Time units, for opGetTimeUnitName(), opGetTimeUnitValue(), opConvTS(), opConvST() */
typedef enum TopTimeUnitT {
    OP_UNIT_FS,
    OP_UNIT_PS,
    OP_UNIT_NS,
    OP_UNIT_US,
    OP_UNIT_MS,
    OP_UNIT_SEC,
    OP_UNIT_MIN,
    OP_UNIT_HR
} opTimeUnitT, *opTimeUnitPT;

/* Assist in creating floating point literal values in generated code */
typedef union TopRealLitT {
    vvInt64T    L;
    vvReal64T   R;
} opRealLitT, *opRealLitPT;

/*
******************************************************************
*
*  Global constants
*
*  The op module provides a set of interesting global constants.
*
******************************************************************
*/

extern vvInt64T  op_constL_0;     /* 64-bit value 0   */
extern vvInt64T  op_constL_1;     /* 64-bit value 1   */
extern vvInt64T  op_constL_neg1;  /* 64-bit value -1  */
extern vvInt64T  op_constL_max;   /* max vvInt64 value */
extern vvInt64T  op_constL_min;   /* min vvInt64 value */

extern vvInt64T  op_constL_1fs;   /* key time values, using a 1 fs base */
extern vvInt64T  op_constL_1ps;
extern vvInt64T  op_constL_1ns;
extern vvInt64T  op_constL_1us;
extern vvInt64T  op_constL_1ms;
extern vvInt64T  op_constL_1sec;
extern vvInt64T  op_constL_1min;
extern vvInt64T  op_constL_1hr;

/*
******************************************************************
*
*  Time unit functions
*
******************************************************************
*/

/* Return the string name of a time unit, given an opTimeUnitT */
#define opGetTimeUnitName(UNIT)  (op_time_unit_names[UNIT])

/* Return the vvInt64T value of a time unit, given an opTimeUnitT */
#define opGetTimeUnitValue(UNIT) (op_constL_time_units[UNIT])


/* Private definitions used by the above macros */
extern vvInt64T  op_constL_time_units[];
extern char     *op_time_unit_names[];


/*
******************************************************************
*
*  Conversion functions
*
******************************************************************
*/

/* Convert a vvInt32T to a vvInt64T */
vvInt64T opConvLI (vvInt32T x);

/* Convert a vvUInt32T to a vvInt64T */
vvInt64T opConvLUI (vvUInt32T x);

/* Convert a vvInt64T to a vvInt32T (ignoring overflow) */
vvInt32T opConvIL (vvInt64T x);

/* Convert a vvInt64T to a vvReal64T (might loose precision) */
vvReal64T opConvRL (vvInt64T x);

/* Convert a vvReal64T to a vvInt64T */
vvInt64T opConvLR (vvReal64T x);

/* Convert a vvReal64T to a vvInt32T */
vvInt32T opConvIR (vvReal64T x);

/* Convert an ASCII string to a vvInt64T
 * Radix is one of: 2 (binary), 10 (decimal), 16 (hex)
 */
vvInt64T opConvLS (const char *string, vvInt32T radix, opResultPT status);

/* Convert a vvInt64T to an ASCII string.
 * Radix is one of: 2 (binary), 10 (decimal), 16 (hex)
 * The returned string is in a static buffer, so should be used or copied
 * before this function is called again.
 */
char *opConvSL (vvInt64T x, vvInt32T radix);

/* Convert an ASCII string expressing a time value (with optional time unit)
 * to a vvInt64T, representing the time in fs.
 * If the string does not contain a time unit, base_unit is used.
 * The returned string is in a static buffer, so should be used or copied
 * before this function is called again.
 */
vvInt64T opConvTS (const char *string, opTimeUnitT base_unit, opResultPT status);

/* Convert a vvInt64T representing a Time value (in fs),
 * to an ASCII string expressed in units of 'base_unit'.
 */
char *opConvST (vvInt64T time, opTimeUnitT base_unit);


/*
******************************************************************
*
*  Addition and subtraction functions
*
******************************************************************
*/

/* Negate a vvInt64T */
vvInt64T opNegL (vvInt64T x);

/* Find absolute value of vvInt64T */
vvInt64T opAbsL (vvInt64T x);

/* Find absolute value of vvInt32T */
vvInt32T opAbsI (vvInt32T x);

/* Find absolute value of vvReal64T */
vvReal64T opAbsR (vvReal64T x);

/* Add two vvInt64T's */
vvInt64T opAddLL (vvInt64T x, vvInt64T y);

/* Add two vvInt64T's */
vvInline vvInt64T opiAddLL (vvInt64T x, vvInt64T y)
{
    vvInt64T    result;

    result.high = x.high + y.high;
    result.low  = x.low  + y.low;

    /* carry from low to high */
    if (result.low < y.low)
        result.high++;

    return result;
}


/* Add a vvInt64T and a vvUInt32T */
vvInt64T opAddLUI (vvInt64T x, vvUInt32T y);

/* Add a vvInt64T and a vvInt32T */
vvInt64T opAddLI (vvInt64T x, vvInt32T y);

/* Subtract vvInt64T y from vvInt64T x */
vvInt64T opSubLL (vvInt64T x, vvInt64T y);

/* Subtract vvInt64T y from vvInt64T x */
vvInline vvInt64T opiSubLL (vvInt64T x, vvInt64T y)
{
    vvInt64T    result;

    result.high = x.high - y.high;
    result.low  = x.low  - y.low;

    /* carry from high to low */
    if (result.low > x.low)
        result.high--;

    return result;
}

/* Subtract vvUInt32T y from vvInt64T x */
vvInt64T opSubLUI (vvInt64T x, vvUInt32T y);

/* Subtract vvInt32T y from vvInt64T x */
vvInt64T opSubLI (vvInt64T x, vvInt32T y);

/*
******************************************************************
*
*  Multiplication functions
*
******************************************************************
*/

/* Multiply two vvInt64T's */
vvInt64T opMultLL (vvInt64T x, vvInt64T y);

/* Multiply a vvInt64T by a vvInt32T */
vvInt64T opMultLI (vvInt64T x, vvInt32T y);

/* Multiply a vvInt64T by a vvReal64T (returning a vvInt64T) */
vvInt64T opMultLR (vvInt64T x, vvReal64T y);

/* Raise a vvInt32T x to the power vvInt32T y (returning a vvInt32T)
 * Note: the power y must be >= 0 (according to VHDL)
 */
vvInt32T opExpII (vvInt32T x, vvInt32T y);

/* Raise a vvReal64T x to the power vvInt32T y (returning a vvReal64T)
 * Note: the power y may be negative.
 */
vvReal64T opExpRI (vvReal64T x, vvInt32T y);


/*
******************************************************************
*
*  Division functions
*
******************************************************************
*/

/* Divide and Mod vvInt64T x by vvInt64T y */
void     opDivModLL (vvInt64T x, vvInt64T y, vvInt64PT quotient, vvInt64PT remainder);

/* Divide vvInt64T x by vvInt64T y (returning a vvInt64T) */
vvInt64T opDivLL (vvInt64T x, vvInt64T y);

/* Divide vvInt64T x by vvInt64T y (returning a vvInt32T) */
vvInt32T opDivILL (vvInt64T x, vvInt64T y);

/* Divide vvInt64T x by vvInt64T y (returning a vvReal64T) */
vvReal64T opDivRLL (vvInt64T x, vvInt64T y);

/* Divide vvInt64T x by vvInt32T y (returning a vvInt64T) */
vvInt64T opDivLI (vvInt64T x, vvInt32T y);

/* Divide vvInt64T x by vvReal64T y (returning a vvInt64T) */
vvInt64T opDivLR (vvInt64T x, vvReal64T y);

/* Calculate vvInt64T x modulo vvInt64T y (returning a vvInt64T) */
vvInt64T opModLL (vvInt64T x, vvInt64T y);

/* Calculate vvInt32T x modulo vvInt32T y (returning a vvInt32T)
 * Note: See VHDL'93 LRM 7.2.6
 */
vvInt32T opModII (vvInt32T x, vvInt32T y);

/* Calculate vvInt32T x remainder vvInt32T y (returning a vvInt32T)
 * Note: See VHDL'93 LRM 7.2.6
 */
vvInt32T opRemII (vvInt32T x, vvInt32T y);


/*
******************************************************************
*
*  Comparison functions
*
******************************************************************
*/

/*  Is vvInt64T negative?  */
#define opIsNegL(x) ((x).high < 0)

/*  Is vvInt64T zero?  */
#define opIsZeroL(x) ((x).low == 0 && (x).high == 0)

/* Is vvInt64T x equal to vvInt64T y? */
vvBooleanT opEqLL (vvInt64T x, vvInt64T y);

/* Is vvInt64T x not equal to vvInt64T y? */
vvBooleanT opNeqLL (vvInt64T x, vvInt64T y);

/* Is vvInt64T x greater than vvInt64T y? */
vvBooleanT opGtLL (vvInt64T x, vvInt64T y);

/* Is vvInt64T x greater than or equal to vvInt64T y? */
vvBooleanT opGeLL (vvInt64T x, vvInt64T y);

/* Is vvInt64T x less than vvInt64T y? */
vvBooleanT opLtLL (vvInt64T x, vvInt64T y);

/* Is vvInt64T x less than or equal to vvInt64T y? */
vvBooleanT opLeLL (vvInt64T x, vvInt64T y);

/* Return the maximum of two vvInt64T's */
vvInt64T opMaxLL (vvInt64T x, vvInt64T y);

/* Return the maximum of two vvInt32T's */
vvInt32T opMaxII (vvInt32T x, vvInt32T y);

/* Return the minimum of two vvInt64T's */
vvInt64T opMinLL (vvInt64T x, vvInt64T y);

/* Return the minimum of two vvInt32T's */
vvInt32T opMinII (vvInt32T x, vvInt32T y);

/*
******************************************************************
*
*  Comparison functions (inline)
*
******************************************************************
*/

/* Is vvInt64T x equal to vvInt64T y? */
vvInline vvBooleanT opiEqLL (vvInt64T x, vvInt64T y)
{
    return (x.low == y.low) && (x.high == y.high);
}

/* Is vvInt64T x not equal to vvInt64T y? */
vvInline vvBooleanT opiNeqLL (vvInt64T x, vvInt64T y)
{
    return (x.low != y.low) || (x.high != y.high);
}

/* Is vvInt64T x greater than vvInt64T y? */
vvInline vvBooleanT opiGtLL (vvInt64T x, vvInt64T y)
{
    return (x.high == y.high) ? (x.low > y.low) : (x.high > y.high);
}

/* Is vvInt64T x greater than or equal to vvInt64T y? */
vvInline vvBooleanT opiGeLL (vvInt64T x, vvInt64T y)
{
    return (x.high == y.high) ? (x.low >= y.low) : (x.high >= y.high);
}

/* Is vvInt64T x less than vvInt64T y? */
vvInline vvBooleanT opiLtLL (vvInt64T x, vvInt64T y)
{
    return (x.high == y.high) ? (x.low < y.low) : (x.high < y.high);
}

/* Is vvInt64T x less than or equal to vvInt64T y? */
vvInline vvBooleanT opiLeLL (vvInt64T x, vvInt64T y)
{
    return (x.high == y.high) ? (x.low <= y.low) : (x.high <= y.high);
}

/* Return the maximum of two vvInt64T's */
vvInline vvInt64T opiMaxLL (vvInt64T x, vvInt64T y)
{
    vvBooleanT      ge;
    vvInt64T        result;

    ge = (x.high == y.high) ? (x.low >= y.low) : (x.high >= y.high);
    result = ge ? x : y;
    return result;
}

/* Return the maximum of two vvInt32T's */
vvInline vvInt32T opiMaxII (vvInt32T x, vvInt32T y)
{
    return x >= y ? x : y;
}

/* Return the minimum of two vvInt64T's */
vvInline vvInt64T opiMinLL (vvInt64T x, vvInt64T y)
{
    vvBooleanT      ge;
    vvInt64T        result;

    /* This is opGeLL(x,y) */
    ge = (x.high == y.high) ? (x.low >= y.low) : (x.high >= y.high);

    result = ge ? y : x;

    /* The 'result' temporary variable is required, to avoid a
     * crash in the VC++ 2.1/4.0 optimizer.
     */
    return result;

}

vvInline vvInt32T opiMinII (vvInt32T x, vvInt32T y)
{
    return x <= y ? x : y;
}



/*
******************************************************************
*
*  Array operations
*
*  These are operations on "discrete arrays".
*  See VHDL'93 LRM 7.2.2
*
******************************************************************
*/

/* Is array x greater than array y? */
vvBooleanT opGtAA (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is array x greater than or equal to array y? */
vvBooleanT opGeAA (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is array x less than array y? */
vvBooleanT opLtAA (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is array x less than or equal to array y? */
vvBooleanT opLeAA (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is array x equal to array y? (Assuming the lengths are known to match). */
vvBooleanT opEqAA (vvValuePT x, vvValuePT y, vvInt32T len);

/* Is array x not equal to array y? (Assuming the lengths are known to match). */
vvBooleanT opNeqAA (vvValuePT x, vvValuePT y, vvInt32T len);


/* Is integer array x greater than integer array y? */
vvBooleanT opGtAiAi (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is integer array x greater than or equal to integer array y? */
vvBooleanT opGeAiAi (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is integer array x less than integer array y? */
vvBooleanT opLtAiAi (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);

/* Is integer array x less than or equal to integer array y? */
vvBooleanT opLeAiAi (vvValuePT x, vvValuePT y, vvInt32T x_len, vvInt32T y_len);


/* Perform AND operation on array x and array y.
 * Result is stored in array z (allocated by the caller).
 */
void opAndAA (vvValuePT x, vvValuePT y, vvInt32T len, vvValuePT z);

/* Perform OR operation on array x and array y.
 * Result is stored in array z (allocated by the caller).
 */
void opOrAA (vvValuePT x, vvValuePT y, vvInt32T len, vvValuePT z);

/* Perform NAND operation on array x and array y.
 * Result is stored in array z (allocated by the caller).
 */
void opNandAA (vvValuePT x, vvValuePT y, vvInt32T len, vvValuePT z);

/* Perform NOR operation on array x and array y.
 * Result is stored in array z (allocated by the caller).
 */
void opNorAA (vvValuePT x, vvValuePT y, vvInt32T len, vvValuePT z);

/* Perform NOT operation on array x.
 * Result is stored in array z (allocated by the caller).
 */
void opNotA (vvValuePT x, vvInt32T len, vvValuePT z);

/* Perform XOR operation on array x and array y.
 * Result is stored in array z (allocated by the caller).
 */
void opXorAA (vvValuePT x, vvValuePT y, vvInt32T len, vvValuePT z);

/* Perform XNOR operation on array x and array y.
 * Result is stored in array z (allocated by the caller).
 */
void opXnorAA (vvValuePT x, vvValuePT y, vvInt32T len, vvValuePT z);


/* Fill array x with 'count' copies of vvUInt8T y */
void opFillAB (vvValuePT x, vvInt32T count, vvUInt8T y);

/* Fill array x with 'count' copies of vvInt32T y */
void opFillAI (vvValuePT x, vvInt32T count, vvInt32T y);

/* Fill array x with 'count' copies of vvInt64T y */
void opFillAL (vvValuePT x, vvInt32T count, vvInt64T y);

/* Fill array x with 'count' copies of vvReal64T y */
void opFillAR (vvValuePT x, vvInt32T count, vvReal64T y);

/* Fill array x with 'count' copies of array y */
void opFillAA (vvValuePT x, vvInt32T count, vvValuePT y, vvInt32T y_len);


/*
******************************************************************
*
*  Shift/Rotate operations
*
*  These are operations on any 1 dimension Bit or BOOLEAN array.
*  See VHDL'93 LRM 7.2.3
*
******************************************************************
*/
void    opSllA (vvValuePT x, vvInt32T y, vvInt32T x_len, vvValuePT z);
void    opSrlA (vvValuePT x, vvInt32T y, vvInt32T x_len, vvValuePT z);
void    opSlaA (vvValuePT x, vvInt32T y, vvInt32T x_len, vvValuePT z);
void    opSraA (vvValuePT x, vvInt32T y, vvInt32T x_len, vvValuePT z);
void    opRolA (vvValuePT x, vvInt32T y, vvInt32T x_len, vvValuePT z);
void    opRorA (vvValuePT x, vvInt32T y, vvInt32T x_len, vvValuePT z);


#ifdef __cplusplus
};
#endif

#endif /* OP_H */
