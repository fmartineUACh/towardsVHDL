-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 6.2 B 1.3 02/28/96
-- Created: Mon Mar 11 14:13:19 1996

FUNCTION comptree (dataa[(lpm_width) - (1)..0], datab[(lpm_width) - (1)..0], clk, aset)
    WITH (lpm_width, CHAIN_LENGTH, ONE_INPUT_CONSTANT, OUTPUTS_CLOCKED, BURRIED_CLOCKED, MODE)
    RETURNS (aeb, agb);
