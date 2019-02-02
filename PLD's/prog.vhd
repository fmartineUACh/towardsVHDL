library ieee;
use ieee.std_logic_1164.all;
entity priority is port(
                        a, b, c, d, w, x, y, z: in std_logic;
                        j: out std_logic);
end priority;

architecture prior of priority is 
begin
     j<= w when a='1' else
         x when b='1' else  
	     y when c='1' else  
	     z when d='1' else
  	     '0';
end prior;
