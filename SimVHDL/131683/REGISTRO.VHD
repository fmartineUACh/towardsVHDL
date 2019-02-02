library ieee;
use ieee.std_logic_1164.all;

entity proyecto is port(
    clk, rst,aux, signo, comple: in std_logic;
    sel:    in std_logic_vector(2 downto 0);
    ent:    in std_logic_vector(3 downto 0);		
    sal:    out std_logic_vector(4 downto 0));
end proyecto;

architecture corrimiento of proyecto is
  signal salida: std_logic_vector(4 downto 0);		
begin
 sal<=salida; 
 process (rst, clk)
  begin
      
       if rst = '1' then
        salida <= "00000";
    elsif (clk'event and clk='1') then
        case sel is
          when "001"=> salida(4)<=signo;
 		               if comple='0' then
		               salida(3)<=aux;
					   else salida(3)<=signo;
					   end if;
					   salida(2)<=ent(3);
					   salida(1)<=ent(2);
					   salida(0)<=ent(1);
		  when "010"=> salida(4)<=signo;
 		               salida(3)<=aux;
					   salida(2)<=aux;
					   salida(1)<=ent(3);
					   salida(0)<=ent(2);
          when "011"=> salida(4)<=signo;
 		               
		               salida(3)<=ent(2);
					   salida(2)<=ent(1);
					   salida(1)<=ent(0);
					   if comple='0' then
					   salida(0)<=aux; 
					   else salida(0)<=signo;
		               end if;
		  when "100"=> salida(4)<=signo;
 		               salida(3)<=ent(1);
					   salida(2)<=ent(0);
					   salida(1)<=aux;
					   salida(0)<=aux;
		  when "000"=> salida(4)<=signo;
 		               salida(3)<=ent(3);
					   salida(2)<=ent(2);
					   salida(1)<=ent(1);
					   salida(0)<=ent(0);
		  when "101"=> salida(4)<=not(signo);
 		               salida(3)<=not ent(3);
					   salida(2)<=not ent(2);
					   salida(1)<=not ent(1);
					   salida(0)<=not ent(0);
		  when others=> null;
	  end case;
	end if;
  end process;
end corrimiento;

        
