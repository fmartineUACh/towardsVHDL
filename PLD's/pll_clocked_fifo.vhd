library ieee;
use ieee.std_logic_1164.all;
library cypress;
use cypress.lpmpkg.all;
use cypress.std_arith.all;
use cypress.rtlpkg.all;

entity pll_clocked_fifo is port ( 
	writeclk, byteclk:	in		std_logic; -- write clock and faster clock
	read, write:		in		std_logic; -- read and write enables
	byte: 				out		std_logic_vector ( 7 downto 0);	-- FIFO output byte 
	indata: 			in		std_logic_vector (31 downto 0); -- data to write
	empty_full:			buffer 	std_logic; -- Flag for empty / full
	offclk:				buffer 	std_logic; -- Offchip clock
	half:				out 	std_logic; -- Flag for half full
	fifo_reset:			in		std_logic; -- Reset for FIFO
	lock:				out 	std_logic  -- PLL lock detection output
 );
end pll_clocked_fifo;

architecture arch_pll_clocked_fifo of pll_clocked_fifo is

signal readclk:			std_logic;		-- read clock
signal int_byteclk: 		std_logic;		-- phase adjusted byteclk
signal t_empty_full: 	std_logic;		-- temporary empty_full flag
signal selection: 		std_logic_vector ( 1 downto 0);	-- byte selector
signal outdata:			std_logic_vector (31 downto 0);	-- FIFO output

begin

U1: cy_fifo	-- Clocked FIFO
	generic map(
		lpm_width             => 32,
		lpm_numwords          => 512,
		lpm_pafe_length       => 0,		-- optional
		lpm_hint              => speed	-- optional
	)
	port map(
		data        => indata,
		q           => outdata,
		enr         => read,
		enw         => write,
		readclock   => readclk,
		writeclock  => writeclk,
		mrb         => fifo_reset,
		efb         => t_empty_full,	-- optional
		hfb         => half
	);

U2: cy_c39kpll
    generic map(
		multiply       => 1,	-- optional
		gclk2_phase    => 0,	-- optional
		gclk2_divide   => 4,	-- optional
		gclk3_phase    => 0,	-- optional
		gclk3_divide   => 1 	-- optional
	)
    port map (
		pll_in 		   => byteclk,
		lock_detect    => lock,	      -- optional
		gclk2          => readclk,    -- optional
		gclk3          => int_byteclk -- optional
		);


mux:process (int_byteclk)
begin
	if (int_byteclk'event and int_byteclk = '1') then
		if (empty_full = '0') then	-- if FIFO is empty
			case selection is					-- and if selection equals
				when "00" 	=> byte 		-- 0, then byte is MSB
					<= outdata(31 downto 24);
				when "01" 	=> byte 		-- 1, then byte is 2nd byte
					<= outdata(23 downto 16);
				when "10" 	=> byte 		-- 2, then byte is 3rd byte
					<= outdata(15 downto  8);
				when others => byte 		-- other, then byte is LSB
					<= outdata( 7 downto  0);
			end case;
		selection <= selection + 1;	-- increment selection
		offclk	<= not(offclk);			-- Off-chip clock generated at int_byteclk
		end if;
	end if;
end process;

empty_full <= t_empty_full;			-- assign empty_full output

end arch_pll_clocked_fifo; 

