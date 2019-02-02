library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity resta is port (
a,b: in std_logic_vector(3 downto 0);
sr:  in std_logic;
c:   out std_logic_vector(3 downto 0)
);
end resta;

architecture archiresta of resta is
signal aux : std_logic_vector(3 downto 0);
begin
 process (a,b,sr,aux)
  begin
  if sr='0' then aux<=b;
  elsif sr='1' then aux<=not(b);
end if;
end process;
 c<=a+aux+("000"&sr);
end archiresta;