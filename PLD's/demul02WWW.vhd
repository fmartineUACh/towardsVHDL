-- tiempo de compilación 1 minuto 8 segundos
-- utilización de macrocélulas 22%

entity demulti is port(
entra: in bit_vector(2 downto 0);
control:in bit_vector(1 downto 0);
enable: in bit;
a,b,c:out bit_vector(2 downto 0)
);
end demulti;
architecture archdemul of demulti is
begin
process (entra, control, enable)
begin
if enable='1' then a<="111";
                   b<="111";
                   c<=(others=>'1');
 elsif enable='0' then
 case control is
        when "00" => a <= entra;
                     b <= "000";
                     c <= "000";
   
        when "01" => a <= "000";
                     b <= entra;
                     c <= "000";
   
        when "10" => a <= "000";
                     b <= "000";
                     c <= entra;
   
        when others => a <= "000";
                       b <= "000";
                       c <= "000";
    end case;
end if;
end process;
end archdemul;