
entity mux21 is
port( a:in bit;
		b:in bit;
		s:in bit;
		z:out bit);
end mux21;

architecture muxdd of mux21 is
begin
u0: z<= ((a and (not s)) or (b and s));
end muxdd;


