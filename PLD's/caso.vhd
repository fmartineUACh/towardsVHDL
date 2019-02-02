library ieee;
use ieee.std_logic_1164.all;
entity test_case is
   port (address : in std_logic_vector(2 downto 0);
         decode : out std_logic_vector(7 downto 0));
end test_case;

architecture design of test_case is
begin
process (address)
   begin
      case address is
    	  when "001" => decode <=X"11";
          when "111" => decode <=X"42";
          when "010" => decode <=X"44";
          when "101" => decode <=X"88";
          when others => decode <=X"00";
      end case;
   end process;
end design;