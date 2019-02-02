library ieee;
use work.modu.all; 
use ieee.std_logic_1164.all;
entity micro is port( 
	clk, reset : in std_logic;
    RO :  inout std_logic_vector (3 downto 0); 
	RT :  inout std_logic_vector (3 downto 0);
    acc : inout std_logic_vector (3 downto 0));
end micro;


architecture a_micro of micro is 
signal  a,b,c,d,e : std_logic;
signal  q,RD,RI,pc,op, act : std_logic_vector(3 downto 0); 
signal di : std_logic_vector (7 downto 0); 
begin 
 u1: gcm port map(clk=>clk,  reset => reset, a=>a, b=>b,  c=>c, d=>d, e=>e, q => q);
 u2: reg_ins port map(a =>a, RO=>RO, RI=>RI);  	
 u3: reg_dato port map (b =>b, RD => RD,  RT=> RT);
 u4: pcount port map(e => e, di => di,  pc => pc);
 u5: deco_ins port map(RI => RI, DI => di);
 u6: alu port map (	DI => di, RD => RD, ACC => ACC, OP => OP);
 u7: acc1 port map (d => d, act => act,  acc => acc); 
u8 : acct port map (c => c, op => op, act => act); 
end a_micro; 

