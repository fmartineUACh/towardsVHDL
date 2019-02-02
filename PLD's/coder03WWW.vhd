library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity coder is port(
dentro: in  std_logic_vector(7 downto 0);
fuera : out std_logic_vector(2 downto 0);
eo    : out bit
);
end coder;
architecture archicoder of coder is
begin
process (dentro)
begin
 if std_match(dentro,"1-------") then fuera<="111"; eo<='0'; end if;
 if std_match(dentro,"01------") then fuera<="110"; eo<='0'; end if;
 if std_match(dentro,"001-----") then fuera<="101"; eo<='0'; end if;
 if std_match(dentro,"0001----") then fuera<="100"; eo<='0'; end if;
 if std_match(dentro,"00001---") then fuera<="011"; eo<='0'; end if;
 if std_match(dentro,"000001--") then fuera<="010"; eo<='0'; end if;
 if std_match(dentro,"0000001-") then fuera<="001"; eo<='0'; end if;
 if std_match(dentro,"00000001") then fuera<="000"; eo<='0'; end if;
 if std_match(dentro,"00000000") then fuera<="000"; eo<='1'; end if;
end process;
end archicoder;