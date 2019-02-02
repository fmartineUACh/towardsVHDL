library ieee;
use ieee.std_logic_1164.all;
use work.numeric_std.all;
entity cnt8 is port(
        txclk:      in std_logic;
        enable, load:           in std_logic;
        data:                   in unsigned(3 downto 0);
        cnt:                    buffer unsigned(3 downto 0));
end cnt8;

architecture archcnt8 of cnt8 is
begin
count: process (txclk)
  begin
       
        if (txclk'event and txclk='1') then
                if load = '1' then
                        cnt <= data;
                elsif enable = '1' then
                        cnt <= cnt + 1;
                end if;
        end if;
  end process count;
end archcnt8;
