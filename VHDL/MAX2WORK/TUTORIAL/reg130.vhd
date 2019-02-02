LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY REG130 IS
	PORT(
		d,clk:IN std_logic;
		q	:OUT std_logic);
END REG130;

ARCHITECTURE ejem OF REG130 IS
	SIGNAL daux: STD_LOGIC;
BEGIN
	PROCESS (clk)
	BEGIN
		IF clk='1' THEN
			q<=daux AFTER 10 ns;
		END IF;
	END PROCESS;
daux<=d AFTER 5 ns;	
END ejem;
	
