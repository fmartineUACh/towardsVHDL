--tiempo de compilación 20 segundos
--utilización de la cápsula 1%
--utilización de macrocélulas 22%


library ieee;
use ieee.std_logic_1164.all;
use work.gatespkg.all;
entity multi is port(
a,b     : in  bit;
control : in  bit;
enable  : in  bit;
c       : out bit
);
end multi;

architecture archmul of multi is
signal aux0,aux1,aux2,aux3: bit;
begin
puerta0:inv  port map(control,aux0);
puerta1:and2 port map(b,aux0,aux1);
puerta2:and2 port map(a,control,aux2);
puerta3:or2  port map(aux1,aux2,aux3);
puerta4:and2 port map(enable,aux3,c);
end archmul;