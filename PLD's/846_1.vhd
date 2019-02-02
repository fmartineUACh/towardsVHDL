library ieee;
entity aand is
port( a:in bit;
		b:in bit;
		z:out bit);
end aand;

architecture annd of aand is
begin
	z<= a and b;
end annd;
