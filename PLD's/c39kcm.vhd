--------------------------------------------------------------------------------
--
--	      Copyright Cypress Semiconductor		1999
--	      Protected as an unpublished work.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c39kp.all;

entity c39kcm is
    generic (
	cfgbits	: Bit_Vector(45 downto 0);
	memdata	: chmem;
	-- Async parameters
	xcmReadAddrWthHi	: time;		-- checked parameters
	xcmWritAddrWthHi	: time;
	xcmWriEnaWthHi		: time;
	xcmAddrAtWriEnaFallSetup: time;
	xcmAddrAtWriEnaRiseSetup: time;
	xcmAddrAtWriEnaFallHold	: time;
	xcmDinAtWriEnaFallSetup	: time;
	xcmDinAtWriEnaFallHold	: time;
	xcmAddr2DoutRegD	: time;		-- applied parameters
	xcmWriEna2DoutRegD	: time;
	xcmDin2DoutRegD		: time;
	xcmDoutRegD2Dout	: time;
	-- Sync parameters
	xcmClkInWthCy		: time;		-- checked parameters
	xcmClkInWthHi		: time;
	xcmClkInWthLo		: time;
	xcmAddrAtClkInSetup	: time;
	xcmAddrAtClkInHold	: time;
	xcmWriEnaAtClkInSetup	: time;
	xcmWriEnaAtClkInHold	: time;
	xcmDinAtClkInSetup	: time;
	xcmDinAtClkInHold	: time;
	xcmClkIn2DoutRegD	: time;		-- applied parameters
	-- Output Register parameters
	xcmDoutRegCkWthCy	: time;		-- checked parameters
	xcmDoutRegCkWthHi	: time;
	xcmDoutRegCkWthLo	: time;
	xcmDoutRegSetup		: time;
	xcmDoutRegHold		: time;
	xcmDoutRegReWthHi	: time;
	xcmDoutRegReRcr		: time;
	xcmReset2Dout		: time;		-- applied parameters
	xcmClkOut2Dout		: time;
	xcmAddrTransDetect	: time);
    port (
	din_a		: in	std_logic_vector( 7 downto 0);
	din_b		: in	std_logic_vector( 7 downto 0);
	addr_a		: in	std_logic_vector(11 downto 0);
	addr_b		: in	std_logic_vector(11 downto 0);
	we_a		: in	std_logic;
	we_b		: in	std_logic;
	iclk_a		: in	std_logic := '0';
	iclk_b		: in	std_logic := '0';
	oclk_a		: in	std_logic := '0';
	oclk_b		: in	std_logic := '0';
	reset_a		: in	std_logic := '0';
	reset_b		: in	std_logic := '0';
	addr_matchb	: out	std_logic;
	dout_a		: out	std_logic_vector( 7 downto 0);
	dout_b		: out	std_logic_vector( 7 downto 0));
end c39kcm;

