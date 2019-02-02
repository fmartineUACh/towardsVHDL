library ieee;
use ieee.std_logic_1164.all;
use work.lpmpkg.all;

entity single_port is port ( 
	a, b, c, d:	in 	std_logic; -- Single Port Address bus bits
	x, y, z: 	out	std_logic  -- Single Port Data bus bits
 );
end single_port;

architecture arch_single_port OF single_port IS

signal address : std_logic_vector(3 downto 0); 
signal result  : std_logic_vector(2 downto 0); 

begin

U1: mrom	-- Read-only Memory
	generic map(
		lpm_width              => 3,
		lpm_widthad            => 4,
		lpm_numwords           => 0,		-- optional
		lpm_address_control    => LPM_UNREGISTERED,	-- optional
		lpm_outdata            => LPM_UNREGISTERED,	-- optional
		lpm_file               => "single_port.rom",	-- optional
		lpm_hint               => speed		-- optional
	)
	port map(
		address         => address,
		q               => result,
		inclock         => '0',		-- optional
		outclock        => '0', 	-- optional
		memenab         => '1', 	-- optional
		outreg_ar       => '0'		-- optional
	);

address <= a & b & c & d;
x 		<= result(2);
y 		<= result(1);
z 		<= result(0);

end arch_single_port; 
