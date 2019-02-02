library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity counter is port(
        clk, rsta, rstb, rstc:  in std_logic;
        cnta, cntb, cntc:       buffer std_logic_vector(7 downto 0));
end counter;

architecture archcounter of counter is
begin

upcnta: process (clk, rsta)
        begin
                if rsta = '1' then                 --async reset #1
                        cnta <= (others => '0');
                elsif (clk'event and clk= '1') then
                        cnta <= cnta + 1;
                end if;
        end process upcnta;

upcntb: process (clk, rstb)
        begin
                if rstb = '1' then                 --async reset #2
                        cntb <= (others => '0');
                elsif (clk'event and clk= '1') then
                        cntb <= cntb + 1;
                end if;
        end process upcntb;

upcntc: process (clk, rstc)
        begin
                if rstc = '1' then                 --async reset #3
                        cntc <= (others => '0');
                elsif (clk'event and clk= '1') then
                        cntc <= cntc + 1;
                end if;
        end process upcntc;

end archcounter;
