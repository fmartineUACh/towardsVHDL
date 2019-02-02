library ieee;
use work.std_arith.all;
use ieee.std_logic_1164.all;

entity counter is
port(
	clk, reset, load:	in std_logic;
	data:			in std_logic_vector(3 downto 0);
	count:			out std_logic_vector(3 downto 0));
end counter;

architecture archcounter of counter is
begin
upcount: process (clk)
	begin
		if (clk'event and clk= '1') then
			if load = '1' then
				count <= data;
			else
				count <= count+1;
			end if;
		end if;	
	end process upcount;
end archcounter;
