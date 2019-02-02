-- MAX+plus II VHDL Example
-- Component Instantiation Statement
-- Copyright (c) 1994 Altera Corporation

LIBRARY altera;
USE altera.maxplus2.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY compinst IS
	PORT
	(
		data, clock, clearn, presetn	: IN	STD_LOGIC;
		q_out							: OUT	STD_LOGIC;
		
		a, b, c, gn						: IN	STD_LOGIC;
		d								: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		y, wn							: OUT 	STD_LOGIC
	);
END compinst;

ARCHITECTURE a OF compinst IS

BEGIN

	dff1 : dff PORT MAP (d =>data, q => q_out, clk => clock, clrn => clearn, prn => presetn);
	
	mux	: a_74151b PORT MAP (c, b, a, d, gn, y, wn);
END a;

