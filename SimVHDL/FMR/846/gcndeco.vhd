library ieee;
use ieee.std_logic_1164.all;
package gatdeco is
component and2 port(e1,e2:in bit; y:out bit); end component;
component and3 port(e1,e2,e3:in bit; y:out bit); end component;
component or2 port(e1,e2:in bit; y:out bit); end component;
component or3 port(e1,e2,e3:in bit; y:out bit); end component;
component or4 port(e1,e2,e3,e4:in bit; y:out bit); end component;
component inv port(e:in bit; y:out bit); end component;
end package gatdeco;

--library ieee;
--use work.cypress.all;
entity and2 is port(e1,e2:in bit; y:out bit); end and2;
architecture aand2 of and2 is begin y<=(e1 and e2); end aand2;

--library ieee;
--use ieee.std_logic_1164.all;     -- ya que utilizamos std_logic
--use work.cypress.all;
entity and3 is port(e1,e2,e3:in bit; y:out bit); end and3;
architecture aand3 of and3 is begin y<=(e1 and e2 and e3); end aand3;

--use work.cypress.all;
entity or2 is port(e1,e2:in bit; y:out bit); end or2;
architecture aor2 of or2 is begin y<=(e1 or e2); end aor2;

--use work.cypress.all;
entity or3 is port(e1,e2,e3:in bit; y:out bit); end or3;
architecture aor3 of or3 is begin y<=(e1 or e2 or e3); end aor3;

--use work.cypress.all;
entity or4 is port(e1,e2,e3,e4:in bit; y:out bit); end or4;
architecture aor4 of or4 is begin y<=(e1 or e2 or e3 or e4); end aor4;

--use work.cypress.all;
entity inv is port(e:in bit; y:out bit); end inv;
architecture ainv of inv is begin y<=not(e); end ainv;
