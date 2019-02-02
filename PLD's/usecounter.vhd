library ieee ;
use ieee.std_logic_1164.all ;

use work.counter_pkg.all;
entity counters is port(
        clk1, clk2: in std_logic;
        acnt, bcnt, ccnt: buffer nibble;
		  deqe: out std_logic);
end counters;

architecture archcounters of counters is
signal dcnt, ecnt: nibble;
begin
counter1: upcnt port map (clk1, acnt);
counter2: upcnt port map (clk2, bcnt);
counter3: upcnt port map (clk => clk1, count => ccnt);
counter4: upcnt port map (clk2, dcnt);
counter5: upcnt port map (count => ecnt, clk => clk2);

deqe <= '1' when (dcnt = ecnt) else '0';
end archcounters;