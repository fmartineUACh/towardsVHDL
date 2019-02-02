library ieee;
use ieee.std_logic_1164.all;
entity mux is port(
		a, b, c, d:		in std_logic_vector(3 downto 0);
		s:				in std_logic_vector(1 downto 0);
		x:				out std_logic_vector(3 downto 0));
end mux;

architecture archmux of mux is
begin
with s select
	x <= a when "00",
		 b when "01",
		 c when "10",
		 d when "11",
  		 "----" when others;
end archmux;