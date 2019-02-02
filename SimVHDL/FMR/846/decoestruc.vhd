library work;
use work.gatdeco.all;

entity mux is
port (A,B,C,D: in bit;
	ax,bx,cx,dx,ex,fx,gx: out bit);
end mux;

architecture estructura of mux is
signal	NA,NB,NC,ND,a1,a2,a3,d1,d2,d3,d4,f1,f2,f3: bit;
	begin
	-- ***** definimos primero las negaciones de las entradas
	u0: inv port map(e=>A, y=>NA);		
	u1: inv port map(e=>B, y=>NB);
	u2: inv port map(e=>C, y=>NC);
	u3: inv port map(e=>D, y=>ND);
	-- lógica para el segmento ax
	ua1: and3 port map(e1=>NA, e2=>NB, e3=>ND, y=>a1);
	ua2: and2 port map(e1=>C, e2=>D, y=>a2);
	ua3: and2 port map(e1=>B, e2=>D, y=>a3);
	uax: or4 port map(e1=>a1, e2=>a2, e3=>a3, e4=>A, y=>ax); 
	-- lógica para el segmento bx
	ubx: or3 port map(e1=>a2, e2=>NB, e3=>f1, y=>bx); 
	-- lógica para el segmento cx
	ucx: or3 port map(e1=>B, e2=>NC, e3=>D, y=>cx); 
	-- lógica para el segmento dx
	ud1: and2 port map(e1=>NB, e2=>ND, y=>d1);
	ud2: and3 port map(e1=>B, e2=>NC, e3=>D, y=>d2);
	ud3: and2 port map(e1=>NB, e2=>C, y=>d3);
	ud4: and2 port map(e1=>C, e2=>ND, y=>d4);
	udx: or4 port map(e1=>d1, e2=>d2, e3=>d3, e4=>d4, y=>dx); 
	-- lógica para el segmento ex
	uex: or2 port map(e1=>d4, e2=>d1, y=>ex); 
	-- lógica para el segmento fx
	uf1: and2 port map(e1=>NC, e2=>ND, y=>f1);
	uf2: and2 port map(e1=>B, e2=>NC, y=>f2);
	uf3: and2 port map(e1=>B, e2=>ND, y=>f3);
	ufx: or4 port map(e1=>f1, e2=>f2, e3=>f3, e4=>A, y=>fx); 
	-- lógica para el segmento gx
	ugx: or4 port map(e1=>A, e2=>f2, e3=>f3, e4=>d3, y=>gx); 
	end estructura;
