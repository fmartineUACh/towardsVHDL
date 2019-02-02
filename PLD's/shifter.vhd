library ieee;
use ieee.std_logic_1164.all;
entity shifter is
   port (shftin : in bit_vector(0 to 3);
		shftout : out bit_vector(0 to 3);
		 shftctl : in bit_vector(0 to 1));
end shifter;

architecture f1 of shifter is
begin
	shftout <= shftin    	  			when shftctl="00"		else
				shftin(1 to 3)&'0'    	  when shftctl="01"	else
				'0' & shftin(0 to 2)   	  when shftctl="01"	else
				shftin(3) & shftin(0 to 2);
end f1;

architecture f2 of shifter is
begin
	with shftctl select
				shftout<= shftin  when   "00" ,
				shftin(1 to 3)&'0'    	  when  "01",
				'0' & shftin(0 to 2)   	  when  "10",
				shftin(3) & shftin(0 to 2)when "11";
end f2;