architecture sim of c39kcm is

    signal atmp_a,atmp_b	: std_logic_vector(11 downto 0);
    signal dtin_a,dtin_b	: std_logic_vector( 7 downto 0);
    signal dtout_a,dtout_b	: std_logic_vector( 7 downto 0);
    signal cdout_a,cdout_b	: std_logic_vector( 7 downto 0);
    signal wtmp_a,wtmp_b	: std_logic;
    signal atd_a, atd_b		: std_logic;

    -- Signals for use with negative setup and hold checks
    signal dsaddr_a	:std_logic_vector(11 downto 0);
    signal daiclk_a	:std_logic;
    signal dswe_a	:std_logic;
    signal dwiclk_a	:std_logic;
    signal dsdin_a	:std_logic_vector( 7 downto 0);
    signal ddiclk_a	:std_logic;
    signal dcdout_a	:std_logic_vector( 7 downto 0);
    signal doclk_a	:std_logic;
    signal dadin_a	:std_logic_vector( 7 downto 0);
    signal ddwe_a	:std_logic;
    signal daaddr_a	:std_logic_vector(11 downto 0);
    signal dawer_a	:std_logic;
    signal dawef_a	:std_logic;

    signal dsaddr_b	:std_logic_vector(11 downto 0);
    signal daiclk_b	:std_logic;
    signal dswe_b	:std_logic;
    signal dwiclk_b	:std_logic;
    signal dsdin_b	:std_logic_vector( 7 downto 0);
    signal ddiclk_b	:std_logic;
    signal dcdout_b	:std_logic_vector( 7 downto 0);
    signal doclk_b	:std_logic;
    signal dadin_b	:std_logic_vector( 7 downto 0);
    signal ddwe_b	:std_logic;
    signal daaddr_b	:std_logic_vector(11 downto 0);
    signal dawer_b	:std_logic;
    signal dawef_b	:std_logic;

    -- Constants for use with negative setup and hold checks
    constant syncAddrSetup	: time := timeAdjust(xcmAddrAtClkInSetup);
    constant syncAddrHold	: time := timeAdjust(xcmAddrAtClkInHold);
    constant syncWESetup	: time := timeAdjust(xcmWriEnaAtClkInSetup);
    constant syncWEHold		: time := timeAdjust(xcmWriEnaAtClkInHold);
    constant syncDataSetup	: time := timeAdjust(xcmDinAtClkInSetup);
    constant syncDataHold	: time := timeAdjust(xcmDinAtClkInHold);
    constant dataOutSetup	: time := timeAdjust(xcmDoutRegSetup);
    constant dataOutHold	: time := timeAdjust(xcmDoutRegHold);
    constant asyncAddrSetupF	: time := timeAdjust(xcmAddrAtWriEnaFallSetup);
    constant asyncAddrSetupR	: time := timeAdjust(xcmAddrAtWriEnaRiseSetup);
    constant asyncAddrHold	: time := timeAdjust(xcmAddrAtWriEnaFallHold);
    constant asyncDataSetup	: time := timeAdjust(xcmDinAtWriEnaFallSetup);
    constant asyncDataHold	: time := timeAdjust(xcmDinAtWriEnaFallHold);

    constant unk	: string := " Setting output unknown.";

    -- Port A check signals and errors
    signal iclkerr_a	: std_logic;
    constant iclk_width_a	: string :=
    "Input clock A cycle width violation:"	& unk;
    constant iclk_low_a		: string :=
    "Input clock A low width violation:"	& unk;
    constant iclk_high_a	: string :=
    "Input clock A high width violation:"	& unk;

    signal aserr_a	: std_logic;
    constant addr2iclk_setup_a	: string :=
    "Address A to input clock setup violation:"	& unk;

    signal aherr_a	: std_logic;
    constant addr2iclk_hold_a	: string :=
    "Input clock to address A hold violation:"	& unk;

    signal wserr_a	: std_logic;
    constant write2iclk_setup_a	: string :=
    "Write A to clock setup violation:"		& unk;

    signal wherr_a	: std_logic;
    constant write2iclk_hold_a	: string :=
    "Clock to write A hold violation:"		& unk;

    signal dserr_a	: std_logic;
    constant data2iclk_setup_a	: string :=
    "Data A to clock setup violation:"		& unk;

    signal dherr_a	: std_logic;
    constant data2iclk_hold_a	: string :=
    "Clock to data A hold violation:"		& unk;

    signal wrwerr_a	: std_logic;
    constant write_width_a	: string :=
    "Minimum write width A violation:"		& unk;

    signal wcycerr_a	: std_logic;
    constant writeaddr_cycle_a	: string :=
    "Minimum write cycle A violation:"		& unk;

    signal rcycerr_a	: std_logic;
    constant readaddr_cycle_a	: string :=
    "Minimum read cycle A violation:"		& unk;

    signal awserr_a	: std_logic;
    constant addr2westart_setup_a: string :=
    "Address to we A start setup violation:"	& unk;
    constant addr2weend_setup_a: string :=
    "Address to we A end setup violation:"	& unk;

    signal awherr_a	: std_logic;
    constant addr2we_hold_a	: string :=
    "We to address A hold violation:"		& unk;

    signal dwserr_a	: std_logic;
    constant data2we_setup_a	: string :=
    "Data A to we setup violation:"		& unk;

    signal dwherr_a	: std_logic;
    constant data2we_hold_a	: string :=
    "We to data A hold violation:"		& unk;

    signal oclkerr_a	: std_logic;
    constant outputclock_width_a: string :=
    "Output clock A cycle width violation:"	& unk;
    constant outputclock_low_a	: string :=
    "Output clock A low width violation:"	& unk;
    constant outputclock_high_a	: string :=
    "Output clock A high width violation:"	& unk;

    signal rcverr_a	: std_logic;
    constant outreg_rcvry_a	: string :=
    "Output reg. A reset recovery violation:"	& unk;

    signal rsterr_a	: std_logic;
    constant reset_width_a	: string :=
    "Reset A width violation:"			& unk;

    signal oserr_a	: std_logic;
    constant data2oclk_setup_a	: string :=
    "Data to output clock setup violation:"	& unk;
    constant addr2oclk_setup_a	: string :=
    "Address to output clock setup violation:"	& unk;
    constant we2oclk_setup_a	: string :=
    "WE to output clock setup violation:"	& unk;
    constant iclk2oclk_setup_a	: string :=
    "In clock to out clock setup violation:"	& unk;

    signal oherr_a	: std_logic;
    constant data2oclk_hold_a	: string :=
    "Output clock to data hold violation:"	& unk;
    constant addr2oclk_hold_a	: string :=
    "Output clock to address hold violation:"	& unk;
    constant we2oclk_hold_a	: string :=
    "Output clock to WE hold violation:"	& unk;
    constant iclk2oclk_hold_a	: string :=
    "Out clock to in clock hold violation:"	& unk;

    -- Port B check signals and errors
    signal iclkerr_b	: std_logic;
    constant iclk_width_b	: string :=
    "Input clock B cycle width violation:"	& unk;
    constant iclk_low_b		: string :=
    "Input clock B low width violation:"	& unk;
    constant iclk_high_b	: string :=
    "Input clock B high width violation:"	& unk;

    signal aserr_b	: std_logic;
    constant addr2iclk_setup_b	: string :=
    "Address B to input clock setup violation:"	& unk;
    
    signal aherr_b	: std_logic;
    constant addr2iclk_hold_b	: string :=
    "Input clock to address B hold violation:"	& unk;

    signal wserr_b	: std_logic;
    constant write2iclk_setup_b	: string :=
    "Write B to clock setup violation:"		& unk;

    signal wherr_b	: std_logic;
    constant write2iclk_hold_b	: string :=
    "Clock to write B hold violation:"		& unk;

    signal dserr_b	: std_logic;
    constant data2iclk_setup_b	: string :=
    "Data B to clock setup violation:"		& unk;

    signal dherr_b	: std_logic;
    constant data2iclk_hold_b	: string :=
    "Clock to data B hold violation:"		& unk;

    signal wrwerr_b	: std_logic;
    constant write_width_b	: string :=
    "Minimum write width B violation:"		& unk;

    signal wcycerr_b	: std_logic;
    constant writeaddr_cycle_b	: string :=
    "Minimum write cycle B violation:"		& unk;

    signal rcycerr_b	: std_logic;
    constant readaddr_cycle_b	: string :=
    "Minimum read cycle B violation:"		& unk;

    signal awserr_b	: std_logic;
    constant addr2westart_setup_b: string :=
    "Address to we B start setup violation:"	& unk;
    constant addr2weend_setup_b: string :=
    "Address to we B end setup violation:"	& unk;

    signal awherr_b	: std_logic;
    constant addr2we_hold_b	: string :=
    "We to address B hold violation:"		& unk;

    signal dwserr_b	: std_logic;
    constant data2we_setup_b	: string :=
    "Data B to we setup violation:"		& unk;

    signal dwherr_b	: std_logic;
    constant data2we_hold_b	: string :=
    "We to data B hold violation:"		& unk;

    signal oclkerr_b	: std_logic;
    constant outputclock_width_b: string :=
    "Output clock B cycle width violation:"	& unk;
    constant outputclock_low_b	: string :=
    "Output clock B low width violation:"	& unk;
    constant outputclock_high_b	: string :=
    "Output clock B high width violation:"	& unk;

    signal rcverr_b	: std_logic;
    constant outreg_rcvry_b	: string :=
    "Output reg. B reset recovery violation:"	& unk;
    
    signal rsterr_b	: std_logic;
    constant reset_width_b	: string :=
    "Reset B width violation:"			& unk;

    signal oserr_b	: std_logic;
    constant data2oclk_setup_b	: string :=
    "Data to output clock setup violation:"	& unk;
    constant addr2oclk_setup_b	: string :=
    "Address to output clock setup violation:"	& unk;
    constant we2oclk_setup_b	: string :=
    "WE to output clock setup violation:"	& unk;
    constant iclk2oclk_setup_b	: string :=
    "In clock to out clock setup violation:"	& unk;

    signal oherr_b	: std_logic;
    constant data2oclk_hold_b	: string :=
    "Output clock to data hold violation:"	& unk;
    constant addr2oclk_hold_b	: string :=
    "Output clock to address hold violation:"	& unk;
    constant we2oclk_hold_b	: string :=
    "Output clock to WE hold violation:"	& unk;
    constant iclk2oclk_hold_b	: string :=
    "Out clock to in clock hold violation:"	& unk;

