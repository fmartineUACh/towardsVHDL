LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ff IS
	PORT(
		d,cl:IN std_logic;
		q:out std_logic);
END ff;

ARCHITECTURE ejem OF ff IS
	SIGNAL daux: STD_LOGIC;
BEGIN
	PROCESS (clk)
	BEGIN
		IF clk='1' THEN
			q<=daux AFTER 10 ns;
		END IF;
	END PROCESS;
daux=d AFTER 5 ns;	
END ejem;
	
