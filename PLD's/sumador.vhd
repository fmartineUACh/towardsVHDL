library ieee;
entity sumador4 is port(
	a,b: in bit_vector(0 to 3);
    cin: in bit;
    suma: out bit_vector(0 to 3);
	cout: out bit); 
end sumador4;

architecture sumabit of sumador4 is
signal x0,y0,z0,c1,x1,y1,z1,c2,x2,y2,z2 : bit;
begin
--bit 0
x0<=a(0) XOR b(0);
y0<=a(0) AND b(0);
suma(0) <= x0 XOR cin;
z0<=x0 AND cin;
c1 <= z0 OR y0; 
--bit 1
x1<=a(1) XOR b(1);
y1<=a(1) AND b(1);
suma(1) <= x1 XOR c1;
z1<=x1 AND c1;
c2 <= z1 OR y1; 
--bit 2
x2<=a(2) XOR b(2);
y2<=a(2) AND b(2);
suma(2) <= x2 XOR c2;
z2<=x2 AND c2;
cout <= z2 OR y2; 
end sumabit;