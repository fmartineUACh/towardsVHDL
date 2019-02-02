-- Copyright (c) Altera Corporation, 1996. This file may contain proprietary and confidential
-- information of Altera Corporation that may be used, copied, and disclosed only pursuant to
-- the terms of Altera's Program License Agreement. Altera makes no claim to any end-user or
-- third-party proprietary information that also may be contained in this file. This notice
-- must be contained as part of this text at all times.

-- MAX+plus II Include File
-- Version 7.0 RC2 08/21/96
-- Created: Mon Sep 09 12:13:43 1996
-- edited to add these constants.
-- constant left5 = 5;
-- constant left4 = 4;
constant left3 = 3;
constant left2 = 2;
constant left1 = 1;
constant zero =  0;


FUNCTION fft_shift (data[(width) - (1)..0], distance[1..0])
    WITH (width)
    RETURNS (result[(width) - (1)..0]);
