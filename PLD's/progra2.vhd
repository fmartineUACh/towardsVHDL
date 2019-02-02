library ieee;
use ieee.std_logic_1164.all;
use work.numeric_std.all;
entity compare is port(
	a:	 in unsigned(downto 0); 
 	j: 	out std_logic);
end compare;

architecture compare of compare is
begin
x <= '1' when a = 3 else '0';
end;
