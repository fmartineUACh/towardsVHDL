
package gatespkg is
component and2
port( a,b: in bit;
           q: out bit);
end component;

component and3
port( a,b,c: in bit;
	   q: out bit);
end component;

component and4
port (a,b,c,d: in bit;
              sal: out bit);
end component;

component or2
port(a,b: in bit;
          q: out bit);
end component;

component or3
port(a,b,c: in bit;
	  q: out bit);
end component;

component xor2
port( a,b: in bit;
           q: out bit);
end component;

component inv
port(a: in bit;
     qn:out bit);
end component;

component Sum2
port(a,b,c: in bit;
         F,G: out bit);
end component;

End package gatespkg;

-------------------------------------------------------------
-----------AND2
use work.cypress.all;
entity and2 is
port(a,b: in bit;
	   q: out bit);
end and2;

architecture archand2 of and2 is
begin
	q<=(a and b);
end archand2;

----------------AND3

use work.cypress.all;
entity and3 is
port(a,b,c: in bit;
	   q: out bit);
end and3;

architecture archand3 of and3 is
begin
	q<=(a and b and c);
end archand3;

----------------AND4

use work.cypress.all;
entity and4 is
port(a,b,c,d: in bit;
	   q: out bit);
end and4;

architecture archand4 of and4 is
begin
	q<=(a and b and c and d);
end archand4;










----------------OR2

use work.cypress.all;
entity or2 is
port(a,b: in bit;
	   q: out bit);
end or2;

architecture archor2 of or2 is
begin
	q<=(a or b);
end archor2;

----------------OR3

use work.cypress.all;
entity or3 is
port(a,b,c: in bit;
	   q: out bit);
end or3;

architecture archor3 of or3 is
begin
	q<=(a or b or c);
end archor3;

-----------XOR2
use work.cypress.all;
entity xor2 is
port(a,b: in bit;
	   q: out bit);
end xor2;

architecture archxor2 of xor2 is
begin
	q<=(a xor b);
end archxor2;

---------------INV

use work.cypress.all;
entity inv is
port(a: in bit;
	 qn: out bit);
end inv;

architecture archinv of inv is
begin
	qn<=not(a);
end archinv;





--------------Sumador Completo

use work.cypress.all;
entity Sum2 is
port(a,b,c: in bit;
	   f,g: out bit);
end sum2;

architecture archsum2 of sum2 is
signal bx1, bx2, bx3: bit;
begin
	bx1<=(a xor b);
	bx2<=(a and b);
	f  <=(bx1 xor c);
	bx3<=(bx1 and c);
	g  <=(bx2 or bx3);
end archsum2;

