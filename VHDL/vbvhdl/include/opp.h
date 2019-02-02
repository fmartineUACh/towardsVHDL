/* static char sccsid[] = "@(#)opp.h	1.3 Intergraph(C) 8/10/95 18:03:57 /tmp_mnt/net/supremes/usr6/home/vb93/SCCS/op/h/s.opp.h"; */

#ifndef OP_P_H
#define OP_P_H

/*
******************************************************************
*
*  VeriBest VHDL -- Runtime Libraries
*  Operations -- Fast macros (opp.h == for the preprocessor)
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
*  08/09/95  sarice    Created fast macros
*
******************************************************************
*/


/* The header opp.h is the only op header required by an
 * application using op macros or functions.
 */
#include "op.h"



/*
******************************************************************
*
*  Conversion functions
*
******************************************************************
*/

/* Convert a vvInt32T to a vvInt64T */
#define oppConvLI(RESULT, X) \
    { \
        (RESULT).high = ((X) < 0) ? (vvInt32T) ~0 : 0; \
        (RESULT).low  = (X); \
    }

/* Convert a vvInt64T to a vvInt32T (ignoring overflow) */
#define oppConvIL(RESULT, X) \
    { \
        (RESULT) = (vvInt32T) (X).low; \
    }

/*
******************************************************************
*
*  Addition and subtraction functions
*
******************************************************************
*/

/* Negate a vvInt64T
 * RESULT and X may be the same variable.
 */
#define oppNegL(RESULT, X) \
    { \
        (RESULT).high = ~(X).high; \
        (RESULT).low  = ~(X).low; \
        if (!(++(RESULT).low)) \
            (RESULT).high++; \
    }


/* Add two vvInt64T's
 * RESULT and X may be the same variable.
 * RESULT and Y may -not- be the same variable.
 */
#define oppAddLL(RESULT, X, Y) \
    { \
        (RESULT).high = (X).high + (Y).high; \
        (RESULT).low  = (X).low  + (Y).low; \
        if ((RESULT).low < (Y).low) \
            (RESULT).high++; \
    }

/* Add a vvInt64T and a vvUInt32T
 * RESULT and X may be the same variable.
 * RESULT and Y may -not- be the same variable.
 */
#define oppAddLUI(RESULT, X, Y) \
    { \
        (RESULT).high = (X).high; \
        (RESULT).low  = (X).low  + (Y); \
        if ((RESULT).low < (Y)) \
            (RESULT).high++; \
    }

/*
******************************************************************
*
*  Multiplication functions
*
******************************************************************
*/


/*
******************************************************************
*
*  Division functions
*
******************************************************************
*/


/*
******************************************************************
*
*  Comparison functions
*
******************************************************************
*/

/* Is vvInt64T x equal to vvInt64T y?
 * The macro returns a vvBooleanT value.
 */
#define oppEqLL(X, Y) \
    (((X).low == (Y).low) && ((X).high == (Y).high))


/* Is vvInt64T x greater than vvInt64T y?
 * The macro returns a vvBooleanT value.
 */
#define oppGtLL(X, Y) \
    (((X).high == (Y).high) ? ((X).low > (Y).low) : ((X).high > (Y).high))


/* Is vvInt64T x greater than or equal to vvInt64T y?
 * The macro returns a vvBooleanT value.
 */
#define oppGeLL(X, Y) \
    (((X).high == (Y).high) ? ((X).low >= (Y).low) : ((X).high >= (Y).high))


/* Is vvInt64T x less than vvInt64T y?
 * The macro returns a vvBooleanT value.
 */
#define oppLtLL(X, Y) \
    (((X).high == (Y).high) ? ((X).low < (Y).low) : ((X).high < (Y).high))


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


#endif /* OP_P_H */
