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

entity c39kcr is
    generic (
	cfgbits	: Bit_Vector(13 downto 0);
	memdata	: clmem;
	-- asynchronous parameters
	xcrReadAddrWthHi	: time;		-- checked parameters
	xcrWritAddrWthHi	: time;
	xcrWriEnaWthHi		: time;
	xcrAddrAtWriEnaFallSetup: time;
	xcrAddrAtWriEnaRiseSetup: time;
	xcrAddrAtWriEnaFallHold	: time;
	xcrDinAtWriEnaFallSetup	: time;
	xcrDinAtWriEnaFallHold	: time;
	xcrAddr2DoutRegD	: time;		-- applied parameters
	xcrWriEna2DoutRegD	: time;
	xcrDin2DoutRegD		: time;
	xcrDoutRegD2Dout	: time;
	-- synchronous input parameters
	xcrClkInWthCy		: time;		-- checked parameters
	xcrClkInWthHi		: time;
	xcrClkInWthLo		: time;
	xcrAddrAtClkInSetup	: time;
	xcrAddrAtClkInHold	: time;
	xcrWriEnaAtClkInSetup	: time;
	xcrWriEnaAtClkInHold	: time;
	xcrDinAtClkInSetup	: time;
	xcrDinAtClkInHold	: time;
	xcrClkIn2DoutRegD	: time;		-- applied parameters
	-- synchronous output parameters
	xcrDoutRegCkWthHi	: time;		-- checked parameters
	xcrDoutRegCkWthLo	: time;
	xcrDoutRegCkWthCy	: time;
	xcrDoutRegSetup		: time;
	xcrDoutRegHold		: time;
	xcrDoutRegReRcr		: time;
	xcrDoutRegReWthHi	: time;
	xcrClkOut2Dout		: time;		-- applied parameters
	xcrReset2Dout		: time;
	xcrAddrTransDetect	: time);
    port (
	din	: in	std_logic_vector( 7 downto 0);
	addr	: in	std_logic_vector(12 downto 0);
	we	: in	std_logic;
	iclk	: in	std_logic;
	oclk	: in	std_logic;
	reset	: in	std_logic;
	dout	: out	std_logic_vector( 7 downto 0));
end c39kcr;

