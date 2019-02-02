-- tiempo de compilación 17 segundos
-- utilización de macrocélulas 86%
-- utilización de terminos de productos logicos de salida 9%

entity multiplexor is port(
a, b, c	: in  bit_vector(3 downto 0);
enable  : in  bit;
control : in  bit_vector(1 downto 0);
d	: out bit_vector(3 downto 0)
);
end multiplexor;

architecture archimultiplexor of multiplexor is
begin
process( a , b , c , control , enable )
begin
 if enable='1' then d<="1111";
  elsif enable='0' then
	case control is
		when "00"   => d <= a;
		when "01"   => d <= b;
		when "10"   => d <= c;
		when others => d <= "1111";
	end case;
 end if;
end process;
end archimultiplexor;