LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux IS
PORT(a,b,sel: IN  bit;
salida: OUT bit);
END mux;

ARCHITECTURE serie OF mux IS
   begin
  PROCESS(a,b,sel)
  BEGIN
  IF sel='0' THEN 
	salida<= a;
    else
	salida<=b;
	END IF;
  END PROCESS;
  END serie;


