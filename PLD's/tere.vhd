library ieee;
use ieee.std_logic_1164.all;
entity reg_logic is port (
   d               : in std_logic_vector(0 to 7);
   reset, init, clk: in std_logic;
   q               : out std_logic_vector(0 to 7));
end reg_logic;

architecture fancy_example of reg_logic is
begin
   process (clk, reset) begin
      if (reset = '1') then
 	     q <= b"00000000";
	  elsif (clk'event and clk = '1') then
	     if (init ='1') then
 		    q <= b"11111111";
		 else
		    q <= d;
		 end if;
	  end if;
   end process;
end fancy_example;
