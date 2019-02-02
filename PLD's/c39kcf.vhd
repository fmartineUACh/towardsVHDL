--------------------------------------------------------------------------------
--
--              Copyright Cypress Semiconductor         1999
--              Protected as an unpublished work.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c39kp.all;

entity c39kcf is
    generic (
	cfgbits : Bit_Vector(45 downto 0);
	memdata	: chmem;
	xcmfClockWthCy		: time;		-- checked parameters
	xcmfClockWthHi		: time;
	xcmfClockWthLo		: time;
	xcmfDinAtClkWrSetup	: time;
	xcmfDinAtClkWrHold	: time;
	xcmfEnxAtClockSetup	: time;
	xcmfEnxAtClockHold	: time;
	xcmfEfbInAtClkRdSetup	: time;
	xcmfEfbInAtClkRdHold	: time;
	xcmfHfbInAtClkRdSetup	: time;
	xcmfHfbInAtClkRdHold	: time;
	xcmfEfbInAtClkWrSetup	: time;
	xcmfEfbInAtClkWrHold	: time;
	xcmfHfbInAtClkWrSetup	: time;
	xcmfHfbInAtClkWrHold	: time;
	xcmfMrbWthLo		: time;
	xcmfMrbRcr		: time;
	xcmfRdWrSkewEfb		: time;
	xcmfRdWrSkewHfb		: time;
	xcmfRdWrSkewPafeb	: time;
	xcmfDoutRegReWthHi	: time;
	xcmfDoutRegReRcr	: time;

	xcmfClkWr2FlagOut	: time;		-- applied parameters
	xcmfClkRd2FlagOut	: time;
	xcmfMrb2Output		: time;
	xcmfClock2Dout		: time;
	xcmfReset2Dout		: time);
    port (
	din		: in	std_logic_vector(7 downto 0);
	dout		: inout	std_logic_vector(7 downto 0);
	enr		: in	std_logic;            
	enw		: in	std_logic;            
	ckr		: in	std_logic;
	ckw		: in	std_logic;
	mrb		: in	std_logic := '1';            
	efb		: inout	std_logic;
	hfb		: inout	std_logic;
	pafeb		: out	std_logic);
end c39kcf;

