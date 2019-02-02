library ieee;
use ieee.std_logic_1164.all;
package gatespkg is
component and2 
port(a,b:in bit; q:out bit); 
end component;
component or2 
port(a,b:in bit; q:out bit); 
end component;
component inv 
port(a:in bit; qn:out bit); 
end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.gatespkg.all;
entity mux is
port (a,b, selec, salida: in bit);
end mux;

architecture estructura of mux is
signal	ax,bx,nosel: bit;
	begin
		u0:inv port map(e=>selec, y=>nosel);
		u1:and2 port map(e1=>a, e2=>nosel, y=>ax);
		u2:and2 port map(e1=>b, e2=>selec, y=>bx);
		u3:or2 port map(e1=>ax, e2=>bx, y=>salida);
	end estructura;
