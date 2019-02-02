library ieee;
use ieee.std_logic_1164.all;
entity flipfloRS is port (
  r,s, clk: in std_logic;
  q: buffer std_logic;
  notq: out std_logic
);
end flipfloRS;

architecture archiflipfloRS of flipfloRS is
begin
process (clk)
begin
if (clk'event and clk='1') then 
	if (r='1')and(s='0') then q <= '0';
	elsif (r='0')and(s='1')then q <='1'; 
end if;
end if;
end process;
notq <= not q;
end archiflipfloRS;