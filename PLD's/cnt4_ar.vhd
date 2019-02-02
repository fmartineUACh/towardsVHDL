library ieee;
use ieee.std_logic_1164.all;
USE work.STD_ARITH.all;

entity counter is port(
	clk, reset, load,counten:	in std_logic;
	data:				in std_logic_vector(3 downto 0);
	count:				buffer std_logic_vector(3 downto 0));
end counter;

architecture archcounter of counter is
begin
upcount: process (clk, reset)
	begin
		if reset = '1' then
			count <= "0000";
		elsif (clk'event and clk= '1') then
			if load = '1' then
				count <= data;
			elsif counten = '1' then
				count <= count + 1;
			end if;
		end if;	
	end process upcount;
end archcounter;
