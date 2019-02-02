--flip-flop tipo d
library ieee;
use ieee.std_logic_1164.all;
entity flipflopd is port (
  d, clk: in std_logic;
  q: out std_logic
);
end flipflopd;

architecture archiflipflopd of flipflopd is
begin
process (clk)
begin
if (clk'event and clk='1') then q <= d;
end if;
end process;
end archiflipflopd;