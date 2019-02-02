LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux IS
PORT(a,b,s: IN std_logic;
O: OUT std_logic);
END mux;

ARCHITECTURE Arq1 OF mux IS
   begin
  PROCESS(a,b,s)
  BEGIN
  IF s='0' THEN 
	O<= a;
    else
	O<=b;
	END IF;
  END PROCESS;
  END arq1;


