
entity mux21 is
port( a:in bit;
		b:in bit;
		s:in bit;
		z:out bit);
end mux21;

architecture muxd of mux21 is
begin
z<= a when (s='0') else
	b;
end muxd;



