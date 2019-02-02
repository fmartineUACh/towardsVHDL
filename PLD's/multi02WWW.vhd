--tiempo de compilación 14 segundos
--utilización de la cápsula 1%
--utilización de macrocélulas 22%

entity multi is port(
a,b     : in  bit;
control : in  bit;
enable  : in  bit;
c       : out bit
);
end multi;
architecture archmul of multi is
signal aux1,aux2,aux3: bit;
begin
aux1 <= b and(not(control));
aux2 <= a and control;
aux3 <= aux1 or aux2;
c    <= enable and aux3;
end archmul;