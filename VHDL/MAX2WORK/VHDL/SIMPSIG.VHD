-- MAX+plus II VHDL Example
-- Simple Signal Assignment
-- Copyright (c) 1994 Altera Corporation

ENTITY simpsig IS
	PORT
	(
		a, b, e	: IN  BIT;
		c, d	: OUT BIT
	);
END simpsig;

ARCHITECTURE maxpld OF simpsig IS
BEGIN

	c <= a AND b;
	d <= e;
	
END maxpld;

