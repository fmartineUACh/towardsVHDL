-- Copyright (c) Altera Corporation, 1996. This file may contain proprietary and confidential
-- information of Altera Corporation that may be used, copied, and disclosed only pursuant to
-- the terms of Altera's Program License Agreement. Altera makes no claim to any end-user or
-- third-party proprietary information that also may be contained in this file. This notice
-- must be contained as part of this text at all times.

-- MAX+plus II Include File
-- Version 7.1 B 4.7 10/11/96
-- Created: Mon Oct 21 09:56:43 1996

FUNCTION fft (clock, start_fft, data_left_in_re[(WIDTH_DATA) - (1)..0], data_left_in_im[(WIDTH_DATA) - (1)..0], data_right_in_re[(WIDTH_DATA) - (1)..0], data_right_in_im[(WIDTH_DATA) - (1)..0], twiddle_re[(WIDTH_TWIDDLE) - (1)..0], twiddle_im[(WIDTH_TWIDDLE) - (1)..0])
    WITH (WIDTH_DATA, WIDTH_TWIDDLE, PIPE_DATA, PIPE_TWIDDLE, WIDTH_EXPONENT, WIDTH_ADD, EXPONENT_INITIAL_VALUE)
    RETURNS (done, data_direction, we_left, add_left[(WIDTH_ADD) - (1)..0], we_right, add_right[(WIDTH_ADD) - (1)..0], add_twiddle[(WIDTH_ADD) - (2)..0], data_out_re[(WIDTH_DATA) - (1)..0], data_out_im[(WIDTH_DATA) - (1)..0], exponent[(WIDTH_EXPONENT) - (1)..0]);

