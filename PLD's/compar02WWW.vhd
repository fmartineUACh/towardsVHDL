library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity compara is port(
a,b: in std_logic_vector(1 downto 0);
mayor: out std_logic;
menor: out std_logic;
igual: out std_logic
);
end compara;
architecture archicompara of compara is
begin
process (a,b)
begin
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
end process;
end archicompara;