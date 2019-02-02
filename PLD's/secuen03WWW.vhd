library ieee; 
 use ieee.std_logic_1164.all; 
 use work.std_arith.all;

 entity cuad is port ( 
  clk,reset:in bit; 
  conta:buffer std_logic_vector(1 downto 0)); 
 end cuad;

 architecture  archicuad of cuad is 
  begin 
    contador :process (clk,reset) 
  begin 
   if (reset='1') then conta <= (others => '0') ; 
   elsif clk'event and clk='1' then conta <= conta + 1; 
   end if; 
  end process contador; 
  end archicuad;