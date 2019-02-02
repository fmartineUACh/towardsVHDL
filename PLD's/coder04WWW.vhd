
library ieee;
use ieee.std_logic_1164.all;

entity codifi is
port(
ent: in std_logic_vector(15 downto 0);
interr: out std_logic; 
sal: out std_logic_vector(3 downto 0)
);

attribute pin_numbers of coder:entity is
  "ent(1):3  ent(2):2   ent(3):20 ent(4):19 ent(5):1  ent(6):23  ent(7):22 ent(8):21 ent(9):10 ent(10):11 ent(11):4 ent(12):5 ent(13):8 ent(14):9 ent(15):6 ent(16):7 " &
  "sal(1):14 sal(2):15 sal(3):16 sal(4):17 interr:18 ";

end codifi;

architecture archicodifi of codifi is
begin
deco: process (ent)
begin
case ent is
  when "0111111111111111" => sal <= "0000"; interr <= '1';
  when "1011111111111111" => sal <= "0001"; interr <= '1';
  when "1101111111111111" => sal <= "0010"; interr <= '1';
  when "1110111111111111" => sal <= "0011"; interr <= '1';
  when "1111011111111111" => sal <= "0100"; interr <= '1';
  when "1111101111111111" => sal <= "0101"; interr <= '1';
  when "1111110111111111" => sal <= "0110"; interr <= '1';
  when "1111111011111111" => sal <= "0111"; interr <= '1';
  when "1111111101111111" => sal <= "1000"; interr <= '1';
  when "1111111110111111" => sal <= "1001"; interr <= '1';
  when "1111111111011111" => sal <= "1010"; interr <= '1';
  when "1111111111101111" => sal <= "1011"; interr <= '1';
  when "1111111111110111" => sal <= "1100"; interr <= '1';
  when "1111111111111011" => sal <= "1101"; interr <= '1';
  when "1111111111111101" => sal <= "1110"; interr <= '1';
  when "1111111111111110" => sal <= "1111"; interr <= '1';
  when others => sal <= "1111"; interr <='0';
end case;
end process deco;
end archicodifi;