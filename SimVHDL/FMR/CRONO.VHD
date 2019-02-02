library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all; --Declaración de librerías para usar el tipo 
						--std_logic y para poder usar el signo + para sumar

entity crono is port(
clk, reset, paro :in std_logic;
centesima :out std_logic_vector(3 downto 0);
decimas   :out std_logic_vector(3 downto 0);
segundos  :out std_logic_vector(3 downto 0);
s10       :out std_logic_vector(2 downto 0);
minuto    :out std_logic_vector(3 downto 0));
end crono;

architecture archicontador of crono is
begin
process (clk,reset)
begin
if reset = '1' then
   centesima <= "0000";
   decimas  <= "0000";
   segundos <= "0000";
   minuto <= "0000";
elsif (clk'event and clk= '1') then
   	if centesima = "1001" then
		centesima <= "0000";
	    decimas <= decimas +1;
		if decimas = "1001" then
		decimas <= "0000";
		segundos <= segundos +1;
			if segundos = "1001" then
			segundos <= "0000";
			s10 <= s10 +1;
				if s10 = "110" then
				s10 <= "000";
				minuto <= minuto +1;
			    else
				s10 <= s10 +1;
				end if;
			else
			segundos <= segundos +1;
			end if;
		else
		decimas <= decimas +1;
		end if;
	else
    centesima <= centesima +1;
	end if;
end if ;
end process;
end archicontador;
