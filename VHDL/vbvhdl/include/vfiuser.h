/*
static char sccsid[] = "@(#)vfi.h	1.1 VeriBest, Inc.(C) 11/6/95 15:45:06 /tmp_mnt/net/supremes/usr6/home/vb93/SCCS/rts/h/s.rts.h";
*/

#ifndef VV_VFI_USER_H
#define VV_VFI_USER_H

/*
******************************************************************
*
*  VeriBest VHDL -- Foreign Interface
*  Main user include file
*
*  Copyright (c) 1997 VeriBest, Inc.
*  Mountain View, CA 94041
*
******************************************************************
*/

/*
******************************************************************
*
*  Modification History
*
*  01/14/97  sar  Created
*
******************************************************************
*/

#include "vvtypes.h"

#ifdef __cplusplus
#define VFI_EXTERN_C    extern "C"
#else
#define VFI_EXTERN_C    extern
#endif


/* All user functions that are named in FOREIGN strings
 * should be declared with the keyword Foreign:
 */
#define Foreign     VFI_EXTERN_C __declspec(dllexport)



typedef struct TvfiCallbacksT {

    void        (*vfiPrintfP)   (char *msg, ...);
    vvInt64T    (*vfiNowP)      ();
    vvInt32T    (*vfiNowCycleP) ();

} vfiCallbacksT,
 *vfiCallbacksPT;


#ifndef VFI_IN_SIMULATOR

VFI_EXTERN_C vfiCallbacksPT     vfi_callbacksP;

/* 
 * Callbacks available to the user's Foreign DLL
 */

#define vfiPrintf   (*vfi_callbacksP->vfiPrintfP)
#define vfiNow      (*vfi_callbacksP->vfiNowP)
#define vfiNowCycle (*vfi_callbacksP->vfiNowCycleP)


#else  /* VFI_IN_SIMULATOR */

vfiCallbacksT   rts_for_callbacks = {
    vfiPrintf,
    vfiNow,
    vfiNowCycle,
};

#endif /* VFI_IN_SIMULATOR */

#endif /* VV_VFI_USER_H */

