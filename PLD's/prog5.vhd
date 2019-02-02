library ieee;
use ieee.std_logic_1164.all;
entity no_priority is port (
                            a, b, c, d, w, x, y, z: in std_logic;
							j: out std_logic);
end no_priority;

architecture no_prior of no_priority is
begin
     j<= (a and w)or (b and x) or(c and y) or (d and z);
end no_prior;
