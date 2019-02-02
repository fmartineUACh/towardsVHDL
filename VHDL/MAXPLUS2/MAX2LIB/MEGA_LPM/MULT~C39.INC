-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.1 02/26/96
-- Created: Wed Mar 20 11:12:17 1996

FUNCTION mult_complex (a[2..1][widtha..1], b[2..1][widthb..1], clk)
    WITH (widtha, widthb)
    RETURNS (result[2..1][(widtha) + (widthb)..1]);
