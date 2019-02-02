-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.2 B 2.1 03/14/96
-- Created: Fri Mar 15 15:35:23 1996

FUNCTION fft_delay (d[(width) - (1)..0], clk)
    WITH (width, cycles)
    RETURNS (q[(width) - (1)..0]);
