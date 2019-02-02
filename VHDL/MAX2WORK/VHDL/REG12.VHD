-- MAX+plus II VHDL Example
-- User-Defined Macrofunction
-- Copyright (c) 1994 Altera Corporation

ENTITY reg12 IS
	PORT(
		d		: IN   BIT_VECTOR(11 DOWNTO 0);
		clk		: IN   BIT;
		q		: OUT  BIT_VECTOR(11 DOWNTO 0));
END reg12;

ARCHITECTURE a OF reg12 IS
BEGIN
	PROCESS
	BEGIN
		WAIT UNTIL clk = '1';
		q <= d;
	END PROCESS;
END a;

