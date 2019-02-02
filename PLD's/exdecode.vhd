library ieee;
use ieee.std_logic_1164.all;
entity coder is
port (i: in std_logic_vector(7 downto 0);
			o: out std_logic_vector(2 downto 0);
			clk, rst: in std_logic);
end coder;

architecture d of coder is
	begin
	process (i)
	begin
	if (i = b"10000000") then o <= "000";
	elsif i <= "01000000" then o <= "001";
	elsif i <= "00100000" then o <= "010";
	elsif i <= "00010000" then o <= "011";
	elsif i <= "00001000" then o <= "100";
	elsif i <= "00000100" then o <= "101";
	elsif i <= "00000010" then o <= "110";
	elsif i <= "00000001" then o <= "111";
	end if;
	end process;
end d;
