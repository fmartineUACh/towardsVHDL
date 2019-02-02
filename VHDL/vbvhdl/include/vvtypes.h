/* sccsid: "@(#)types.h	1.8 VeriBest Inc.(C) 7/20/95 14:11:46 /tmp_mnt/net/supremes/usr6/home/vb93/SCCS/h/s.types.h"; */

#ifndef VV_TYPES_H
#define VV_TYPES_H


/*
******************************************************************
*
*  VeriBest VHDL Global Types
*
*  Copyright (c) 1996, VeriBest Inc.
*  Mountain View, CA 94041
*
******************************************************************
*/

typedef unsigned char vvBooleanT, *vvBooleanPT;
#undef  FALSE
#define FALSE (vvBooleanT)0
#undef  TRUE
#define TRUE  (vvBooleanT)1

typedef unsigned char vvByteT, *vvBytePT;

typedef signed char     vvInt8T,
                       *vvInt8PT;
typedef unsigned char   vvUInt8T,
                       *vvUInt8PT;
typedef signed short    vvInt16T,
                       *vvInt16PT;
typedef unsigned short  vvUInt16T,
                       *vvUInt16PT;
typedef int             vvInt32T,
                       *vvInt32PT;
typedef unsigned int    vvUInt32T,
                       *vvUInt32PT;

typedef double          vvReal64T,
                       *vvReal64PT;

typedef struct {
        vvInt32T      high;
        vvUInt32T     low;
} vvInt64T,
 *vvInt64PT;

typedef vvInt64T      vvTimeT,
                     *vvTimePT;

typedef vvInt64T      sioTime;

typedef struct {
        vvInt16T      high;
        vvUInt32T     low;
} vvInt48T,
 *vvInt48PT;

typedef vvInt48T      vvTime48T,
                     *vvTime48PT;




typedef vvUInt8T     *vvValuePT;

typedef struct TvvDescT {
    vvInt32T          left;
    vvInt32T          right;
    vvInt32T          length;
    vvInt32T          dir;
} vvDescT,
 *vvDescPT;

typedef struct TvvDescLT {
    vvInt64T          left;
    vvInt64T          right;
    vvInt32T          dir;
} vvDescLT,
 *vvDescLPT;

typedef struct TvvDescRT {
    vvReal64T         left;
    vvReal64T         right;
    vvInt32T          dir;
} vvDescRT,
 *vvDescRPT;

typedef vvInt32T        vvAccessT,
                       *vvAccessPT;

#ifdef __GNUC__
#define vvInline __inline__ extern
#else
#define vvInline __inline
#endif

#endif  /* VV_TYPES_H */
