library ieee;
use ieee.std_logic_1164.all;
use work.lpmpkg.all;
entity resta is port (
a,b:     in  std_logic_vector(3 downto 0);
cin,sr:  in  std_logic;
c:       out std_logic_vector(3 downto 0);
cout,ov: out std_logic
);
end resta;

architecture archiresta of resta is
begin
restador: Madd_sub
	generic map(4,lpm_unsigned,lpm_no_typ,speed)
	port map(a,b,cin,sr,c,cout,ov);
end archiresta;