architecture sim of c39kcf is

    signal full		: std_logic := '1';
    signal empt		: std_logic := '0';
    signal half		: std_logic := '0';
    signal pafl		: std_logic := '1';
    signal paem		: std_logic := '0';

    -- Signals for use with negative setup and hold checks
    signal d_din	: std_logic_vector(7 downto 0);
    signal d_dckw	: std_logic;
    signal d_enr	: std_logic;
    signal e_dckr	: std_logic;
    signal d_enw	: std_logic;
    signal e_dckw	: std_logic;
    signal r_efb	: std_logic;
    signal f_dckr	: std_logic;
    signal r_hfb	: std_logic;
    signal h_dckr	: std_logic;
    signal w_efb	: std_logic;
    signal f_dckw	: std_logic;
    signal w_hfb	: std_logic;
    signal h_dckw	: std_logic;

    -- Constants for use with negative setup and hold checks
    constant DataSetup	: time := timeAdjust(xcmfDinAtClkWrSetup);
    constant DataHold	: time := timeAdjust(xcmfDinAtClkWrHold);
    constant EnSetup	: time := timeAdjust(xcmfEnxAtClockSetup);
    constant EnHold	: time := timeAdjust(xcmfEnxAtClockHold);
    constant fflgSetupR	: time := timeAdjust(xcmfEfbInAtClkRdSetup);
    constant hflgSetupR	: time := timeAdjust(xcmfHfbInAtClkRdSetup);
    constant fflgHoldR	: time := timeAdjust(xcmfEfbInAtClkRdHold);
    constant hflgHoldR	: time := timeAdjust(xcmfHfbInAtClkRdHold);
    constant fflgSetupW	: time := timeAdjust(xcmfEfbInAtClkWrSetup);
    constant hflgSetupW	: time := timeAdjust(xcmfHfbInAtClkWrSetup);
    constant fflgHoldW	: time := timeAdjust(xcmfEfbInAtClkWrHold);
    constant hflgHoldW	: time := timeAdjust(xcmfHfbInAtClkWrHold);

    constant unk	: string := " Setting output unknown.";

    signal ckrerr	: std_logic;
    constant read_high		: string :=
    "Read clock high width violation:"	& unk;
    constant read_low		: string :=
    "Read clock low width violation:"	& unk;
    constant read_cycle		: string :=
    "Read clock cycle width violation:"	& unk;

    signal ckwerr	: std_logic;
    constant write_high		: string :=
    "Write clock high width violation:"	& unk;
    constant write_low		: string :=
    "Write clock low width violation:"	& unk;
    constant write_cycle	: string :=
    "Write clock cycle width violation:"& unk;

    signal wdserr	: std_logic;
    constant writedata_setup	: string :=
    "Write data setup violation:"	& unk;

    signal wdherr	: std_logic;
    constant writedata_hold	: string :=
    "Write data hold violation:"	& unk;

    signal enrserr	: std_logic;
    constant readen_setup	: string :=
    "Read enable setup violation:"	& unk;

    signal enrherr	: std_logic;
    constant readen_hold	: string :=
    "Read enable hold violation:"	& unk;

    signal enwserr	: std_logic;
    constant writeen_setup	: string :=
    "Write enable setup violation:"	& unk;

    signal enwherr	: std_logic;
    constant writeen_hold	: string :=
    "Write enable hold violation:"	& unk;

    signal rrcverr	: std_logic;
    constant readreset_rcvry	: string :=
    "Read reset recovery violation:"	& unk;

    signal wrcverr	: std_logic;
    constant writereset_rcvry	: string :=
    "Write reset recovery violation:"	& unk;

    signal mrberr	: std_logic;
    constant reset_width	: string :=
    "Reset width violation:"		& unk;

    constant write2read_skew1	: string :=
    "Write to read skew insufficient for current cycle empty/full update.";
    constant write2read_skew2	: string :=
    "Write to read skew insufficient for current cycle almost empty update.";
    constant read2write_skew2	: string :=
    "Read to write skew insufficient for current cycle half full update.";
    constant read2write_skew3	: string :=
    "Read to write skew insufficient for current cycle almost full update.";

    signal refserr	: std_logic;
    constant refflag_setup	: string :=
    "Read clock to E/F flag setup violation.";

    signal refherr	: std_logic;
    constant refflag_hold	: string :=
    "E/F flag to read clock hold violation.";

    signal rhfserr	: std_logic;
    constant rhfflag_setup	: string :=
    "Read clock to H/F flag setup violation.";

    signal rhfherr	: std_logic;
    constant rhfflag_hold	: string :=
    "H/F flag to read clock hold violation.";

    signal wefserr	: std_logic;
    constant wefflag_setup	: string :=
    "Write clock to E/F flag setup violation.";

    signal wefherr	: std_logic;
    constant wefflag_hold	: string :=
    "E/F flag to write clock hold violation.";

    signal whfserr	: std_logic;
    constant whfflag_setup	: string :=
    "Write clock to H/F flag setup violation.";

    signal whfherr	: std_logic;
    constant whfflag_hold	: string :=
    "H/F flag to write clock hold violation.";

