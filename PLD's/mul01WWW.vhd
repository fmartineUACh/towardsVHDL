library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;

entity multi is port(
a,b: in     std_logic_vector(2 downto 0);
c  : buffer std_logic_vector(5 downto 0)
);
end multi;

architecture archimulti of multi is
signal aux1,aux2,aux3: std_logic_vector(5 downto 0);
begin
process (a,b)
 begin
  if b(0)='1' then aux1 <= ('0', '0',  '0',  a(2), a(1), a(0)); 
   elsif b(0)='0' then  aux1<=(others => '0'); end if ;
  if b(1)='1' then aux2 <= ('0', '0',  a(2), a(1), a(0), '0' ); 
   elsif b(1)='0' then  aux2<=(others => '0'); end if;
  if b(2)='1' then aux3 <= ('0', a(2), a(1), a(0), '0',  '0' ); 
   elsif b(2)='0' then  aux3<=(others => '0'); end if;
end process;
c   <=aux1 + aux2 + aux3;
end archimulti;