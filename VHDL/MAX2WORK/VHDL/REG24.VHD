-- MAX+plus II VHDL Example
-- User-Defined Macrofunction
-- Copyright (c) 1994 Altera Corporation

PACKAGE reg24_package IS
	COMPONENT reg12
		PORT(
			d	: IN	BIT_VECTOR(11 DOWNTO 0);
			clk	: IN	BIT;
			q	: OUT	BIT_VECTOR(11 DOWNTO 0));
	END COMPONENT;
END reg24_package;

LIBRARY work;
USE work.reg24_package.ALL;

ENTITY reg24 IS
	PORT(
		d		: IN   BIT_VECTOR(23 DOWNTO 0);
		clk		: IN   BIT;
		q		: OUT  BIT_VECTOR(23 DOWNTO 0));
END reg24;

ARCHITECTURE a OF reg24 IS
BEGIN
	reg12a	: reg12 PORT MAP (d => d(11 DOWNTO 0), clk => clk, 

			  q => q(11 DOWNTO  0));
	reg12b	: reg12 PORT MAP (d => d(23 DOWNTO 12), clk => clk, 
			  q => q(23 DOWNTO 12));
END a;

