library work;
use work.gatdeco.all;
entity mux21 is
port( a:in bit;
		b:in bit;
		s:in bit;
		z:out bit);
end mux21;

architecture muxde of mux21 is
signal as,bs,nosel:bit;
begin
u0:inv port map(e=>s, y=>nosel);
u1:and2 port map(e1=>a, e2=>nosel, y=>as);
u2:and2 port map(e1=>b, e2=>s, y=>bs);
u3:or2 port map(e1=>as, e2=>bs, y=>z);
end muxde;


