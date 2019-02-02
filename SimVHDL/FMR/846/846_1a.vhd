
entity mux21 is
port( a:in bit;
		b:in bit;
		s,ss:in bit;
		z,y,w:out bit);
end mux21;

architecture muxb of mux21 is
begin
	process(a,b,s)
	begin
		if s='0', ss='1' then z<= A; w<= A; y<= B;
		else 			z<=B;
		end if;
	 end process;
end muxb;


