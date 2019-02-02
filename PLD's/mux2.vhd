library ieee;
use ieee.std_logic_1164.all;
use work.zukas.all;
entity MUX is
   port( a,b,c,d: IN bit; x,y: IN bit; z: OUT bit);
end MUX;

architecture mux2 of MUX is
signal nx,anx,ny,anxny,bnx,bnxy,cx,cxny,dx,dxy,ocho,nueve: bit;
begin
aux1: inv port map(e=>x, y=>nx);
aux2: inv port map (e=>y, y=>ny);
U0: and2 port map (e1=>a, e2=>nx, y=>anx);
U1: and2 port map (e1=>anx, e2=>ny, y=>anxny);
U2: and2 port map (e1=>b, e2=>nx, y=>bnx);
U3: and2 port map (e1=>bnx, e2=>y, y=>bnxy);
U4: and2 port map (e1=>c, e2=>x, y=>cx);
U5: and2 port map (e1=>cx, e2=>ny, y=>cxny);
U6: and2 port map (e1=>d, e2=>x, y=>dx);
U7: and2 port map (e1=>dx, e2=>y, y=>dxy);
U8: or2 port map (e1=>anxny, e2=>bnxy, y=>ocho);
U9: or2 port map (e1=>cxny, e2=>dxy, y=>nueve);
U10: or2 port map (e1=>ocho, e2=>nueve, y=>z);
end mux2;
