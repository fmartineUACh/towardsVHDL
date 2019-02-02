use work.bit_arith.all;
entity counter is port (
	clk: 	in bit;
	paro:  in bit;
	reset: in bit;
	display1,display2 :out bit_vector(6 downto 0)
);
end counter;
architecture counter of counter is
    signal count: bit_vector(3 downto 0);
    signal count1: bit_vector(3 downto 0);
    signal count2: bit_vector(3 downto 0);
	signal x: bit :='0';
begin

p2:process(count1,count2)
begin 
if count1="0000" then
  display1<="1000000";
end if;
if count1="0001" then
  display1<="1110011";
end if;
if count1="0010" then
  display1<="0100100";
end if;
if count1="0011" then
  display1<="0100001";
end if;
if count1="0100" then
  display1<="0010011";
end if;
if count1="0101" then
  display1<="0001001";
end if;
if count1="0110" then
  display1<="0011000";
end if;
if count1="0111" then
  display1<="1100011";
end if;
if count1="1000" then
  display1<="0000000";
end if;
if count1="1001" then
  display1<="0000011";
end if;


if count2="0000" then
  display2<="1000000";
end if;
if count2="0001" then
  display2<="1110011";
end if;
if count2="0010" then
  display2<="0100100";
end if;
if count2="0011" then
  display2<="0100001";
end if;
if count2="0100" then
  display2<="0010011";
end if;
if count2="0101" then
  display2<="0001001";
end if;
if count2="0110" then
  display2<="0011000";
end if;
if count2="0111" then
  display2<="1100011";
end if;
if count2="1000" then
  display2<="0000000";
end if;
if count2="1001" then
  display2<="0000011";
end if;

end process p2;

p1: process (clk,paro,reset)
	begin
	  if reset='1' then
	      count<="0000";
	      count1<="0000";
	      count2<="0000";
	  elsif clk'event and clk = '1' then
		if paro='0' then
           if x='0' then
	           count<=count+1;
		      if count2 ="1001" and count1="1001" then
                  x<='1';	
		      elsif count="0110"  then		          
		         count<="0000";
		         count1<=count1+1;		 
		      elsif count1="1010"  then		          
		         count1<="0000";
		         count2<=count2+1;		 
 		      end if;        
            
		   else   --------------------decrementa----------------------
			 
              count<=count+1;
		      if count2 ="0000" and count1="0000" then
                  x<='0';	
		      elsif count="0110"  then		          
		         count<="0000";
		         count1<=count1-1;		 
		      elsif count1="1111"  then		          
		         count1<="1001";
		         count2<=count2-1;		 
 		      end if;        
	       end if;
		end if; 
      end if;
end process p1;

end counter;