library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gatespkg.all;

entity eqcomp4 is
port (a,b: in std_logic_vector(3 downto 0);
	aeqb: out std_logic);
end eqcomp4;

architecture estructura of eqcomp4 is
signal	x: std_logic_vector(0 to 3);
signal yy,xx:bit;
	begin
		u0:xnor2 port map(a(0), b(0),x(0));
		u1:xnor2 port map(a(1), b(1),x(1));
		u2:xnor2 port map(a(2), b(2),x(2));
		u3:xnor2 port map(a(3), b(3),x(3));
		u4:and4 port map(x(0), x(1), x(2), x(3), aeqb);
	end estructura;
