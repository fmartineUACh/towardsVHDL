library ieee;
use ieee.std_logic_1164.all;
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
if (a(1) = b(1)) and (a(0) = b(0)) then mayor <= '0';
                                      menor <= '0';
                                      igual <= '1';
elsif (a(1) = '1') and (b(1) = '0') then mayor <= '1';
                                         menor <= '0';
                                         igual <= '0';
elsif (a(1) = '0') and (b(1) = '1') then mayor <= '0';
                                         menor <= '1';
                                         igual <= '0';
elsif (a(0) = '1') and (b(0) = '0') then mayor <= '1';
                                         menor <= '0';
                                         igual <= '0';
elsif (a(0) = '0') and (b(0) = '1') then mayor <= '0';
                                         menor <= '1';
                                         igual <= '0';
end if;
end process;
end archicompara;