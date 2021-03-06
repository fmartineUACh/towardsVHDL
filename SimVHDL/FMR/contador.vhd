library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all; --Declaración de librerías para usar el tipo std_logic y para poder usar el signo + para sumar 
      
entity contador3 is port(
clk, load, reset,arriba:in std_logic;
data:    in std_logic_vector(3 downto 0);
conta:buffer std_logic_vector(3 downto 0)
);
end contador3; 
      
architecture archicontador of contador3 is
begin
process (clk,reset)
begin
  if reset = '1' then
   conta <= "0000";
  elsif (clk'event and clk= '1') then
   if load = '1' then
    conta <= data;
   elsif arriba = '1' then
    conta <= conta + 1;
   else conta <= conta - 1;
   end if;
  end if;
end process;
end archicontador; 
