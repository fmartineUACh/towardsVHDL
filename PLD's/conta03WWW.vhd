library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
  
entity contador is port(
clk, load, reset:in std_logic;
data:    in std_logic_vector(3 downto 0);
conta:buffer std_logic_vector(3 downto 0)
);
end contador;
  
architecture archicontador of contador is
begin
process (clk,reset)
begin
  if reset = '1' then
   conta <= "0000";
  elsif (clk'event and clk= '1') then
   if load = '1' then
    conta <= data;
   else
    conta <= conta + 1;
   end if;
  end if;
end process;
end archicontador;