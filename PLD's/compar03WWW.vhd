library ieee;
use ieee.std_logic_1164.all;
entity compara is port(
a,b: in std_logic_vector(1 downto 0);
antes_mayor: in std_logic;
antes_menor: in std_logic;
antes_igual: in std_logic;
mayor: out std_logic;
menor: out std_logic;
igual: out std_logic
);
end compara;
architecture archicompara of compara is
begin
process (a,b,antes_igual,antes_mayor,antes_menor)
begin
if antes_igual = '0' then igual <= antes_igual;
                         mayor <= antes_mayor;
                         menor <= antes_menor;
elsif antes_igual = '1' then
  if a > b then mayor <= '1';
                menor <= '0';
                igual <= '0';
  elsif a < b then mayor <= '0';
                   menor <= '1';
                   igual <= '0';
  elsif a = b then mayor <= '0';
                   menor <= '0';
                   igual <= '1';
  end if;
end if;
end process;
end archicompara;