LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use work.uno.all;

entity decoder is port (
 seleccion:in std_logic_vector(1 downto 0);
 enable1,enable2: in bit;
 salida: out std_logic_vector(3 downto 0));
end decoder;
architecture archidecoder of decoder is
begin
decodificador:PROCESS(seleccion,enable1,enable2)
begin
 if enable2='1' then salida<=(others=>'0');
 elsif enable2='0' and enable1='0' then salida<=(others  => '0');
 elsif(enable1='1') then 
  CASE seleccion IS
	when "00" => salida <= "0001";
	when "01" => salida <= "0010";
	when "10" => salida <= "0100";
	when "11" => salida <= "1000";
	when others => salida <="1111";
  END CASE;
 END IF;
END PROCESS decodificador;
END archidecoder;
