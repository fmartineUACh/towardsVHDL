library ieee;
use ieee.std_logic_1164.all;

entity decoder is
port(address:in std_logic_vector(2 downto 0);
	decode:	out std_logic_vector(7 downto 0));
end decoder;

	architecture design of decoder is
	begin
	  process(address)
			begin
				case address is
					when "000" => decode <="10000000";
					when "001" => decode <="01000000";
					when "010" => decode <="00100000";
					when "011" => decode <="00010000";
					when "100" => decode <="00001000";
					when "101" => decode <="00000100";
					when "110" => decode <="00000010";
					when "111" => decode <="00000001";
					when others => decode <="10000000";
				end case;
		end process;
	end design;
