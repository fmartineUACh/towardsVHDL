library ieee;
use ieee.std_logic_1164.all;

entity exa is
	port(a: in (7 downto 0);
		 b: out(2 downto 0);
		 clk: in);
end exa;

architecture e of exa is
	begin
		process(a, clk)
			begin
			if a='10000000' then
			   b<= '000';
			else a='01000000' then
				b<='001';
			end if;
		end process;
	end e;
