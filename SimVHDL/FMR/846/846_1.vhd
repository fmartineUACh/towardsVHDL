library ieee;
entity mux21 is
port( a:in bit;
		b:in bit;
		s:in bit;
		z:out bit);
end mux21;

architecture muxb of mux21 is
begin
	process(a,b,s)
	begin
		if s='0' then z<= A;
		else 			z<=B;
		end if;
	 end process;
end muxb;


