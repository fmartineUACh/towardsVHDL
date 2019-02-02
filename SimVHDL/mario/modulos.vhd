library ieee;
use ieee.std_logic_1164.all;
package modu is
component gcm port(clk,reset:in std_logic; a,b,c,d,e:inout std_logic; q: inout std_logic_vector(3 downto 0)); end component;
component reg_dato port(b:inout std_logic; RD:inout std_logic_vector(3 downto 0); RT:inout std_logic_vector(3 downto 0));end component;
component pcount port(e: inout std_logic; di: inout std_logic_vector(0 to 7);pc: inout std_logic_vector(3 downto 0));end component;
component reg_ins port(a : inout std_logic;RO : inout std_logic_vector(3 downto 0);RI : inout std_logic_vector(3 downto 0));end component;
component deco_ins port (RI : inout std_logic_vector(3 downto 0);DI : inout std_logic_vector(0 to 7));end component;
component alu port(	DI: inout std_logic_vector(0 to 7);	RD: inout std_logic_vector(3 downto 0);   ACC: inout std_logic_vector(3 downto 0);OP: inout std_logic_vector(3 downto 0));end component;
component acc1 port(d: inout std_logic;act: inout std_logic_vector(3 downto 0);acc: inout std_logic_vector(3 downto 0));end component; 
component acct port(c: inout std_logic;op:  inout std_logic_vector(3 downto 0);act: inout std_logic_vector(3 downto 0));end component; 
end package modu;


library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity gcm is port(clk,reset:in std_logic; a,b,c,d,e:inout std_logic; q:inout std_logic_vector(3 downto 0)); end gcm;

library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity reg_dato is port(b:inout std_logic; RD:inout std_logic_vector(3 downto 0); RT:inout std_logic_vector(3 downto 0));end reg_dato;


library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity pcount is port(e: inout std_logic; di: inout std_logic_vector(0 to 7);pc: inout std_logic_vector(3 downto 0));end pcount;


library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity reg_ins is port(a : inout std_logic;RO : inout std_logic_vector(3 downto 0);RI : inout std_logic_vector(3 downto 0));end reg_ins;

library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity deco_ins is port (RI : inout std_logic_vector(3 downto 0);DI : inout std_logic_vector(0 to 7));end deco_ins;


library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity alu is port(	DI: inout std_logic_vector(0 to 7);	RD: inout std_logic_vector(3 downto 0);   ACC: inout std_logic_vector(3 downto 0);OP: inout std_logic_vector(3 downto 0));end alu;


library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity acc1 is port(d:   inout std_logic;act: inout std_logic_vector(3 downto 0);acc: inout std_logic_vector(3 downto 0));end acc1; 



library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity acct is port(c:   inout std_logic;op:  inout std_logic_vector(3 downto 0);act: inout std_logic_vector(3 downto 0));end acct; 



-- generador de ciclos de maquina
architecture a_gcm of gcm is 
begin
process (clk,reset)
begin
	if (clk'event and clk = '1') then
		q <= q + 1;
		if (reset = '1' or q ="0101") then 
  	        q <= "0000";
    	 end if;
	end if;
end process;
process (q)
begin
case q is 
	when "0000" => A <= '1'; E <= '0'; B <= '0'; C <= '0'; D <= '0';
	when "0001" => A <= '0'; E <= '1'; B <= '0'; C <= '0'; D <= '0';
	when "0010" => A <= '0'; E <= '0'; B <= '1'; C <= '0'; D <= '0';
	when "0011" => A <= '0'; E <= '1'; B <= '0'; C <= '0'; D <= '0';
	when "0100" => A <= '0'; E <= '0'; B <= '0'; C <= '1'; D <= '0';
	when others => A <= '0'; E <= '0'; B <= '0'; C <= '0'; D <= '1';
end case;
end process;
end a_gcm;



-- registro de dato
architecture a_dato of reg_dato is 
begin 
process (b,RD,RT)
begin
if (b'event and b='1') then 
	RD <= RT; 
end if;
end process;
end a_dato;


--contador de programa
architecture a_pc of pcount is 
begin 
process(e) 
begin 
if (e'event and e='1') then 
	pc <= pc + 1;
	if (di = "00000001") then 
	  pc <= "0000";
	end if;
end if;
end process;
end a_pc; 

-- registro de instruccion
architecture a_reg of reg_ins is 
begin 
process (a,RO,RI)
begin
if (a'event and a='1') then 
	RI <= RO; 
end if;
end process;
end a_reg;

-- decodificador de instruccion
architecture a_deco of deco_ins is 
begin 
process (RI) 
begin
case RI is 
when "0000" => DI <= "10000000";
when "0001" => DI <= "01000000";
when "0010" => DI <= "00100000";
when "0011" => DI <= "00010000";
when "0100" => DI <= "00001000";
when "0101" => DI <= "00000100";
when "0110" => DI <= "00000010";
when "0111" => DI <= "00000001";
when others => DI <= "00000000"; 
end case; 
end process; 
end a_deco;


-- alu
architecture a_alu of alu is 
begin 
process (DI,ACC,RD) 
	begin
	if (DI="10000000") then 
		OP <= ACC and RD; 
	elsif (DI="01000000") then 
		OP <= ACC or RD;
	elsif (DI="00100000") then 
    	OP <= ACC xor RD;
	elsif (DI="00010000") then 
		OP <= ACC + RD;
    elsif (DI="00001000") then 
		OP <= not ACC;
	elsif (DI="00000100") then
    	OP <= ACC;
	elsif (DI="00000001") then
		OP<="0000";
	else 
		OP <= RD;
	end if; 
end process;
end a_alu;

-- acom
architecture a_acc of acc1 is 
begin 
process (d) 
begin
	if (d'event and d='1') then 
		acc <= act;
	end if;
end process;
end a_acc;

-- acomulador
architecture a_acct of acct is 
begin 
process (c) 
begin
	if (c'event and c='1') then 
		act <= op;
	end if;
end process;
end a_acct;