begin

    -- check read clock cycle, high and low times.
    process (ckr)
        variable clkhi, clklo : time := 0 ns;
    begin
	if (ckr = '0') then
	    if ((clkhi /= 0 ns) AND ((NOW-clkhi) < xcmfClockWthHi)) then
		assert (false)
		    report read_high
		    severity warning;
		ckrerr <= '1';
		ckrerr <= transport '0' AFTER 1 ns;
	    end if;
	    clklo := NOW;
	elsif (ckr = '1') then
	    if ((clklo /= 0 ns) AND ((NOW-clklo) < xcmfClockWthLo)) then
	       assert (false)
		    report read_low
		    severity warning;
		ckrerr <= '1';
		ckrerr <= transport '0' AFTER 1 ns;
	    end if;
	    if ((clkhi /= 0 ns) AND ((NOW-clkhi) < xcmfClockWthCy)) then
		assert (false)
		    report read_cycle
		    severity warning;
		ckrerr <= '1';
		ckrerr <= transport '0' AFTER 1 ns;
	    end if;
	    clkhi := NOW;
	end if;
    end process;

    -- check write clock cycle, high and low times.
    process (ckw)
        variable clkhi, clklo : time := 0 ns;
    begin
	if (ckw = '0') then
	    if ((clkhi /= 0 ns) AND ((NOW-clkhi) < xcmfClockWthHi)) then
		assert (false)
		    report write_high
		    severity warning;
		ckwerr <= '1';
		ckwerr <= transport '0' AFTER 1 ns;
	    end if;
	    clklo := NOW;
	elsif (ckw = '1') then
	    if ((clklo /= 0 ns) AND ((NOW-clklo) < xcmfClockWthLo)) then
	       assert (false)
		    report write_low
		    severity warning;
		ckwerr <= '1';
		ckwerr <= transport '0' AFTER 1 ns;
	    end if;
	    if ((clkhi /= 0 ns) AND ((NOW-clkhi) < xcmfClockWthCy)) then
		assert (false)
		    report write_cycle
		    severity warning;
		ckwerr <= '1';
		ckwerr <= transport '0' AFTER 1 ns;
	    end if;
	    clkhi := NOW;
	end if;
    end process;

    -- check write data setup
    d_dckw <= ckw after DataSetup;
    process (din, d_dckw)
    	variable din_ev : time := 0 ns;
    begin
	if (rising_edge(d_dckw)) then
	    if ((din_ev /= 0 ns) AND
		    ((NOW-din_ev) < xcmfDinAtClkWrSetup + DataSetup)) then
		assert (false)
		    report writedata_setup
		    severity warning;
		wdserr <= '1';
		wdserr <= transport '0' AFTER 1 ns;
	    end if;
	elsif (din'event) then
	    din_ev := NOW;
	end if;
    end process;

    -- check write data hold
    d_din <= din after DataHold;
    process (d_din, ckw)
    	variable clk_ev : time := 0 ns;
    begin
	if (rising_edge(ckw)) then
	    clk_ev := NOW;
	elsif (d_din'event) then
	    if ((clk_ev /= 0 ns) AND
		    ((NOW-clk_ev) < xcmfDinAtClkWrHold + DataHold)) then
		assert (false)
		    report writedata_hold
		    severity warning;
		wdherr <= '1';
		wdherr <= transport '0' AFTER 1 ns;
	    end if;
	end if;
    end process;

    -- check read enable setup
    e_dckr <= ckr after EnSetup;
    process (enr, e_dckr)
    	variable enr_ev : time := 0 ns;
    begin
	if (rising_edge(e_dckr)) then
	    if ((enr_ev /= 0 ns) AND
		    ((NOW-enr_ev) < xcmfEnxAtClockSetup + EnSetup)) then
		assert (false)
		    report readen_setup
		    severity warning;
		enrserr <= '1';
		enrserr <= transport '0' AFTER 1 ns;
	    end if;
	elsif (enr'event) then
	    enr_ev := NOW;
	end if;
    end process;

    -- check read enable hold
    d_enr <= enr after EnHold;
    process (d_enr, ckr)
    	variable clk_ev : time := 0 ns;
    begin
	if (rising_edge(ckr)) then
	    clk_ev := NOW;
	elsif (d_enr'event) then
	    if ((clk_ev /= 0 ns) AND
		    ((NOW-clk_ev) < xcmfEnxAtClockHold + EnHold)) then
		assert (false)
		    report readen_hold
		    severity warning;
		enrherr <= '1';
		enrherr <= transport '0' AFTER 1 ns;
	    end if;
	end if;
    end process;

    -- check write enable setup
    e_dckw <= ckw after EnSetup;
    process (enw, e_dckw)
    	variable enw_ev : time := 0 ns;
    begin
	if (rising_edge(e_dckw)) then
	    if ((enw_ev /= 0 ns) AND
		    ((NOW-enw_ev) < xcmfEnxAtClockSetup + EnSetup)) then
		assert (false)
		    report writeen_setup
		    severity warning;
		enwserr <= '1';
		enwserr <= transport '0' AFTER 1 ns;
	    end if;
	elsif (enw'event) then
	    enw_ev := NOW;
	end if;
    end process;

    -- check write enable hold
    d_enw <= enw after EnHold;
    process (d_enw, ckw)
    	variable clk_ev : time := 0 ns;
    begin
	if (rising_edge(ckw)) then
	    clk_ev := NOW;
	elsif (d_enw'event) then
	    if ((clk_ev /= 0 ns) AND
		    ((NOW-clk_ev) < xcmfEnxAtClockHold + EnHold)) then
		assert (false)
		    report writeen_hold
		    severity warning;
		enwherr <= '1';
		enwherr <= transport '0' AFTER 1 ns;
	    end if;
	end if;
    end process;

    -- check reset width
    process (mrb)
        variable mrblo : time := 0 ns;
    begin
	if (mrb = '0') then
	    mrblo := NOW;
	else
	    if ((mrblo /= 0 ns) AND ((NOW-mrblo) < xcmfMrbWthLo)) then
		assert (false)
		    report reset_width
		    severity warning;
		mrberr <= '1';
		mrberr <= transport '0' AFTER 1 ns;
	    end if;
	end if;
    end process;

    -- check read reset recovery
    process (mrb, ckr)
        variable mrblastev, ckrlastev    : time := 0 ns;
    begin
	if (mrb'event) then
	    mrblastev := NOW;
	end if;
	if ((mrb = '1') AND rising_edge(ckr)) then
	    if ((mrblastev /= 0 ns) AND ((NOW-mrblastev) < xcmfMrbRcr)) then
		assert (false)
		    report readreset_rcvry
		    severity warning;
		rrcverr <= '1';
		rrcverr <= transport '0' AFTER 1 ns;
	    end if;
	    ckrlastev := NOW;
	end if;
    end process;

    -- check write reset recovery
    process (mrb, ckw)
        variable mrblastev, ckwlastev    : time := 0 ns;
    begin
	if (mrb'event) then
	    mrblastev := NOW;
	end if;
	if ((mrb = '1') AND rising_edge(ckw)) then
	    if ((mrblastev /= 0 ns) AND ((NOW-mrblastev) < xcmfMrbRcr)) then
		assert (false)
		    report writereset_rcvry
		    severity warning;
		wrcverr <= '1';
		wrcverr <= transport '0' AFTER 1 ns;
	    end if;
	    ckwlastev := NOW;
	end if;
    end process;

    -- check E/F flag to read clock setup
    f_dckr <= ckr after fflgSetupR;
    process (f_dckr, efb)
	variable efb_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(f_dckr)) then
		if ((efb_ev /= 0 ns) AND
			((NOW-efb_ev) < xcmfEfbInAtClkRdSetup + fflgSetupR))then
		    assert (false)
			report refflag_setup
			severity warning;
		    refserr <= '1';
		    refserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (efb'event) then
		efb_ev := NOW;
	    end if;
	end if;
    end process;

    -- check H/F flag to read clock setup
    h_dckr <= ckr after hflgSetupR;
    process (h_dckr, hfb)
	variable hfb_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(h_dckr)) then
		if ((hfb_ev /= 0 ns) AND
			((NOW-hfb_ev) < xcmfHfbInAtClkRdSetup + hflgSetupR))then
		    assert (false)
			report rhfflag_setup
			severity warning;
		    rhfserr <= '1';
		    rhfserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (hfb'event) then
		hfb_ev := NOW;
	    end if;
	end if;
    end process;

    -- check E/F flag to read clock hold
    r_efb <= efb after fflgHoldR;
    process (ckr, r_efb)
	variable clk_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(ckr)) then
		clk_ev := NOW;
	    elsif (r_efb'event) then
		if ((clk_ev /= 0 ns) AND
			((NOW-clk_ev) < xcmfEfbInAtClkRdHold + fflgHoldR)) then
		    assert (false)
			report refflag_hold
			severity warning;
		    refherr <= '1';
		    refherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check H/F flag to read clock hold
    r_hfb <= hfb after hflgHoldR;
    process (ckr, r_hfb)
	variable clk_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(ckr)) then
		clk_ev := NOW;
	    elsif (r_hfb'event) then
		if ((clk_ev /= 0 ns) AND
			((NOW-clk_ev) < xcmfHfbInAtClkRdHold + hflgHoldR)) then
		    assert (false)
			report rhfflag_hold
			severity warning;
		    rhfherr <= '1';
		    rhfherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check E/F flag to write clock setup
    f_dckw <= ckw after fflgSetupW;
    process (f_dckw, efb)
	variable efb_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(f_dckw)) then
		if ((efb_ev /= 0 ns) AND
			((NOW-efb_ev) < xcmfEfbInAtClkWrSetup + fflgSetupW))then
		    assert (false)
			report wefflag_setup
			severity warning;
		    wefserr <= '1';
		    wefserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (efb'event) then
		efb_ev := NOW;
	    end if;
	end if;
    end process;


    -- check H/F flag to write clock setup
    h_dckw <= ckw after hflgSetupW;
    process (h_dckw, hfb)
	variable hfb_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(h_dckw)) then
		if ((hfb_ev /= 0 ns) AND
			((NOW-hfb_ev) < xcmfHfbInAtClkWrSetup + hflgSetupW))then
		    assert (false)
			report whfflag_setup
			severity warning;
		    whfserr <= '1';
		    whfserr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (hfb'event) then
		hfb_ev := NOW;
	    end if;
	end if;
    end process;

    -- check E/F flag to write clock hold
    w_efb <= efb after fflgHoldW;
    process (ckw, w_efb)
	variable clk_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(ckw)) then
		clk_ev := NOW;
	    elsif (w_efb'event) then
		if ((clk_ev /= 0 ns) AND
			((NOW-clk_ev) < xcmfEfbInAtClkWrHold + fflgHoldW)) then
		    assert (false)
			report wefflag_hold
			severity warning;
		    wefherr <= '1';
		    wefherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;
    
    -- check H/F flag to write clock hold
    w_hfb <= hfb after hflgHoldW;
    process (ckw, w_hfb)
	variable clk_ev : time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "10") then
	    if (rising_edge(ckw)) then
		clk_ev := NOW;
	    elsif (hfb'event) then
		if ((clk_ev /= 0 ns) AND
			((NOW-clk_ev) < xcmfHfbInAtClkWrHold + hflgHoldW)) then
		    assert (false)
			report whfflag_hold
			severity warning;
		    whfherr <= '1';
		    whfherr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check the skews between read and write for setting the flags
    process (ckr, ckw)
    	variable ckr_re	: time := 0 ns;
    	variable ckw_re	: time := 0 ns;
    begin
	if (cfgbits(1 downto 0) = "01") then
	    if (rising_edge(ckr)) then
		ckr_re := NOW;
	    end if;
	    if (rising_edge(ckw)) then
		ckw_re := NOW;
	    end if;

	    if (rising_edge(ckr) AND (mrb = '1')) then
		-- empty
		if (((NOW-ckw_re) < xcmfRdWrSkewEfb) AND (efb = '0')) then
		    assert (false)
			report write2read_skew1
			severity note;
		end if;
		-- programmable empty
		if (((NOW-ckw_re) < xcmfRdWrSkewPafeb) AND (paem = '0')) then
		    assert (false)
			report write2read_skew2
			severity note;
		end if;
	    end if;

	    if (rising_edge(ckw) AND (mrb = '1')) then
		-- full
		if (((NOW-ckr_re) < xcmfRdWrSkewHfb) AND (hfb = '0')) then
		    assert (false)
			report read2write_skew2
			severity note;
		end if;
		-- programmable full
		if (((NOW-ckr_re) < xcmfRdWrSkewPafeb) AND (pafl = '0')) then
		    assert (false)
			report read2write_skew3
			severity note;
		end if;
	    end if;
	end if;
    end process;

    -- simulate the fifo operations
    process (mrb, ckw, ckr, 
		ckwerr, enwserr, enwherr, mrberr, wrcverr,
		ckrerr, wdserr, wdherr, enrserr, enrherr, rrcverr)
	variable dtmp	: std_logic_vector(7 downto 0);
	variable dierr	: std_logic_vector(7 downto 0);
	variable doerr	: std_logic_vector(7 downto 0);
	variable wadd 	: natural := 0;
	variable radd	: natural := 0;
	variable idx	: natural := 0;
	variable top	: natural := 0;
	variable wadr	: natural;
	variable radr	: natural;
	variable mem	: chmem := memdata;
    begin

	case cfgbits(3 downto 2) is
	when "00" =>
	    top  := 512;
	when "01" =>
	    top  := 1024;
	    wadr := (wadd mod 2)*4;
	    radr := (radd mod 2)*4;
	when "10" =>
	    top  := 2048;
	    wadr := (wadd mod 4)*2;
	    radr := (radd mod 4)*2;
	when "11" =>
	    top  := 4096;
	    wadr := (wadd mod 8);
	    radr := (radd mod 8);
	end case;

	-- Condition input with errors
	if ((ckwerr OR enwserr OR enwherr OR mrberr OR wrcverr
					    OR wdserr OR wdherr) = '1') then
	    dierr := (others => 'X');
	else
	    dierr := din;
	end if;

	if (mrb = '0') then
	    idx  := 0;
	    wadd := 0;
	    radd := 0;
	    doerr := (others => '0');
	else
	    case cfgbits(1 downto 0) is
	    when "01" =>
		if (rising_edge(ckw)) then
		    if ((idx < top) AND (enw = '1')) then
			idx := idx+1;
			case cfgbits(3 downto 2) is
			when "00" =>
			    mem(wadd) := dierr;
			when "01" =>
			    mem(wadd/2)(wadr+3 downto wadr):= dierr(3 downto 0);
			when "10" =>
			    mem(wadd/4)(wadr+1 downto wadr):= dierr(1 downto 0);
			when "11" =>
			    mem(wadd/8)(wadr) := dierr(0);
			end case;
			wadd := wadd + 1;
			if (wadd >= top) then
			    wadd := 0;
			end if;
		    end if;
		end if;
		if (rising_edge(ckr)) then
		    if ((idx > 0) AND (enr = '1')) then
			idx := idx-1;
			doerr := (others => '0');
			case cfgbits(3 downto 2) is
			when "00" =>
			    doerr := mem(radd);
			when "01" =>
			    doerr(3 downto 0):= mem(radd/2)(radr+3 downto radr);
			when "10" =>
			    doerr(1 downto 0):= mem(radd/4)(radr+1 downto radr);
			when "11" =>
			    doerr(0) := mem(radd/8)(radr);
			end case;
			radd := radd + 1;
			if (radd >= top) then
			    radd := 0;
			end if;
		    end if;
		end if;
	    when "10" =>
		if (rising_edge(ckw)) then
		    if (NOT((efb = '0') AND (hfb = '0')) AND (enw = '1')) then
			case cfgbits(3 downto 2) is
			when "00" =>
			    mem(wadd) := dierr;
			when "01" =>
			    mem(wadd/2)(wadr+3 downto wadr):= dierr(3 downto 0);
			when "10" =>
			    mem(wadd/4)(wadr+1 downto wadr):= dierr(1 downto 0);
			when "11" =>
			    mem(wadd/8)(wadr) := dierr(0);
			end case;
			wadd := wadd + 1;
			if (wadd >= top) then
			    wadd := 0;
			end if;
		    end if;
		end if;
		if (rising_edge(ckr)) then
		    if (NOT((efb = '0') AND (hfb = '1')) AND (enr = '1')) then
			doerr := (others => '0');
			case cfgbits(3 downto 2) is
			when "00" =>
			    doerr := mem(radd);
			when "01" =>
			    doerr(3 downto 0):= mem(radd/2)(radr+3 downto radr);
			when "10" =>
			    doerr(1 downto 0):= mem(radd/4)(radr+1 downto radr);
			when "11" =>
			    doerr(0) := mem(radd/8)(radr);
			end case;
			radd := radd + 1;
			if (radd >= top) then
			    radd := 0;
			end if;
		    end if;
		end if;
	    when others =>
	    	null;
	    end case;
	end if;

	-- Condition output with errors and the reset
	if ((ckrerr OR enrserr OR enrherr OR mrberr OR rrcverr) = '1') then
	    dtmp := (others => 'X');
	else
	    dtmp := doerr;
	end if;

	if (mrb'event) then
	    dout <= dtmp after xcmfReset2Dout;
	else
	    dout <= dtmp after xcmfClock2Dout;
	end if;

	case cfgbits(1 downto 0) is
	when "01" =>
	    if (mrb'event AND (mrb = '0')) then
		empt <= '0' after xcmfMrb2Output;
		paem <= '0' after xcmfMrb2Output;
		half <= '1' after xcmfMrb2Output;
		full <= '1' after xcmfMrb2Output;
		pafl <= '1' after xcmfMrb2Output;
	    else
		if (rising_edge(ckr)) then
		    if (idx <= 0) then
			empt <= '0' after xcmfClkRd2FlagOut;
		    else
			empt <= '1' after xcmfClkRd2FlagOut;
		    end if;
		    if (idx >= top/2) then
			half <= '0' after xcmfClkWr2FlagOut;
		    else
			half <= '1' after xcmfClkWr2FlagOut;
		    end if;
		    if (((idx <= to_integer(cfgbits(45 downto 35))) AND
							(top = 4096)) OR 
			((idx <= to_integer(cfgbits(45 downto 36))) AND
							(top = 2048)) OR 
			((idx <= to_integer(cfgbits(45 downto 37))) AND
							(top = 1048)) OR 
			((idx <= to_integer(cfgbits(45 downto 38))) AND
							(top =  512))) then
			paem <= '0' after xcmfClkRd2FlagOut;
		    else
			paem <= '1' after xcmfClkRd2FlagOut;
		    end if;
		end if;

		if (rising_edge(ckw)) then
		    if (idx >= top) then
			full <= '0' after xcmfClkWr2FlagOut;
		    else
			full <= '1' after xcmfClkWr2FlagOut;
		    end if;
		    if (idx >= top/2) then
			half <= '0' after xcmfClkWr2FlagOut;
		    else
			half <= '1' after xcmfClkWr2FlagOut;
		    end if;
		    if (((top-idx <= to_integer(cfgbits(45 downto 35))) AND
							(top = 4096)) OR 
			((top-idx <= to_integer(cfgbits(45 downto 36))) AND
							(top = 2048)) OR 
			((top-idx <= to_integer(cfgbits(45 downto 37))) AND
							(top = 1048)) OR 
			((top-idx <= to_integer(cfgbits(45 downto 38))) AND
							(top =  512))) then
			pafl <= '0' after xcmfClkWr2FlagOut;
		    else
			pafl <= '1' after xcmfClkWr2FlagOut;
		    end if;
		end if;
	    end if;
	when others  =>
	    null;
	end case;
    end process;

    process (half, full, empt, pafl, paem)
    begin
	case cfgbits(1 downto 0) is
	when "01" =>
	    hfb   <= half;
	    efb   <= full AND empt;
	    pafeb <= pafl AND paem AND full AND empt;
	when others  =>
	    hfb	<= 'Z';
	    efb	<= 'Z';
	end case;
    end process;

end sim;
