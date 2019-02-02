library ieee;
use ieee.std_logic_1164.all ;
use work.std_arith.all ;

entity counter is port(
	clk,reset:					in std_logic;
	s:						in std_logic_vector(7 downto 0);
	c,k,j:						buffer std_logic; 	
	led:				out std_logic_vector(2 downto 0);
	count1, count2,a,b:				buffer std_logic_vector(7 downto 0));
end counter;
architecture archcounter of counter is
begin
upcount: process (clk,s,count1,count2,reset)
	begin

		if (clk'event and clk= '1') then
			if reset = '1' then
				count1 <= "00000000";
				count2 <= "00000000";
				a <= count1;
				b <= count2;
				led <= "000";
				c <= '0'; 
				k <= '0'; --variable del 15
				j <= '0'; -- variable del 10

			else   
				
			case s is
				
				WHEN "00000001"=> 
					count1 <= "00000000";
					led <="001";
				WHEN "00000011"=>
					count1 <= "00000000";
					led <="011";			
				WHEN "00000111"=>
					count1 <= "00000000";
					led <="111";
				when "00110111" =>
					count1 <= count1 +1;
					led <= "100";
					if j = '0' then
					a <= count1;
					b <= "00000000";						
					if count1 = "00001010"    then							
						a <= "00000000";
						b <= "00000001";
						c <= '1';
						elsif a = "00000000" and b = "00000001" then
							a <= "00000000";
							b <= "00000000";
							j <= '1';
						end if;	
						end if;						
				when "00010111" =>
					count1 <= count1 + 1;	
					a <= count1;
					led <= "110";
					if count1 > "00000101"  then 		
						a <= "00000000";					
						end if;			
				when "00100011" =>
					count1 <= count1 +1;
					led <= "001";
					if j = '0' then
					a <= count1;
					b <= "00000000";						
					if count1 = "00001010"    then							
						a <= "00000000";
						b <= "00000001";
						c <= '1';
						elsif a = "00000000" and b = "00000001" then
							a <= "00000000";
							b <= "00000000";
							j <= '1';
						end if;	
						end if;	
					
				WHEN "00010001"=>               --contador 5
					count1 <= count1 + 1;	
					a <= count1;				
					if count1 > "00000101"  then 		
						a <= "00000000";					
						end if;
				WHEN "00010011"=>
					count1 <= count1 + 1;	
					a <= count1;
					led <= "010";
					if count1 >= "00000101"  then 		
						a <= "00000101";					
						end if;
				
				WHEN "00110011"=> 
					count1 <= count1 +1;
					if j = '0' then
					a <= count1;
					b <= "00000000";						
					if count1 = "00001010"    then							
						a <= "00000000";
						b <= "00000001";
						c <= '1';
						elsif a = "00000000" and b = "00000001" then
							a <= "00000000";
							b <= "00000000";
							j <= '1';
						end if;	
						end if;			
				when "01110111" =>
					count1 <= count1 +1;
					if k = '0' then
					a <= count1;
					b <= count2;					
					if count1 >= "00001001" and c ='0' then
						count1 <= "00000000";
						count2 <= count2 + 1;
						a <= count1;
						b <= count2;
						c <= '1';
						elsif a = "00000101" and count2 = "00000001"  then
						   a <= "00000000";
						   b <= "00000000";	
					   	   k <= '1';
						  end if;
					end if;
			
				when others =>  
					count1 <= "00000000";
					a <= "00000000";
					b <= "00000000";
					c <='0';
					led <= "000";
			end case;			
			end if;
		end if;
end process upcount;
end archcounter;