-- MAX+plus II VHDL Example
-- Latch Inference
-- Copyright (c) 1994 Altera Corporation

ENTITY latchinf IS
	PORT
	(
		enable, data	: IN BIT;
		q				: OUT BIT
	);
END latchinf;

ARCHITECTURE maxpld OF latchinf IS
BEGIN

latch :	PROCESS (enable, data)
		BEGIN
			IF (enable = '1') THEN
				q <= data;
			END IF;
		END PROCESS latch;

END maxpld;

