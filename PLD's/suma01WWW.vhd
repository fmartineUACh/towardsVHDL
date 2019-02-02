library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity sumador is port(
a,b: in  std_logic_vector(3 downto 0);
cin: in  std_logic;
sum: out std_logic_vector(4 downto 0)
);
end sumador;

architecture archisumador of sumador is


begin
process (a,b,cin)
variable aux:std_logic_vector(4 downto 0);
begin
aux:=('0' & a) + ('0' & b);
if cin='1' then aux:=aux+1;
elsif cin='0' then null; end if;
sum<=aux;
end process;
end archisumador;