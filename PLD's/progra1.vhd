combinados.
library ieee;
use ieee.std_logic_1164.all;
entity compares is port(
	a, b, c, d, w, x, y, z: in std_logic; 
 	j: out std_logic);
end compares;

architecture compares of compares is
	signal tmp: std_logic_vector(3 downto 0);
begin
	tnp <= (a, b, d);
	with tmp select
	      j <= w when "1000",
	              w when "0100",
	               w when "0010",
	               w when "0001",
		"0" others;
end;
