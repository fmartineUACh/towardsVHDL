--
--      Copyright Cypress Semiconductor Corporation, 1999
--      as an unpublished work.
--

--
--	MROM
--

library ieee;
use ieee.std_logic_1164.all;

library cypress;
use work.rtlpkg.all;
use cypress.lpmpkg.all;

library ieee;
use ieee.std_logic_1164.all;

entity mrom is
    generic(lpm_width	: positive  := 1;
	    lpm_widthad	: positive  := 1;
	    lpm_numwords: natural := 1;
	    lpm_address_control	: regis_type := LPM_REGISTERED;
	    lpm_outdata	: regis_type := LPM_REGISTERED;
	    lpm_file	: string := "";
	    lpm_hint	: goal_type := SPEED);
    port   (address	: in  std_logic_vector(lpm_widthad-1 downto 0);
	    q		: out std_logic_vector(lpm_width-1 downto 0);
	    inclock	: in  std_logic := zero;
	    outclock	: in  std_logic := zero;
	    memenab	: in  std_logic := one;
	    outreg_AR	: in  std_logic := zero);
end mrom;

architecture c39k of mrom is

    signal din		: std_logic_vector(lpm_width-1 downto 0);
    constant addr_ctrl	: boolean := registered(lpm_address_control);
    constant outdata	: boolean := registered(lpm_outdata);
    constant size	: integer := 2**lpm_widthad;
    constant longstrlen	: integer := 1000;

    function same_string (inp: string) return string is
	variable v : string(1 to longstrlen);
    begin
	if (inp'length > 0) then
	    v(1 to inp'length) := inp;
	end if;
	return v;
    end same_string;

    constant lpm_file_x	: string(1 to longstrlen) := same_string(lpm_file);

begin

    assert ((lpm_numwords = size) OR (lpm_numwords = 0))
	report "Lpm_widthad & lpm_numwords don't agree, lpm_widthad being used."
	severity note;

    assert(lpm_file'length /= 0)
	report "ROM file name has not been declared."
	severity warning;

    u1: cy_C39KSINGLEPORT
    generic map(datawidth	=> lpm_width,
		addresswidth	=> lpm_widthad,
		indata_reg	=> FALSE,
		addr_ctrl_reg	=> addr_ctrl,
		outdata_reg	=> outdata,
		FileName	=> lpm_file_x)
    port map (	din		=> din,
		addr		=> address,
		we		=> zero,
		inclk		=> inclock,     
		outclk		=> outclock,
		outreg_ar	=> outreg_ar,
		dout		=> q);

    -- Following is a workaround becuase warp is not exploding
    -- the (others => '0') into a vector..hdm Fri Nov  5 09:06:29 PST 1999
    u2: for i in din'range generate
	din(i) <= '0';
    end generate;

end c39k;