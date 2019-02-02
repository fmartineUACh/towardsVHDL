library ieee;
package paquetesum is
component inv  port (e: in bit; y:out bit);
end component;
component and2 port (e1,e2: in bit; y:out bit);
end component;
component or3  port (e1,e2,e3: in bit; y:out bit);
end component;
component xor2  port (e1,e2:in bit; y:out bit);
end component;
component xor3  port (e1,e2,e3:in bit; y:out bit);

end component;

end package paquetesum;

library work;
use work.cypress.all;
entity inv is
port (e:in bit ; y:out bit);
end inv;

architecture inversor of inv is
begin
	y<= not e;
end inversor;

library work;
use work.cypress.all;
entity and2 is
port (e1,e2:in bit ; y:out bit);
end and2;

architecture aand of and2 is
begin
	y<= e1 and e2;
end aand;


library work;
use work.cypress.all;
entity or3 is
port (e1,e2,e3:in bit ; y:out bit);
end or3;

architecture oor3 of or3 is
begin
	y<= ((e1 or e2) or e3);
end oor3;

library work;
use work.cypress.all;
entity xor2 is
port (e1,e2:in bit; y:out bit);
end xor2;
architecture xxor2 of xor2 is
begin 
   y<=(e1 xor e2);
end xxor2;


library work;
use work.cypress.all;

entity xor3 is
port (e1,e2,e3:in bit; y:out bit);
end xor3;

architecture xxor3 of xor3 is
begin 
   y<=((e1 xor e2) xor e3);
end xxor3;

