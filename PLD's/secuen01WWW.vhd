--EN ESTE FICHERO SE LLAMA A LAS LIBRERIAS DECLARADAS EN EL FICHERO UNO 

library IEEE;
use ieee.std_logic_1164.all;
use work.uno.all;

entity total IS PORT (
 clk,reset:in bit;
 salida:out std_logic_vector(3 downto 0));
end total;

architecture architotal of total is 
 SIGNAL intermedio:std_logic_vector(1 downto 0);
 BEGIN
	bloque1:octal port map(clk,reset,intermedio);
        bloque2:decoder port map(intermedio,clk,reset,salida);
 end architotal;

