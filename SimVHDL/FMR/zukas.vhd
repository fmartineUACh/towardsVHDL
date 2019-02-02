package zukas is
component and2
port (e1,e2: in bit; y: out bit);
end component;

component or2
port (e1,e2: in bit; y: out bit);
end component;

component inv
port (e: in bit; y:out bit);
end component;
end package;

use work.cypress.all;
entity and2 is
port (e1,e2: in bit; y: out bit);
end and2;

architecture archand2 of and2 is
begin
y<= (e1 and e2);
end archand2;

use work.cypress.all;
entity or2 is
port (e1,e2: in bit; y: out bit);
end or2;

architecture archor2 of or2 is
begin
y<= (e1 or e2);
end archor2;

use work.cypress.all;
entity inv is
port (e: in bit; y: out bit);
end inv;

architecture archinv of inv is
begin
y<= not (e);
end archinv;


