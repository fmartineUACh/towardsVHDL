-- Copyright (c) Altera Corporation, 1996. This file may contain proprietary and confidential
-- information of Altera Corporation that may be used, copied, and disclosed only pursuant to
-- the terms of Altera's Program License Agreement. Altera makes no claim to any end-user or
-- third-party proprietary information that also may be contained in this file. This notice
-- must be contained as part of this text at all times.

-- MAX+plus II Include File
-- Version 7.0 RC2 08/21/96
-- Created: Wed Sep 04 16:21:20 1996

FUNCTION fft_controller (clk, reset)
    WITH (pipe_engine, pipe_data, width_add, pipe_tw_delay, pipe_twiddle)
    RETURNS (we_r, we_l, load_shift_dist, load_a, load_b, dir, clear_over_bits, a_or_b, add_r[width_add..1], add_l[width_add..1], add_tw[(width_add) - (1)..1], done, clear_shift_dist);