architecture sim of c39kcr is

    signal atmp		: std_logic_vector(12 downto 0);
    signal dtin		: std_logic_vector( 7 downto 0);
    signal dtout	: std_logic_vector( 7 downto 0);
    signal cdout	: std_logic_vector( 7 downto 0);
    signal wtmp		: std_logic;
    signal atd		: std_logic;

    -- Signals for use with negative setup and hold checks
    signal dsaddr	:std_logic_vector(12 downto 0);
    signal daiclk	:std_logic;
    signal dswe		:std_logic;
    signal dwiclk	:std_logic;
    signal dsdin	:std_logic_vector( 7 downto 0);
    signal ddiclk	:std_logic;
    signal dcdout	:std_logic_vector( 7 downto 0);
    signal doclk	:std_logic;
    signal dadin	:std_logic_vector( 7 downto 0);
    signal ddwe		:std_logic;
    signal daaddr	:std_logic_vector(12 downto 0);
    signal dawer	:std_logic;
    signal dawef	:std_logic;

    -- Constants for use with negative setup and hold checks
    constant syncAddrSetup	: time := timeAdjust(xcrAddrAtClkInSetup);
    constant syncAddrHold	: time := timeAdjust(xcrAddrAtClkInHold);
    constant syncWESetup	: time := timeAdjust(xcrWriEnaAtClkInSetup);
    constant syncWEHold		: time := timeAdjust(xcrWriEnaAtClkInHold);
    constant syncDataSetup	: time := timeAdjust(xcrDinAtClkInSetup);
    constant syncDataHold	: time := timeAdjust(xcrDinAtClkInHold);
    constant dataOutSetup	: time := timeAdjust(xcrDoutRegSetup);
    constant dataOutHold	: time := timeAdjust(xcrDoutRegHold);
    constant asyncAddrSetupF	: time := timeAdjust(xcrAddrAtWriEnaFallSetup);
    constant asyncAddrSetupR	: time := timeAdjust(xcrAddrAtWriEnaRiseSetup);
    constant asyncAddrHold	: time := timeAdjust(xcrAddrAtWriEnaFallHold);
    constant asyncDataSetup	: time := timeAdjust(xcrDinAtWriEnaFallSetup);
    constant asyncDataHold	: time := timeAdjust(xcrDinAtWriEnaFallHold);

    constant unk	: string := " Setting output unknown.";

    signal iclkerr	: std_logic;
    constant iclk_high		: string :=
    "Input clock high width violation:"		& unk;
    constant iclk_low		: string :=
    "Input clock low width violation:"		& unk;
    constant iclk_cycle		: string :=
    "Input clock cycle width violation:"	& unk;

    signal aserr	: std_logic;
    constant address_setup	: string :=
    "Address to input clock setup violation:"	& unk;

    signal aherr	: std_logic;
    constant address_hold	: string :=
    "Input clock to address hold violation:"	& unk;

    signal wserr	: std_logic;
    constant write_setup	: string :=
    "Write to input clock setup violation:"	& unk;

    signal wherr	: std_logic;
    constant write_hold		: string :=
    "Input clock to write hold violation:"	& unk;

    signal dserr	: std_logic;
    constant data_setup		: string :=
    "Data to input clock setup violation:"	& unk;

    signal dherr	: std_logic;
    constant data_hold		: string :=
    "Input clock to data hold violation:"	& unk;

    signal oclkerr	: std_logic;
    constant oclk_high		: string :=
    "Output clock high width violation:"	& unk;
    constant oclk_low		: string :=
    "Output clock low width violation:"		& unk;
    constant oclk_cycle		: string :=
    "Output clock cycle width violation:"	& unk;

    signal rcverr	: std_logic;
    constant outreg_rcvry	: string :=
    "Output register reset recovery violation:"	& unk;

    signal rsterr	: std_logic;
    constant reset_width	: string :=
    "Reset width violation:"			& unk;

    signal oserr	: std_logic;
    constant data2oclk_setup	: string :=
    "Data to output clock setup violation:"	& unk;

    signal oherr	: std_logic;
    constant data2oclk_hold	: string :=
    "Output clock to data hold violation:"	& unk;

    signal wrwerr	: std_logic;
    constant write_width	: string :=
    "Minimum write width violation:"		& unk;

    signal rcycerr	: std_logic;
    constant read_cycle		: string :=
    "Minimum read cycle violation:"		& unk;

    signal wcycerr	: std_logic;
    constant write_cycle	: string :=
    "Minimum write cycle violation:"		& unk;

    signal dwserr	: std_logic;
    constant data2we_setup	: string :=
    "Data to we setup violation:"		& unk;

    signal dwherr	: std_logic;
    constant data2we_hold	: string :=
    "We to data hold violation:"		& unk;

    signal awserr	: std_logic;
    constant addr2westart_setup	: string :=
    "Address to we start setup violation:"	& unk;
    constant addr2weend_setup	: string :=
    "Address to we end setup violation:"	& unk;

    signal awherr	: std_logic;
    constant addr2we_hold	: string :=
    "We to address hold violation:"		& unk;

