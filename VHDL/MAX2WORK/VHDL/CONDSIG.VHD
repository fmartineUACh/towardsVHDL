-- MAX+plus II VHDL Example
-- Conditional Signal Assignment
-- Copyright (c) 1994 Altera Corporation

ENTITY condsig IS
	PORT
	(
		input0, input1, sel	: IN  BIT;
		output				: OUT BIT
	);
END condsig;

ARCHITECTURE maxpld OF condsig IS
BEGIN

	output <= input0 WHEN sel = '0' ELSE input1;
		
END maxpld;

