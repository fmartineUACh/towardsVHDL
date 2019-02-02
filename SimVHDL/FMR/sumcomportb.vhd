library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;

entity suma is
port (a:in bit; b:in bit; s:out bit; 
	c:out bit; aux:buffer bit_vector); end suma;

architecture comporta of suma is
begin
	process(a,b)
--variable aux:std_logic_vector(0 to 1);
begin
--aux:=('0' & a) + ('0' & b);
		aux<= ('0' & a) xor ('0' & b);
		s<=aux(0);
		c<=aux(1);
	end process;
	end comporta;

