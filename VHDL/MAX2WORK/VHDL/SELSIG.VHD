-- MAX+plus II VHDL Example
-- Selected Signal Assignment
-- Copyright (c) 1994 Altera Corporation

ENTITY selsig IS
	PORT
	(
		d0, d1, d2, d3	: IN BIT;
		s				: IN INTEGER RANGE 0 TO 3;	
		output			: OUT BIT
	);
END selsig;

ARCHITECTURE maxpld OF selsig IS
BEGIN

WITH s SELECT		-- creates a 4-to-1 multiplexer
	output <=	d0 WHEN 0,
				d1 WHEN 1,
				d2 WHEN 2,
				d3 WHEN 3;
		
END maxpld;

