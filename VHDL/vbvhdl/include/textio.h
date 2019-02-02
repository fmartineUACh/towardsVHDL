/*
static char sccsid[] = "@(#)textio.h	1.2 Intergraph(C) 11/7/95 11:45:24 /tmp_mnt/net/supremes/usr6/home/vb93/SCCS/rts/h/s.textio.h";
*/

#ifndef VV_TEXTIO_H
#define VV_TEXTIO_H

/*
******************************************************************
*
*  VeriBest VHDL -- Runtime System
*  STD.TEXTIO handcoded definitions
*
*  Copyright (c) 1995-2005 Intergraph Electronics
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
*  10/20/95	gfung	Created
*
******************************************************************
*/

/* Block structure for package STD.TEXTIO */
typedef struct T_TEXTIO$STD_varsPT {
    void           *parent;
    rtsFileObjPT    INPUT;
    rtsFileObjPT    OUTPUT;
    vvBytePT       *SIDE_tab;
} *TEXTIO$STD_varsPT;

extern TEXTIO$STD_varsPT TEXTIO$STD_vars;

/*
******************************************************************
*
*  VHDL STD.TEXTIO operations
*
******************************************************************
*/

/* Input routines for standard types */

vvBooleanT  rtsTextReadline     (rtsDynPT dyn_ctxt, rtsFileObjPT fobj, vvAccessPT line);
void        rtsTextReadBitG     (rtsDynPT dyn_ctxt, vvAccessPT line, vvUInt8PT bit, vvBooleanPT good);
vvBooleanT  rtsTextReadBit      (rtsDynPT dyn_ctxt, vvAccessPT line, vvUInt8PT bit);
void        rtsTextReadBitvecG  (rtsDynPT dyn_ctxt, vvAccessPT line, vvDescT* desc, vvByteT* bitvec, vvBooleanPT good);
vvBooleanT  rtsTextReadBitvec   (rtsDynPT dyn_ctxt, vvAccessPT line, vvDescT* desc, vvByteT* bitvec);
void        rtsTextReadBoolG    (rtsDynPT dyn_ctxt, vvAccessPT line, vvBooleanPT bool, vvBooleanPT good);
vvBooleanT  rtsTextReadBool     (rtsDynPT dyn_ctxt, vvAccessPT line, vvBooleanPT bool);
void        rtsTextReadCharG    (rtsDynPT dyn_ctxt, vvAccessPT line, vvUInt8PT ch, vvBooleanPT good);
vvBooleanT  rtsTextReadChar     (rtsDynPT dyn_ctxt, vvAccessPT line, vvUInt8PT ch);
void        rtsTextReadIntG     (rtsDynPT dyn_ctxt, vvAccessPT line, vvInt32PT in, vvBooleanPT good);
vvBooleanT  rtsTextReadInt      (rtsDynPT dyn_ctxt, vvAccessPT line, vvInt32PT in);
void        rtsTextReadRealG    (rtsDynPT dyn_ctxt, vvAccessPT line, vvReal64PT re, vvBooleanPT good);
vvBooleanT  rtsTextReadReal     (rtsDynPT dyn_ctxt, vvAccessPT line, vvReal64PT re);
void        rtsTextReadStrG     (rtsDynPT dyn_ctxt, vvAccessPT line, vvDescT* desc, vvByteT* str, vvBooleanPT good);
vvBooleanT  rtsTextReadStr      (rtsDynPT dyn_ctxt, vvAccessPT line, vvDescT* desc, vvByteT* str);
void        rtsTextReadTimeG    (rtsDynPT dyn_ctxt, vvAccessPT line, vvTimePT time, vvBooleanPT good);
vvBooleanT  rtsTextReadTime     (rtsDynPT dyn_ctxt, vvAccessPT line, vvTimePT time);

/* Output routines for standard types */

vvBooleanT  rtsTextWriteline    (rtsDynPT dyn_ctxt, rtsFileObjPT fobj, vvAccessPT line);
vvBooleanT  rtsTextWriteBit     (rtsDynPT dyn_ctxt, vvAccessPT line, vvUInt8T bit, vvInt32T justified, vvInt32T field);
vvBooleanT  rtsTextWriteBitvec  (rtsDynPT dyn_ctxt, vvAccessPT line, vvDescT* desc, vvValuePT bitvec, vvInt32T justified, vvInt32T field);
vvBooleanT  rtsTextWriteBool    (rtsDynPT dyn_ctxt, vvAccessPT line, vvBooleanT bool, vvInt32T justified, vvInt32T field);
vvBooleanT  rtsTextWriteChar    (rtsDynPT dyn_ctxt, vvAccessPT line, vvUInt8T ch, vvInt32T justified, vvInt32T field);
vvBooleanT  rtsTextWriteInt     (rtsDynPT dyn_ctxt, vvAccessPT line, vvInt32T in, vvInt32T justified, vvInt32T field);
vvBooleanT  rtsTextWriteReal    (rtsDynPT dyn_ctxt, vvAccessPT line, vvReal64T re, vvInt32T justified, vvInt32T field, vvInt32T digits);
vvBooleanT  rtsTextWriteStr     (rtsDynPT dyn_ctxt, vvAccessPT line, vvDescT* desc, vvValuePT str, vvInt32T justified, vvInt32T field);
vvBooleanT  rtsTextWriteTime    (rtsDynPT dyn_ctxt, vvAccessPT line, vvTimeT time, vvInt32T justified, vvInt32T field, vvTimeT unit);

#endif /* VV_TEXTIO_H */

