library ieee;
use ieee.std_logic_1164.all;
entity mux is port(
		a:		in bit;
		b:		in bit;
		s:			in bit;
		x:			out bit);
end mux;

architecture archmux of mux is
begin
with s select
	x <= a when '0',
		 b when '1';

end archmux;
