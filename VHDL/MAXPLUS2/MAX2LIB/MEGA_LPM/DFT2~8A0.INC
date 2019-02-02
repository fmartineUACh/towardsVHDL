-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.2 B 2.5 03/20/96
-- Created: Fri Mar 22 16:34:04 1996

FUNCTION dft2_engine (dataa[2..1][width_data..1], datab[2..1][width_data..1], twiddle[2..1][width_twiddle..1], shift_dist[1..0], clk)
    WITH (width_data, width_twiddle)
    RETURNS (outa[2..1][width_data..1], outb[2..1][width_data..1]);