begin

    -- check iclk cycle, high and low times.
    process (iclk)
	variable clkhi, clklo : time := 0 ns;
    begin
	if ((cfgbits(2) = '1') OR (cfgbits(3) = '1')) then
	    if (iclk = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcrClkInWthHi)) then
		    assert (false)
			report iclk_high
			severity warning;
		    iclkerr <= '1';
		    iclkerr <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (iclk = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xcrClkInWthLo)) then
		   assert (false)
			report iclk_low
			severity warning;
		    iclkerr <= '1';
		    iclkerr <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcrClkInWthCy)) then
		    assert (false)
			report iclk_cycle
			severity warning;
		    iclkerr <= '1';
		    iclkerr <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

    -- check sync address setup
    daiclk <= iclk after syncAddrSetup;
    process (addr, daiclk)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(2) = '1') then
	    if (rising_edge(daiclk)) then
		if ((addrev /= 0 ns) AND 
			((NOW-addrev) < xcrAddrAtClkInSetup+syncAddrSetup)) then
		    assert (false)
			report address_setup
			severity warning;
		    aserr <= '1'; 
		    aserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check sync address hold
    dsaddr <= addr after syncAddrHold;
    process (dsaddr, iclk)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(2) = '1') then
	    if (rising_edge(iclk)) then
	    	clckev := NOW;
	    elsif (dsaddr'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcrAddrAtClkInHold+syncAddrHold)) then
		    assert (false)
			report address_hold
			severity warning;
		    aherr <= '1'; 
		    aherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync write setup
    dwiclk <= iclk after syncWESetup;
    process (we, dwiclk)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(2) = '1') then
	    if (rising_edge(dwiclk)) then
		if ((writev /= 0 ns) AND 
			((NOW-writev) < xcrWriEnaAtClkInSetup+syncWESetup)) then
		    assert (false)
			report write_setup
			severity warning;
		    wserr <= '1'; 
		    wserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (we'event) then
	    	writev := NOW;
	    end if;
	end if;
    end process;

    -- check sync write hold
    dswe <= we after syncWEHold;
    process (dswe, iclk)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(2) = '1') then
	    if (rising_edge(iclk)) then
	    	clckev := NOW;
	    elsif (dswe'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcrWriEnaAtClkInHold+syncWEHold)) then
		    assert (false)
			report write_hold
			severity warning;
		    wherr <= '1'; 
		    wherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check sync data setup
    ddiclk <= iclk after syncDataSetup;
    process (din, ddiclk)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(3) = '1') then
	    if (rising_edge(ddiclk)) then
		if ((dataev /= 0 ns) AND 
			((NOW-dataev) < xcrDinAtClkInSetup+syncDataSetup)) then
		    assert (false)
			report data_setup
			severity warning;
		    dserr <= '1'; 
		    dserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (din'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data hold
    dsdin <= din after syncDataHold;
    process (dsdin, iclk)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(3) = '1') then
	    if (rising_edge(iclk)) then
	    	clckev := NOW;
	    elsif (dsdin'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcrDinAtClkInHold+syncDataHold)) then
		    assert (false)
			report data_hold
			severity warning;
		    dherr <= '1'; 
		    dherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check oclk cycle, high and low times.
    process (oclk)
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(8) = '1') then
	    if (oclk = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcrDoutRegCkWthHi)) then
		    assert (false)
			report oclk_high
			severity warning;
		    oclkerr <= '1';
		    oclkerr <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (oclk = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xcrDoutRegCkWthLo)) then
		   assert (false)
			report oclk_low
			severity warning;
		    oclkerr <= '1';
		    oclkerr <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xcrDoutRegCkWthCy)) then
		    assert (false)
			report oclk_cycle
			severity warning;
		    oclkerr <= '1';
		    oclkerr <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

        -- check output register reset recovery and reset width
    process (reset, oclk)
	variable clrlastev, clklastev, clrhi : time := 0 ns;
    begin
    	if (cfgbits(8) = '1') then
	    if (reset'event) then
		clrlastev := NOW;
		if (reset = '1') then
		    clrhi := NOW;
		else
		    if NOT ((clrhi = 0 ns) OR ((NOW-clrhi) >= xcrDoutRegReWthHi)) then
			assert (false)
			    report reset_width
			    severity warning;
			rsterr <= '1'; 
			rsterr <= transport '0' AFTER 1 ns;
		    end if;
		end if;
	    end if;
	    if ((reset = '0') AND rising_edge(oclk)) then
		if NOT((clrlastev = 0 ns) OR ((NOW-clrlastev) >= xcrDoutRegReRcr)) then
		    assert (false)
			report outreg_rcvry
			severity warning;
		    rcverr <= '1';
		    rcverr <= transport '0' AFTER 1 ns;
		end if;
		clklastev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data to oclk setup
    doclk <= oclk after dataOutSetup;
    process (cdout, doclk)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(8) = '1') then
	    if ((reset = '0') AND rising_edge(doclk)) then
		if ((dataev /= 0 ns) AND 
			((NOW-dataev) < xcrDoutRegSetup+dataOutSetup)) then
		    assert (false)
			report data2oclk_setup
			severity warning;
		    oserr <= '1'; 
		    oserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (cdout'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check sync data to oclk hold
    dcdout <= cdout after dataOutHold;
    process (dcdout, oclk)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(8) = '1') then
	    if ((reset = '0') AND rising_edge(oclk)) then
	    	clckev := NOW;
	    elsif (dcdout'event) then
		if ((clckev /= 0 ns) AND
			((NOW-clckev) < xcrDoutRegHold+dataOutHold)) then
		    assert (false)
			report data2oclk_hold
			severity warning;
		    oherr <= '1'; 
		    oherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check async write minimum valid
    process (we)
	variable write_ev : time := 0 ns;
    begin
	if ((cfgbits(2) = '0') AND (we = '0')) then
	    if NOT ((write_ev = 0 ns) OR ((NOW - write_ev) >= xcrWriEnaWthHi)) then
		assert (false)
		    report write_width
		    severity warning;
		wrwerr <= '1';
		wrwerr <= transport '0' AFTER 1 ns;
	    end if;
	    write_ev := NOW;
	end if;
    end process;

    -- Generate the ATD
    process (addr)
    begin
    	if (cfgbits(2) = '0') then
	    atd <= '1';
	    atd <= transport '0' after xcrAddrTransDetect;
	end if;
    end process;

    -- check async data to write setup
    ddwe <= we after asyncDataSetup;
    process (din, ddwe)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(3) = '0') then
	    if (falling_edge(ddwe)) then
		if ((dataev /= 0 ns) AND 
		    ((NOW-dataev) < xcrDinAtWriEnaFallSetup+asyncDataSetup))then
		    assert (false)
			report data2we_setup
			severity warning;
		    dwserr <= '1'; 
		    dwserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (din'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check async data to write hold
    dadin <= din after asyncDataHold;
    process (dadin, we)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(3) = '0') then
	    if (falling_edge(we)) then
	    	writev := NOW;
	    elsif (dadin'event) then
		if ((writev /= 0 ns) AND
		    ((NOW-writev) < xcrDinAtWriEnaFallHold+asyncDataHold)) then
		    assert (false)
			report data2we_hold
			severity warning;
		    dwherr <= '1'; 
		    dwherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check async address to write rising setup
    dawer <= we after asyncAddrSetupR;
    process (addr, dawer)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(2) = '0') then
	    if (rising_edge(dawer)) then
		if ((addrev /= 0 ns) AND 
		((NOW-addrev) < xcrAddrAtWriEnaRiseSetup+asyncAddrSetupR)) then
		    assert (false)
			report addr2westart_setup
			severity warning;
		    awserr <= '1'; 
		    awserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check async address to write falling setup
    dawef <= we after asyncAddrSetupF;
    process (addr, dawef)
    	variable addrev : time := 0 ns;
    begin
    	if (cfgbits(2) = '0') then
	    if (falling_edge(dawef)) then
		if ((addrev /= 0 ns) AND 
		((NOW-addrev) < xcrAddrAtWriEnaFallSetup+asyncAddrSetupF)) then
		    assert (false)
			report addr2weend_setup
			severity warning;
		    awserr <= '1'; 
		    awserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (addr'event) then
	    	addrev := NOW;
	    end if;
	end if;
    end process;

    -- check async address to write hold
    daaddr <= addr after asyncAddrHold;
    process (daaddr, we)
    	variable writev : time := 0 ns;
    begin
    	if (cfgbits(2) = '0') then
	    if (falling_edge(we)) then
	    	writev := NOW;
	    elsif (daaddr'event) then
		if ((writev /= 0 ns) AND
		    ((NOW-writev) < xcrAddrAtWriEnaFallHold+asyncAddrHold)) then
		    assert (false)
			report addr2we_hold
			severity warning;
		    awherr <= '1'; 
		    awherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    process (iclk, addr, we, atd)
    begin
	if (cfgbits(2) = '1') then
	-- Synchronous Address/Write
	    if (rising_edge(iclk)) then
		atmp <= addr;
	    end if;
	    wtmp <= we AND iclk;
	else
	-- Asynchronous Address/Write
	    if (falling_edge(atd) OR (xcrAddrTransDetect <= 0 ns)) then
		atmp <= addr;
	    end if;
	    wtmp <= we;
	end if;
    end process;

    process (iclk, din)
    begin
	if (cfgbits(3) = '1') then
	-- Synchronous Data
	    if (rising_edge(iclk)) then
		dtin <= din;
	    end if;
	else
	-- Asynchronous Data
	    dtin <= din;
	end if;
    end process;

    process (dtin, atmp, wtmp, iclk)
	variable mem	: clmem := memdata;
	variable vect	: natural;
	variable btsel	: natural;
	variable data	: std_logic_vector(7 downto 0);
    begin

	vect := to_integer(atmp(12 downto 3));

	-- Write the array
	if (wtmp = '1') then
	    case cfgbits(1 downto 0) is
		when "00" =>
		    mem(vect) := dtin;
		when "01" =>
		    btsel := to_integer(atmp(2 downto 2));
		    mem(vect)(btsel*4+3 downto btsel*4) := dtin(3 downto 0);
		when "10" =>
		    btsel := to_integer(atmp(2 downto 1));
		    mem(vect)(btsel*2+1 downto btsel*2) := dtin(1 downto 0);
		when "11" =>
		    btsel := to_integer(atmp(2 downto 0));
		    mem(vect)(btsel) := dtin(0);
	    end case;
	end if;

	data := (others => '0');

	-- Read the array
	case cfgbits(1 downto 0) is
	    when "00" =>
		data := mem(vect);
	    when "01" =>
		btsel := to_integer(atmp(2 downto 2));
		data(3 downto 0) := mem(vect)(btsel*4+3 downto btsel*4);
	    when "10" =>
		btsel := to_integer(atmp(2 downto 1));
		data(1 downto 0) := mem(vect)(btsel*2+1 downto btsel*2);
	    when "11" =>
		btsel := to_integer(atmp(2 downto 0));
	    	data(0) := mem(vect)(btsel);
	end case;

	if (cfgbits(3) = '0') then
	-- async delays
	    if (atmp'event) then
		-- addresses have already been delayed, so account for it.
		dtout <= data after (xcrAddr2DoutRegD - xcrAddrTransDetect);
	    elsif ((wtmp'event) AND (wtmp = '1')) then
		dtout <= data after xcrWriEna2DoutRegD;
	    elsif ((dtin'event) AND (wtmp = '1')) then
		dtout <= data after xcrDin2DoutRegD;
	    else
		dtout <= data;
	    end if;
	else
	-- sync delays
	    if (rising_edge(iclk)) then
		dtout <= data after xcrClkIn2DoutRegD;
	    else
		dtout <= data;
	    end if;
	end if;

    end process;

    -- condition the data with errors that may have happened
    process(dtout,iclkerr,aserr,aherr,wserr,wherr,dserr,dherr,
	    wrwerr,rcycerr,wcycerr,dwserr,dwherr,awserr,awherr)
    begin
    if (   iclkerr='1' OR   aserr='1' OR  aherr='1' OR  wserr='1'
	OR   wherr='1' OR   dserr='1' OR   dherr='1' OR wrwerr='1'
	OR rcycerr='1' OR wcycerr='1' OR  dwserr='1' OR dwherr='1'
	OR  awserr='1' OR  awherr='1') then
	    cdout <= (others => 'X');
	else
	    cdout <= dtout;
	end if;
    end process;

    process (reset, oclk, cdout, oclkerr, oserr, oherr, rsterr, rcverr)
    begin
	if (cfgbits(8) = '1') then
	-- Synchronous Read
	    if (reset = '1') then
		dout <= (others => '0') after xcrReset2Dout;
	    elsif (oclkerr = '1' OR oserr = '1' OR oherr = '1'
		    OR rsterr = '1' OR rcverr = '1') then
	    	dout <= (others => 'X');
	    elsif (rising_edge(oclk)) then
		dout <= cdout after xcrClkOut2Dout;
	    end if;
	else
	-- Asynchronous Read
	    dout <= cdout after xcrDoutRegD2Dout;
	end if;
    end process;

end sim;
