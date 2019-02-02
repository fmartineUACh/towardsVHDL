-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.2 B 2.4 03/19/96
-- Created: Wed Mar 20 10:05:03 1996

FUNCTION fmult (clock, dataa[lpm_widtha..1], datab[lpm_widthb..1])
    WITH (lpm_widtha, lpm_widthb, latency, lpm_representation, lpm_widthp)
    RETURNS (result[lpm_widthp..1]);
