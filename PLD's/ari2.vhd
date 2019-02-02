library ieee;
use ieee.std_logic_1164.all;
use numeric_std.all;
entity add_vec is port(
       a, b, c:     in unsigned (3 downto 0);
       sum1, sum2:  out unsigned (3 downto 0));
end add_vec;

architecture adder of add_vec is
begin
    sum1 <= a + b;
    sum2 <= c + 1;
end adder;
