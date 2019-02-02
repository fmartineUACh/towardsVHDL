library ieee;
use ieee.std_logic_1164.all;

library cypress;
use cypress.std_arith.all;

use work.paquetesum.all;

entity sumador is port(
 a,b: in std_logic_vector(1 downto 0);
 cin:in std_logic;
 sw:in std_logic;
 sumaMSB: out std_logic_vector(2 downto 0));
 end sumador;

architecture MSBcom of sumador is
signal x,p,s,z,w,r,t,q:bit;
  begin
   vo: xor2 port map(e1=>a(0), e2=>b(0), y=>x);
   v1: and2 port map(e1=>a(0), e2=>b(0), y=>p);
   v2: xor2 port map(e1=>sw, e2=>a(1), y=>s);
   v3: xor3 port map(e1=>p, e2=>s, e3=>b, y=>z);
   v4: and2 port map(e1=>p, e2=>b, y=>w);
   v5: and2 port map(e1=>s, e2=>b, y=>r);
   v6: and2 port map(e1=>p, e2=>s, y=>t);
   v7: or3  port map(e1=>w, e2=>r, e3=>t, y=>q);
end MSBcom;

