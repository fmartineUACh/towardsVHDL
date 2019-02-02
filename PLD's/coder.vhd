library ieee;
use ieee.std_logic_1164.all;
entity coder is
port (i: in std_logic_vector(7 downto 0);
			o: out std_logic_vector(2 downto 0));
end coder;

architecture d of coder is
	begin
	process(i)
		begin
		case i is
			when "10000000" => o <= "000";
			when "01000000" => o <= "001";
			when "00100000" => o <= "010";
			when "00010000" => o <= "011";
			when "00001000" => o <= "100";
			when "00000100" => o <= "101";
			when "00000010" => o <= "110";
			when "00000001" => o <= "111";
			when others => o <= "000";
		end case;
	end process;
end d;
