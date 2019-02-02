-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.2 05/21/96
-- Created: Mon Jun 24 17:49:24 1996

FUNCTION a8255 (clk, ncs, nrd, nwr, reset, a[1..0], din[7..0], pain[7..0], pbin[7..0], pcin[7..0])
    WITH (DEVICE_FAMILY)
    RETURNS (paen, pben, dout[7..0], paout[7..0], pbout[7..0], pcen[7..0], pcout[7..0]);
