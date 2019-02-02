library ieee;
use ieee.std_logic_1164.all;
use work.lpmpkg.all;

entity dual_port is port ( 
	porta: 	inout	std_logic_vector (15 downto 0);	-- Port A data bus
	portb:	inout	std_logic_vector (15 downto 0);	-- Port B data bus
	adda: 	in		std_logic_vector ( 7 downto 0); -- Port A address bus
	addb: 	in		std_logic_vector ( 7 downto 0); -- Port B address bus
	wena: 	in		std_logic; -- Port A write enable
	wenb: 	in		std_logic; -- Port B write enable
	clka: 	in 		std_logic; -- Port A clock
	clkb: 	in 		std_logic; -- Port B clock
	inva: 	out		std_logic; -- Port A invalid flag (used for arbitration)
	invb: 	out		std_logic  -- Port B invalid flag (used for arbitration)
 );
end dual_port;

architecture arch_dual_port of dual_port is

signal a_out:	std_logic_vector (15 downto 0); -- internal data bus
signal b_out:	std_logic_vector (15 downto 0); -- internal data bus
signal match:	std_logic;

begin

U1: cy_ram_dp	-- Dual-port RAM
	generic map(
		lpm_width              => 16,
		lpm_widthad            => 8,
		lpm_numwords           => 0,	-- optional
		lpm_indata             => LPM_REGISTERED,	-- optional
		lpm_address_control    => LPM_REGISTERED,	-- optional
		lpm_outdata_a          => LPM_REGISTERED,	-- optional
		lpm_outdata_b          => LPM_REGISTERED,	-- optional
		lpm_file               => "",	-- optional
		lpm_hint               => speed	-- optional
	)
	port map(
		data_a            => porta,
		data_b            => portb,
		address_a         => adda,
		address_b         => addb,
		q_a               => a_out,
		q_b               => b_out,
		addr_matchb       => match,
		wea               => wena,
		web               => wenb,
		inclock_a         => clka,	-- optional
		inclock_b         => clkb,	-- optional
		outclock_a        => clka,	-- optional
		outclock_b        => clkb,	-- optional
		outrega_ar        => '0',	-- optional
		outregb_ar        => '0'	-- optional
	);

inva <= '1'						-- Port A becomes invalid
	when ((match = '1')			-- when both port addresses match
			and (wena = '0')	-- if Port A is write disabled
			and (wenb = '1'))	-- and if Port B is write enabled
	else '0';					-- else Port A remains valid

invb <= '1'						-- Port B becomes invalid
	when ((match = '1')			-- when both port addresses match
			and (wena = '1'))	-- if Port A is write enabled
	else '0';					-- else Port B becomes valid
										
porta <= a_out when wena = '1' else (others => 'Z');
portb <= b_out when wenb = '1' else (others => 'Z');

end arch_dual_port; 

