-- MAX+plus II VHDL Example
-- LPM Component Instantiation
-- Copyright (c) 1996 Altera Corporation

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY lpm;
USE lpm.lpm_components.ALL;

ENTITY reg24lpm IS
	PORT(
		d		: IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		clk		: IN  STD_LOGIC;
		q		: OUT STD_LOGIC_VECTOR(23 DOWNTO 0));
END reg24lpm;

ARCHITECTURE a OF reg24lpm IS
BEGIN
	reg12a	: lpm_ff
		GENERIC MAP (LPM_WIDTH => 12)
		PORT MAP (data => d(11 DOWNTO 0), clock => clk, 
				q => q(11 DOWNTO 0));
	reg12b	: lpm_ff
		GENERIC MAP (LPM_WIDTH => 12)
		PORT MAP (data => d(23 DOWNTO 12), clock => clk, 
				q => q(23 DOWNTO 12));
END a;