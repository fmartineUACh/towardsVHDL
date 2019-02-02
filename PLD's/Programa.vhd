library ieee;
use ieee.std_logic_1164.all;
entity decode is port(
	adress: in std_logic_vector(15 downto 0);
	valid, boot_up: in std_logic;
	sram, prom, eeprom, shadow,
	periph1, periph2:       out std_logic);
end decode;

architecture mem_decode of decode is
begin
mapper: process(adress, valid, boot_up) begin
		shadow  <='0';
		prom    <='0';
		periph1 <='0';
		periph2 <='0';
		sram    <='0';
		eeprom  <='0';
		if valid = '1' then
				if adress >= x"000" and adress < x"4000" then
					if boot_up = '1' then
							shadow <= '1';
					else
							prom <='1';
					end if;
				elsif adress>= x"4000" and adress < x"4008" then
					periph1 <= '1';	
				elsif adress >= x"40008" and adress < x"4010" then
					periph2 <= '1';
				elsif adress >= x"8000" and adress < x"C000" then
					sram <= '1';
				elsif adress >= x"C000" then
					eeprom <= '1';
				end if;
		end if;
		end process;
end mem_decode;
