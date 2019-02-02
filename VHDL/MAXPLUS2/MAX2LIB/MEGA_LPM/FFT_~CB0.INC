-- Copyright (c) Altera Corporation, 1996. This file may contain proprietary and confidential
-- information of Altera Corporation that may be used, copied, and disclosed only pursuant to
-- the terms of Altera's Program License Agreement. Altera makes no claim to any end-user or
-- third-party proprietary information that also may be contained in this file. This notice
-- must be contained as part of this text at all times.

-- MAX+plus II Include File
-- Version 7.1 B 3.2 09/13/96
-- Created: Tue Sep 24 10:28:02 1996

FUNCTION fft_on_chip (clock, start_fft, data_in_re[(WIDTH_DATA) - (1)..0], data_in_im[(WIDTH_DATA) - (1)..0], load_bank_reset, load_bank_enable, unload_bank_reset, unload_bank_enable, load_nrun)
    WITH (WIDTH_DATA, TWIDDLE_FILE, FFT_DIRECTION, WIDTH_TWIDDLE, WIDTH_EXPONENT, WIDTH_ADD)
    RETURNS (done, data_out_re[(WIDTH_DATA) - (1)..0], data_out_im[(WIDTH_DATA) - (1)..0], exponent[(WIDTH_EXPONENT) - (1)..0]);

