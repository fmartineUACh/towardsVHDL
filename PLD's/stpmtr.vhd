library ieee;
use ieee.std_logic_1164.all;

entity sec1 is
port(clk:in std_logic; giro:in bit; y:out std_logic_vector (3 downto 0));
end sec1;

	architecture arch1 of sec1 is
	signal state:std_logic_vector (3 downto 0);
	constant state0: std_logic_vector (3 downto 0):="1000";
	constant state1: std_logic_vector (3 downto 0):="0100";
	constant state2: std_logic_vector (3 downto 0):="0010";
	constant state3: std_logic_vector (3 downto 0):="0001";

		begin
		secuencia:process(clk)
			begin
			if(clk 'event and clk='1') then state <= state0;
				case state is
					when state0 => if giro='1' then state<=state1;
									else	state<=state3;
									end if;
					when state1 => if giro='1' then state<=state2;
									else	state<=state0;
									end if;
					when state2 => if giro='1' then state<=state3;
									else	state<=state1;
									end if;
					when state3 => if giro='1' then state<=state0;
									else	state<=state2;
									end if;
					when others => state <= state0;
			  end case;
		  end if;
	  end process secuencia;
	y <= state (3 downto 0);
	end arch1;

