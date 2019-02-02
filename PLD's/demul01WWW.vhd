-- tiempo de compilación 1 minuto 8 segundos
-- utilización de macrocélulas 22%

entity demulti is port(
entra: in bit_vector(7 downto 0);
control:in bit_vector(1 downto 0);
enable: in bit;
a,b,c,d:out bit_vector(7 downto 0)
);
end demulti;
architecture archdemul of demulti is
begin
process (entra, control, enable)
begin
if enable='1' then a<="11111111";
                   b<="11111111";
                   c<=(others=>'1');
                   d<=(others=>'1');
elsif enable='0' then
    case control is
        when "00" => a <= entra;
        when "01" => b <= entra;
        when "10" => c <= entra;
        when others => d <= entra;
    end case;
end if;
end process;
end archdemul;