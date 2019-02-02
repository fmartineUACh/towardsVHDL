-- MAX+plus II VHDL Example
-- Conversion Function
-- Copyright (c) 1994 Altera Corporation

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY adder IS
	PORT (op1, op2		: IN  UNSIGNED(7 downto 0);
		   result		: OUT INTEGER);
END adder;

ARCHITECTURE maxpld OF adder IS
BEGIN
	result <= CONV_INTEGER(op1 + op2);
END maxpld;