begin

    -- check sync iclk_a cycle, high and low times.
    process (iclk_a)
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(4) = '1') then
	    if (iclk_a = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmClkInWthHi)) then
		    assert (false)
			report iclk_width_a
			severity warning;
		    iclkerr_a <= '1'; 
		    iclkerr_a <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (iclk_a = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xcmClkInWthLo)) then
		   assert (false)
			report iclk_low_a
			severity warning;
		    iclkerr_a <= '1'; 
		    iclkerr_a <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmClkInWthCy)) then
		    assert (false)
			report iclk_high_a
			severity warning;
		    iclkerr_a <= '1'; 
		    iclkerr_a <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

    -- check sync iclk_b cycle, high and low times.
    process (iclk_b)
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(17) = '1') then
	    if (iclk_b = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmClkInWthHi)) then
		    assert (false)
			report iclk_width_b
			severity warning;
		    iclkerr_b <= '1'; 
		    iclkerr_b <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (iclk_b = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xcmClkInWthLo)) then
		   assert (false)
			report iclk_low_b
			severity warning;
		    iclkerr_b <= '1'; 
		    iclkerr_b <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmClkInWthCy)) then
		    assert (false)
			report iclk_high_b
			severity warning;
		    iclkerr_b <= '1'; 
		    iclkerr_b <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

    -- check sync address setup _a
    daiclk_a <= iclk_a after syncAddrSetup;
    process (addr_a, daiclk_a)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(4) = '1') then
	    if (rising_edge(daiclk_a)) then
		if ((addrev /= 0 ns) AND 
			((NOW-addrev) < xcmAddrAtClkInSetup+syncAddrSetup)) then
		    assert (false)
			report addr2iclk_setup_a
			severity warning;
		    aserr_a <= '1'; 
		    aserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr_a'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check sync address hold _a
    dsaddr_a <= addr_a after syncAddrHold;
    process (dsaddr_a, iclk_a)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(4) = '1') then
	    if (rising_edge(iclk_a)) then
	    	clckev := NOW;
	    elsif (dsaddr_a'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmAddrAtClkInHold+syncAddrHold)) then
		    assert (false)
			report addr2iclk_hold_a
			severity warning;
		    aherr_a <= '1'; 
		    aherr_a <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync address setup _b
    daiclk_b <= iclk_b after syncAddrSetup;
    process (addr_b, daiclk_b)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(17) = '1') then
	    if (rising_edge(daiclk_b)) then
		if ((addrev /= 0 ns) AND 
			((NOW-addrev) < xcmAddrAtClkInSetup+syncAddrSetup)) then
		    assert (false)
			report addr2iclk_setup_b
			severity warning;
		    aserr_b <= '1'; 
		    aserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr_b'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check sync address hold _b
    dsaddr_b <= addr_b after syncAddrHold;
    process (dsaddr_b, iclk_b)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(17) = '1') then
	    if (rising_edge(iclk_b)) then
	    	clckev := NOW;
	    elsif (dsaddr_b'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmAddrAtClkInHold+syncAddrHold)) then
		    assert (false)
			report addr2iclk_hold_b
			severity warning;
		    aherr_b <= '1'; 
		    aherr_b <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync write setup _a
    dwiclk_a <= iclk_a after syncWESetup;
    process (we_a, dwiclk_a)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(4) = '1') then
	    if (rising_edge(dwiclk_a)) then
		if ((writev /= 0 ns) AND 
			((NOW-writev) < xcmWriEnaAtClkInSetup+syncWESetup)) then
		    assert (false)
			report write2iclk_setup_a
			severity warning;
		    wserr_a <= '1'; 
		    wserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (we_a'event) then
	    	writev := NOW;
	    end if;
	end if;
    end process;

    -- check sync write hold _a
    dswe_a <= we_a after syncWEHold;
    process (dswe_a, iclk_a)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(4) = '1') then
	    if (rising_edge(iclk_a)) then
	    	clckev := NOW;
	    elsif (dswe_a'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmWriEnaAtClkInHold+syncWEHold)) then
		    assert (false)
			report write2iclk_hold_a
			severity warning;
		    wherr_a <= '1'; 
		    wherr_a <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync write setup _b
    dwiclk_b <= iclk_b after syncWESetup;
    process (we_b, dwiclk_b)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(17) = '1') then
	    if (rising_edge(dwiclk_b)) then
		if ((writev /= 0 ns) AND 
			((NOW-writev) < xcmWriEnaAtClkInSetup+syncWESetup)) then
		    assert (false)
			report write2iclk_setup_b
			severity warning;
		    wserr_b <= '1'; 
		    wserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (we_b'event) then
	    	writev := NOW;
	    end if;
	end if;
    end process;

    -- check sync write hold _b
    dswe_b <= we_b after syncWEHold;
    process (dswe_b, iclk_b)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(17) = '1') then
	    if (rising_edge(iclk_b)) then
	    	clckev := NOW;
	    elsif (dswe_b'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmWriEnaAtClkInHold+syncWEHold)) then
		    assert (false)
			report write2iclk_hold_b
			severity warning;
		    wherr_b <= '1'; 
		    wherr_b <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync data setup _a
    ddiclk_a <= iclk_a after syncDataSetup;
    process (din_a, ddiclk_a)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(5) = '1') then
	    if (rising_edge(ddiclk_a)) then
		if ((dataev /= 0 ns) AND 
			((NOW-dataev) < xcmDinAtClkInSetup+syncDataSetup)) then
		    assert (false)
			report data2iclk_setup_a
			severity warning;
		    dserr_a <= '1'; 
		    dserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (din_a'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data hold _a
    dsdin_a <= din_a after syncDataHold;
    process (dsdin_a, iclk_a)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(5) = '1') then
	    if (rising_edge(iclk_a)) then
	    	clckev := NOW;
	    elsif (dsdin_a'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmDinAtClkInHold+syncDataHold)) then
		    assert (false)
			report data2iclk_hold_a
			severity warning;
		    dherr_a <= '1'; 
		    dherr_a <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync data setup _b
    ddiclk_b <= iclk_b after syncDataSetup;
    process (din_b, ddiclk_b)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(18) = '1') then
	    if (rising_edge(ddiclk_b)) then
		if ((dataev /= 0 ns) AND 
			((NOW-dataev) < xcmDinAtClkInSetup+syncDataSetup)) then
		    assert (false)
			report data2iclk_setup_b
			severity warning;
		    dserr_b <= '1'; 
		    dserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (din_b'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data hold _b
    dsdin_b <= din_b after syncDataHold;
    process (dsdin_b, iclk_b)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(18) = '1') then
	    if (rising_edge(iclk_b)) then
	    	clckev := NOW;
	    elsif (dsdin_b'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmDinAtClkInHold+syncDataHold)) then
		    assert (false)
			report data2iclk_hold_b
			severity warning;
		    dherr_b <= '1'; 
		    dherr_b <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check async write_a minimum valid
    process (we_a)
	variable write_ev : time := 0 ns;
    begin
	if ((cfgbits(4) = '0') AND (we_a = '0')) then
	    if NOT ((write_ev = 0 ns) OR ((NOW - write_ev) >= xcmWriEnaWthHi)) then
		assert (false)
		    report write_width_a
		    severity warning;
		wrwerr_a <= '1'; 
		wrwerr_a <= transport '0' AFTER 1 ns;
	    end if;
	    write_ev := NOW;
	end if;
    end process;

    -- check async write_b minimum valid
    process (we_b)
	variable write_ev : time := 0 ns;
    begin
	if ((cfgbits(17) = '0') AND (we_b = '0')) then
	    if NOT ((write_ev = 0 ns) OR ((NOW - write_ev) >= xcmWriEnaWthHi)) then
		assert (false)
		    report write_width_b
		    severity warning;
		wrwerr_b <= '1'; 
		wrwerr_b <= transport '0' AFTER 1 ns;
	    end if;
	    write_ev := NOW;
	end if;
    end process;

    -- Generate the ATD for A
    process (addr_a)
    begin
    	if (cfgbits(4) = '0') then
	    atd_a <= '1';
	    atd_a <= transport '0' after xcmAddrTransDetect;
	end if;
    end process;

    -- Generate the ATD for B
    process (addr_b)
    begin
    	if (cfgbits(17) = '0') then
	    atd_b <= '1';
	    atd_b <= transport '0' after xcmAddrTransDetect;
	end if;
    end process;

    -- check async data to write setup _a
    ddwe_a <= we_a after asyncDataSetup;
    process (din_a, ddwe_a)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(5) = '0') then
	    if (falling_edge(ddwe_a)) then
		if ((dataev /= 0 ns) AND 
		    ((NOW-dataev) < xcmDinAtWriEnaFallSetup+asyncDataSetup))then
		    assert (false)
			report data2we_setup_a
			severity warning;
		    dwserr_a <= '1'; 
		    dwserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (din_a'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check async data to write hold _a
    dadin_a <= din_a after asyncDataHold;
    process (dadin_a, we_a)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(5) = '0') then
	    if (falling_edge(we_a)) then
	    	writev := NOW;
	    elsif (dadin_a'event) then
		if ((writev /= 0 ns) AND
		    ((NOW-writev) < xcmDinAtWriEnaFallHold+asyncDataHold)) then
		    assert (false)
			report data2we_hold_a
			severity warning;
		    dwherr_a <= '1'; 
		    dwherr_a <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check async data to write setup _b
    ddwe_b <= we_b after asyncDataSetup;
    process (din_b, ddwe_b)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(18) = '0') then
	    if (falling_edge(ddwe_b)) then
		if ((dataev /= 0 ns) AND 
		    ((NOW-dataev) < xcmDinAtWriEnaFallSetup+asyncDataSetup))then
		    assert (false)
			report data2we_setup_b
			severity warning;
		    dwserr_b <= '1'; 
		    dwserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (din_b'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check async data to write hold _b
    dadin_b <= din_b after asyncDataHold;
    process (dadin_b, we_b)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(18) = '0') then
	    if (falling_edge(we_b)) then
	    	writev := NOW;
	    elsif (dadin_b'event) then
		if ((writev /= 0 ns) AND
		    ((NOW-writev) < xcmDinAtWriEnaFallHold+asyncDataHold)) then
		    assert (false)
			report data2we_hold_b
			severity warning;
		    dwherr_b <= '1'; 
		    dwherr_b <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check async address to write rising setup _a
    dawer_a <= we_a after asyncAddrSetupR;
    process (addr_a, dawer_a)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(4) = '0') then
	    if (rising_edge(dawer_a)) then
		if ((addrev /= 0 ns) AND 
		((NOW-addrev) < xcmAddrAtWriEnaRiseSetup+asyncAddrSetupR)) then
		    assert (false)
			report addr2westart_setup_a
			severity warning;
		    awserr_a <= '1'; 
		    awserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr_a'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check async address to write falling setup _a
    dawef_a <= we_a after asyncAddrSetupF;
    process (addr_a, dawef_a)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(4) = '0') then
	    if (falling_edge(dawef_a)) then
		if ((addrev /= 0 ns) AND 
		((NOW-addrev) < xcmAddrAtWriEnaFallSetup+asyncAddrSetupF)) then
		    assert (false)
			report addr2weend_setup_a
			severity warning;
		    awserr_a <= '1'; 
		    awserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr_a'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check async address to write hold _a
    daaddr_a <= addr_a after asyncAddrHold;
    process (daaddr_a, we_a)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(4) = '0') then
	    if (falling_edge(we_a)) then
	    	writev := NOW;
	    elsif (daaddr_a'event) then
		if ((writev /= 0 ns) AND
		    ((NOW-writev) < xcmAddrAtWriEnaFallHold+asyncAddrHold)) then
		    assert (false)
			report addr2we_hold_a
			severity warning;
		    awherr_a <= '1'; 
		    awherr_a <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check async address to write rising setup _b
    dawer_b <= we_b after asyncAddrSetupR;
    process (addr_b, dawer_b)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(17) = '0') then
	    if (rising_edge(dawer_b)) then
		if ((addrev /= 0 ns) AND 
		((NOW-addrev) < xcmAddrAtWriEnaRiseSetup+asyncAddrSetupR)) then
		    assert (false)
			report addr2westart_setup_b
			severity warning;
		    awserr_b <= '1'; 
		    awserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr_b'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check async address to write falling setup _b
    dawef_b <= we_b after asyncAddrSetupF;
    process (addr_b, dawef_b)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(17) = '0') then
	    if (falling_edge(dawef_b)) then
		if ((addrev /= 0 ns) AND 
		((NOW-addrev) < xcmAddrAtWriEnaFallSetup+asyncAddrSetupF)) then
		    assert (false)
			report addr2weend_setup_b
			severity warning;
		    awserr_b <= '1'; 
		    awserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr_b'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check async address to write hold _b
    daaddr_b <= addr_b after asyncAddrHold;
    process (daaddr_b, we_b)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(17) = '0') then
	    if (falling_edge(we_b)) then
	    	writev := NOW;
	    elsif (daaddr_b'event) then
		if ((writev /= 0 ns) AND
		    ((NOW-writev) < xcmAddrAtWriEnaFallHold+asyncAddrHold)) then
		    assert (false)
			report addr2we_hold_b
			severity warning;
		    awherr_b <= '1'; 
		    awherr_b <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync oclk_a cycle, high and low times.
    process (oclk_a)
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(4) = '1') then
	    if (oclk_a = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmDoutRegCkWthHi)) then
		    assert (false)
			report outputclock_high_a
			severity warning;
		    oclkerr_a <= '1'; 
		    oclkerr_a <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (oclk_a = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xcmDoutRegCkWthLo)) then
		   assert (false)
			report outputclock_low_a
			severity warning;
		    oclkerr_a <= '1'; 
		    oclkerr_a <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmDoutRegCkWthCy)) then
		    assert (false)
			report outputclock_width_a
			severity warning;
		    oclkerr_a <= '1'; 
		    oclkerr_a <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

    -- check sync oclk_b cycle, high and low times.
    process (oclk_b)
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(17) = '1') then
	    if (oclk_b = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmDoutRegCkWthHi)) then
		    assert (false)
			report outputclock_high_b
			severity warning;
		    oclkerr_b <= '1'; 
		    oclkerr_b <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (oclk_b = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xcmDoutRegCkWthLo)) then
		   assert (false)
			report outputclock_low_b
			severity warning;
		    oclkerr_b <= '1'; 
		    oclkerr_b <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcmDoutRegCkWthCy)) then
		    assert (false)
			report outputclock_width_b
			severity warning;
		    oclkerr_b <= '1'; 
		    oclkerr_b <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;


    -- check output register A reset recovery and reset width
    process (reset_a, oclk_a)
	variable clrlastev, clklastev, clrhi : time := 0 ns;
    begin
    	if (cfgbits(6) = '1') then
	    if (reset_a'event) then
		clrlastev := NOW;
		if (reset_a = '1') then
		    clrhi := NOW;
		else
		    if NOT ((clrhi = 0 ns) OR ((NOW-clrhi) >= xcmDoutRegReWthHi)) then
			assert (false)
			    report reset_width_a
			    severity warning;
			rsterr_a <= '1'; 
			rsterr_a <= transport '0' AFTER 1 ns;
		    end if;
		end if;
	    end if;
	    if ((reset_a = '0') AND rising_edge(oclk_a)) then
		if NOT((clrlastev = 0 ns) OR ((NOW-clrlastev) >= xcmDoutRegReRcr)) then
		    assert (false)
			report outreg_rcvry_a
			severity warning;
		    rcverr_a <= '1';
		    rcverr_a <= transport '0' AFTER 1 ns;
		end if;
		clklastev := NOW;
	    end if;
	end if;
    end process;

    -- check output register B reset recovery and reset width
    process (reset_b, oclk_b)
	variable clrlastev, clklastev, clrhi : time := 0 ns;
    begin
    	if (cfgbits(19) = '1') then
	    if (reset_b'event) then
		clrlastev := NOW;
		if (reset_b = '1') then
		    clrhi := NOW;
		else
		    if NOT ((clrhi = 0 ns) OR ((NOW-clrhi) >= xcmDoutRegReWthHi)) then
			assert (false)
			    report reset_width_b
			    severity warning;
			rsterr_b <= '1'; 
			rsterr_b <= transport '0' AFTER 1 ns;
		    end if;
		end if;
	    end if;
	    if ((reset_b = '0') AND rising_edge(oclk_b)) then
		if NOT((clrlastev = 0 ns) OR ((NOW-clrlastev) >= xcmDoutRegReRcr)) then
		    assert (false)
			report outreg_rcvry_b
			severity warning;
		    rcverr_b <= '1';
		    rcverr_b <= transport '0' AFTER 1 ns;
		end if;
		clklastev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data to oclk setup _a
    doclk_a <= oclk_a after dataOutSetup;
    process (cdout_a, doclk_a)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(6) = '1') then
	    if ((reset_a = '0') AND rising_edge(doclk_a)) then
		if ((dataev /= 0 ns) AND 
			((NOW-dataev) < xcmDoutRegSetup+dataOutSetup)) then
		    assert (false)
			report data2oclk_setup_a
			severity warning;
		    oserr_a <= '1'; 
		    oserr_a <= transport '0' AFTER 1 ns;
		end if;
	    elsif (cdout_a'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data to oclk hold _a
    dcdout_a <= cdout_a after dataOutHold;
    process (dcdout_a, oclk_a)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(6) = '1') then
	    if ((reset_a = '0') AND rising_edge(oclk_a)) then
	    	clckev := NOW;
	    elsif (dcdout_a'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmDoutRegHold+dataOutHold)) then
		    assert (false)
			report data2oclk_hold_a
			severity warning;
		    oherr_a <= '1'; 
		    oherr_a <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync data to oclk setup _b
    doclk_b <= oclk_b after dataOutSetup;
    process (cdout_b, doclk_b)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(19) = '1') then
	    if ((reset_b = '0') AND rising_edge(doclk_b)) then
		if ((dataev /= 0 ns) AND 
			((NOW-dataev) < xcmDoutRegSetup+dataOutSetup)) then
		    assert (false)
			report data2oclk_setup_b
			severity warning;
		    oserr_b <= '1'; 
		    oserr_b <= transport '0' AFTER 1 ns;
		end if;
	    elsif (cdout_b'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data to oclk hold _b
    dcdout_b <= cdout_b after dataOutHold;
    process (dcdout_b, oclk_b)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(19) = '1') then
	    if ((reset_b = '0') AND rising_edge(oclk_b)) then
	    	clckev := NOW;
	    elsif (dcdout_b'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcmDoutRegHold+dataOutHold)) then
		    assert (false)
			report data2oclk_hold_b
			severity warning;
		    oherr_b <= '1'; 
		    oherr_b <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- Simulate functionality
    process (iclk_a, addr_a, we_a, atd_a)
	variable wreg : std_logic;
    begin
	if (cfgbits(4) = '1') then
	-- Synchronous Address/Write port A
	    if (rising_edge(iclk_a)) then
		atmp_a <= addr_a;
	    end if;
	    wtmp_a <= we_a AND iclk_a;
	else
	-- Asynchronous Address/Write port A
	    if(falling_edge(atd_a) OR (xcmAddrTransDetect <= 0 ns)) then
		atmp_a <= addr_a;
	    end if;
	    wtmp_a <= we_a;
	end if;
    end process;

    process (iclk_b, addr_b, we_b, atd_b)
	variable wreg : std_logic;
    begin
	if (cfgbits(17) = '1') then
	-- Synchronous Address/Write port B
	    if (rising_edge(iclk_b)) then
		atmp_b <= addr_b;
	    end if;
	    wtmp_b <= we_b AND iclk_b;
	else
	-- Asynchronous Address/Write port B
	    if(falling_edge(atd_b) OR (xcmAddrTransDetect <= 0 ns)) then
		atmp_b <= addr_b;
	    end if;
	    wtmp_b <= we_b;
	end if;
    end process;

    process (iclk_a, din_a)
    begin
	if (cfgbits(5) = '1') then
	-- Synchronous Data port A
	    if (rising_edge(iclk_a)) then
		dtin_a <= din_a;
	    end if;
	else
	-- Asynchronous Data port A
	    dtin_a <= din_a;
	end if;
    end process;

    process (iclk_b, din_b)
    begin
	if (cfgbits(18) = '1') then
	-- Synchronous Data port B
	    if (rising_edge(iclk_b)) then
		dtin_b <= din_b;
	    end if;
	else
	-- Asynchronous Data port B
	    dtin_b <= din_b;
	end if;
    end process;

    -- simulate the dual port operations
    process (dtin_a, atmp_a, wtmp_a, iclk_a, dtin_b, atmp_b, wtmp_b, iclk_b)
	variable mem	: chmem := memdata;
	variable vecta	: natural;
	variable vectb	: natural;
	variable btsela	: natural;
	variable btselb	: natural;
	variable dataa	: std_logic_vector(7 downto 0);
	variable datab	: std_logic_vector(7 downto 0);
    begin

	vecta := to_integer(atmp_a(11 downto 3));
	vectb := to_integer(atmp_b(11 downto 3));

	-- busy is asserted whenever the two address are the same
	-- the user is responsible to arbitrate based on that information
	if (vecta = vectb) then
	    addr_matchb <= '0';
	else
	    addr_matchb <= '1';
	end if;

	-- Write the array from port A
	if (wtmp_a = '1') then
	    case cfgbits(3 downto 2) is
		when "00" =>
		    mem(vecta) := dtin_a;
		when "01" =>
		    btsela := to_integer(atmp_a(2 downto 2));
		    mem(vecta)(btsela*4+3 downto btsela*4)
					:= dtin_a(3 downto 0);
		when "10" =>
		    btsela := to_integer(atmp_a(2 downto 1));
		    mem(vecta)(btsela*2+1 downto btsela*2)
					:= dtin_a(1 downto 0);
		when "11" =>
		    btsela := to_integer(atmp_a(2 downto 0));
		    mem(vecta)(btsela) := dtin_a(0);
	    end case;
	end if;

	-- Write the array from port B
	-- This arbitration may be removed, the user should arbitrate.
	if (((wtmp_b = '1') AND (vecta /= vectb)) OR
	    ((wtmp_b = '1') AND (vecta  = vectb) AND (wtmp_a /= '1'))) then
	    case cfgbits(3 downto 2) is
		when "00" =>
		    mem(vectb) := dtin_b;
		when "01" =>
		    btselb := to_integer(atmp_b( 2 downto 2));
		    mem(vectb)(btselb*4+3 downto btselb*4)
					:= dtin_b(3 downto 0);
		when "10" =>
		    btselb := to_integer(atmp_b(2 downto 1));
		    mem(vectb)(btselb*2+1 downto btselb*2)
					:= dtin_b(1 downto 0);
		when "11" =>
		    btselb := to_integer(atmp_b(2 downto 0));
		    mem(vectb)(btselb) := dtin_b(0);
	    end case;
	end if;

	-- Read the array from port A
	dataa := (others => '0');
	case cfgbits(3 downto 2) is
	    when "00" =>
		dataa := mem(vecta);
	    when "01" =>
		btsela := to_integer(atmp_a(2 downto 2));
		dataa(3 downto 0) := mem(vecta)(btsela*4+3 downto btsela*4);
	    when "10" =>
		btsela := to_integer(atmp_a(2 downto 1));
		dataa(1 downto 0) := mem(vecta)(btsela*2+1 downto btsela*2);
	    when "11" =>
		btsela := to_integer(atmp_a(2 downto 0));
	    	dataa(0) := mem(vecta)(btsela);
	end case;

	-- Read the array from port B
	datab := (others => '0');
	case cfgbits(3 downto 2) is
	    when "00" =>
		datab := mem(vectb);
	    when "01" =>
		btselb := to_integer(atmp_b(2 downto 2));
		datab(3 downto 0) := mem(vectb)(btselb*4+3 downto btselb*4);
	    when "10" =>
		btselb := to_integer(atmp_b(2 downto 1));
		datab(1 downto 0) := mem(vectb)(btselb*2+1 downto btselb*2);
	    when "11" =>
		btselb := to_integer(atmp_b(2 downto 0));
	    	datab(0) := mem(vectb)(btselb);
	end case;

	if (cfgbits(4) = '0') then
	-- async delays port A
	    if (atmp_a'event) then
		dtout_a <= dataa after (xcmAddr2DoutRegD - xcmAddrTransDetect);
	    elsif ((wtmp_a'event) AND (wtmp_a = '1')) then
		dtout_a <= dataa after xcmWriEna2DoutRegD;
	    elsif ((dtin_a'event) AND (wtmp_a = '1')) then
		dtout_a <= dataa after xcmDin2DoutRegD;
	    else
		dtout_a <= dataa;
	    end if;
	else
	-- sync delays port A
	    if (rising_edge(iclk_a)) then
		dtout_a <= dataa after xcmClkIn2DoutRegD;
	    else
		dtout_a <= dataa;
	    end if;
	end if;

	if (cfgbits(17) = '0') then
	-- async delays port B
	    if (atmp_b'event) then
		dtout_b <= datab after (xcmAddr2DoutRegD - xcmAddrTransDetect);
	    elsif ((wtmp_b'event) AND (wtmp_b = '1')) then
		dtout_b <= datab after xcmWriEna2DoutRegD;
	    elsif ((dtin_b'event) AND (wtmp_b = '1')) then
		dtout_b <= datab after xcmDin2DoutRegD;
	    else
		dtout_b <= datab;
	    end if;
	else
	-- sync delays port B
	    if (rising_edge(iclk_b)) then
		dtout_b <= datab after xcmClkIn2DoutRegD;
	    else
		dtout_b <= datab;
	    end if;
	end if;

    end process;

    -- condition the A ouput with errors that may have happened
    process (dtout_a,iclkerr_a,aserr_a,aherr_a,wserr_a,wherr_a,dserr_a,dherr_a,
	     wrwerr_a,rcycerr_a,wcycerr_a,dwserr_a,dwherr_a,awserr_a,awherr_a)
    begin
	if (   iclkerr_a='1' OR   aserr_a='1' OR  aherr_a='1' OR  wserr_a='1'
	    OR   wherr_a='1' OR   dserr_a='1' OR  dherr_a='1' OR wrwerr_a='1'
	    OR rcycerr_a='1' OR wcycerr_a='1' OR dwserr_a='1' OR dwherr_a='1'
	    OR  awserr_a='1' OR  awherr_a='1') then

	    cdout_a <= (others => 'X');
	else
	    cdout_a <= dtout_a;
	end if;
    end process;

    -- condition the B ouput with errors that may have happened
    process (dtout_b,iclkerr_b,aserr_b,aherr_b,wserr_b,wherr_b,dserr_b,dherr_b,
	     wrwerr_b,rcycerr_b,wcycerr_b,dwserr_b,dwherr_b,awserr_b,awherr_b)
    begin
	if (   iclkerr_b='1' OR   aserr_b='1' OR  aherr_b='1' OR  wserr_b='1'
	    OR   wherr_b='1' OR   dserr_b='1' OR  dherr_b='1' OR wrwerr_b='1'
	    OR rcycerr_b='1' OR wcycerr_b='1' OR dwserr_b='1' OR dwherr_b='1'
	    OR  awserr_b='1' OR  awherr_b='1') then

	    cdout_b <= (others => 'X');
	else
	    cdout_b <= dtout_b;
	end if;
    end process;

    process (reset_a,oclk_a,cdout_a,oclkerr_a,oserr_a,oherr_a,rsterr_a,rcverr_a)
    begin
	if (cfgbits(6) = '1') then
	-- Synchronous Read port A
	    if (reset_a = '1') then
		dout_a <= (others => '0') after xcmReset2Dout;
	    elsif (oclkerr_a = '1' OR  oserr_a = '1' OR oherr_a = '1'
		OR  rsterr_a = '1' OR rcverr_a = '1') then
		dout_a <= (others => 'X');
	    elsif (rising_edge(oclk_a)) then
		dout_a <= cdout_a after xcmClkOut2Dout;
	    end if;
	else
	-- Asynchronous Read port A
	    dout_a <= cdout_a after xcmDoutRegD2Dout;
	end if;
    end process;

    process (reset_b,oclk_b,cdout_b,oclkerr_b,oserr_b,oherr_b,rsterr_b,rcverr_b)
    begin
	if (cfgbits(19) = '1') then
	-- Synchronous Read port B
	    if (reset_b = '1') then
		dout_b <= (others => '0') after xcmReset2Dout;
	    elsif (oclkerr_b = '1' OR  oserr_b = '1' OR oherr_b = '1'
		OR  rsterr_b = '1' OR rcverr_b = '1') then
		dout_b <= (others => 'X');
	    elsif (rising_edge(oclk_b)) then
		dout_b <= cdout_b after xcmClkOut2Dout;
	    end if;
	else
	-- Asynchronous Read port B
	    dout_b <= cdout_b after xcmDoutRegD2Dout;
	end if;
    end process;

end sim;
