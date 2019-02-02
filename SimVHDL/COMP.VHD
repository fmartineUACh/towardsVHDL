library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
use work.comp.all;
entity anmicro is port(
   clk,reset:in std_logic;
   direccion:out std_logic_vector (7 downto 0);
   vma: out std_logic;
   datout:inout std_logic_vector (3 downto 0);
   rw:inout std_logic;
   irq:in std_logic_vector (1 downto 0));
end anmicro;

architecture arq_anmicro of anmicro is 
   signal a:std_logic_vector (3 downto 0);
   signal b:std_logic_vector (3 downto 0);
   signal datoin:std_logic_vector (3 downto 0);
   signal operacion:std_logic_vector (3 downto 0);
   signal rc:std_logic_vector (3 downto 0);
   signal cs:std_logic_vector (4 downto 0);
   signal pcontrol:std_logic_vector (7 downto 0);
   signal pila:std_logic_vector (7 downto 0);
   signal pcout:std_logic_vector (7 downto 0);
   signal ix:std_logic_vector (7 downto 0);
   
   begin
      u1: alu4 port map( clk=>clk,cs=>cs,operacion=>operacion,rc=>rc,a=>a,b=>b);
	  u2: rega5 port map(cs=>cs,datoin=>datoin,reset=>reset,a=>a,clk=>clk);
	  u3: regb5 port map(cs=>cs,datoin=>datoin,reset=>reset,b=>b,clk=>clk);
	  u4: sel_dato port map(cs=>cs,datoin=>datoin,datout=>datout,operacion=>operacion,clk=>clk);
	  u5: tri_est port map(cs=>cs,operacion=>operacion,clk=>clk,datout=>datout);
	  u6: pc port map(clk=>clk,pcontrol=>pcontrol,reset=>reset,cs=>cs,pcout=>pcout,pila=>pila);
	  u7: indice port map(cs=>cs,clk=>clk,pcontrol=>pcontrol,reset=>reset,ix=>ix);
	  u8: stack port map(cs=>cs,clk=>clk,pcout=>pcout,reset=>reset,pila=>pila);
	  u9: sel_dir port map(clk=>clk,pcout=>pcout,ix=>ix,direccion=>direccion,cs=>cs);
	  u10: dir_val port map(vma=>vma,cs=>cs);
	  u11: control port map(clk=>clk,reset=>reset,irq=>irq,rw=>rw,datoin=>datoin,pcontrol=>pcontrol,rc=>rc,pcout=>pcout,cs=>cs);
end arq_anmicro;
