library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
  
entity contador is port(
clk:       in std_logic;
conta: buffer std_logic_vector(3 downto 0)
);
end contador;
  
architecture archicontador of contador is
begin
process (clk)
begin
  if (clk'event and clk= '1') then
    conta <= conta + 1;
  end if;
end process;
end archicontador;