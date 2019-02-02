entity coder is port(
dentro: in  bit_vector(3 downto 0);
fuera : out bit_vector(1 downto 0);
error : out bit
);
end coder;
architecture archicoder of coder is
begin
process (dentro)
begin
case dentro is
    when "0001" => fuera <= "00";
    when "0010" => fuera <= "01";
    when "0100" => fuera <= "10";
    when "1000" => fuera <= "11";
    when others => error <= '1'; 
  end case;
end process;
end archicoder;