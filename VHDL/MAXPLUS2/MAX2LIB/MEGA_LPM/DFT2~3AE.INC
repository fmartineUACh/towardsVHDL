-- Copyright (c) 1996 by Altera Corporation.  All rights reserved.  This text
-- contains proprietary, confidential information of Altera Corporation, and
-- may be used, copied, and/or disclosed only pursuant to the terms of a
-- valid software license agreement with Altera Corporation.  This copyright
-- notice must be retained as part of this text at all times.

-- MAX+plus II Include File
-- Version 7.0 B 4.5 07/25/96
-- Created: Fri Jul 26 12:53:48 1996

FUNCTION dft2_engine_1port (data_left[2..1][width_data..1], data_right[2..1][width_data..1], twiddle[2..1][width_twiddle..1], load_shift_dist, clear_over_bits, load_a, load_b, a_or_b, dir, clk, fastclk, clear_shift_dist)
    WITH (width_data, width_twiddle, pipeline, width_exponent)
    RETURNS (out[2..1][width_data..1], muxed_data_out[2..1][width_data..1], exponent[width_exponent-1..0]);
