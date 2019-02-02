-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.2 B 2.5 03/20/96
-- Created: Fri Mar 22 15:04:21 1996

FUNCTION tw_counter (clk, restart, reset)
    WITH (LPM_WIDTH)
    RETURNS (q[lpm_width..1], done);
