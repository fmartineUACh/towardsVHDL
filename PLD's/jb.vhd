LIBRARY ieee;
use work.std_logic_1164.all;
entity compare is port (
	a, b: 	in std_logic_vector (3 downto 0);
	aeqb: 	out std_logic);
end compare;

use work.gatespkg.all;
architecture archcompare of compare is
	signal c: std_logic_vector (3 downto 0);
begin
	x0: xor2 port map(a(0), b(0), c(0));
	x1: xor2 port map(a(1), b(1), c(1));
	x2: xor2 port map(a(2), b(2), c(2));
	x3: xor2 port map(a(3), b(3), c(3));

	n1: nor4 port map(c(0), c(1), c(2), c(3), aeqb);
	end;


