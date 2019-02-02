library ieee;
use ieee.std_logic_1164.all;
entity convertidor is
port(
bcd: in  bit_vector(3 downto 0);
led: out bit_vector(6 downto 0)
);
end convertidor;
architecture archiconv of convertidor is
begin
conv: process (bcd)
begin
 case bcd is
  when "0000" => LED <= "1111110";
  when "0001" => LED <= "1100000";
  when "0010" => LED <= "1011011";
  when "0011" => LED <= "1110011";
  when "0100" => LED <= "1100101";
  when "0101" => LED <= "0110111";
  when "0110" => LED <= "0111111";
  when "0111" => LED <= "1100010";
  when "1000" => LED <= "1111111";
  when "1001" => LED <= "1110111";
  when others => LED <= "0000000";  -- si no se introduce BCD no se enciende ningún led
 end case;
end process conv;
end archiconv;