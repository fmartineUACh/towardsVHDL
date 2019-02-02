library ieee;
use ieee.std_logic_1164.all;
package gatespkg is
component and2 port(e1,e2:in bit; y:out bit); end component;
component or2 port(e1,e2:in bit; y:out bit); end component;
component inv port(e:in bit; y:out bit); end component;
component xnor2 port(e1,e2:in std_logic; y:out std_logic); end component;
component and4 port(e1,e2,e3,e4:in std_logic; y:out std_logic); end component;
end package gatespkg;

library ieee;
use ieee.std_logic_1164.all;
use work.cypress.all;
entity xnor2 is port(e1,e2:in std_logic; y:out std_logic); end xnor2;
architecture xxnor2 of xnor2 is begin y<=(e1 xnor e2); end xxnor2;

library ieee;
use ieee.std_logic_1164.all;
entity and4 is port(e1,e2,e3,e4:in std_logic; y:out std_logic); end and4;
architecture aand4 of and4 is begin y<=(e1 and e2 and e3 and e4); end aand4;

use work.cypress.all;
entity and2 is port(e1,e2:in bit; y:out bit); end and2;
architecture aand2 of and2 is begin y<=(e1 and e2); end aand2;

use work.cypress.all;
entity or2 is port(e1,e2:in bit; y:out bit); end or2;
architecture aor2 of or2 is begin y<=(e1 or e2); end aor2;

use work.cypress.all;
entity inv is port(e:in bit; y:out bit); end inv;
architecture ainv of inv is begin y<=not(e); end ainv;
