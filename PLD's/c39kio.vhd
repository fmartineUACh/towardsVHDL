--------------------------------------------------------------------------------
--
--              Copyright Cypress Semiconductor		1999
--              Protected as an unpublished work.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c39kp.all;

entity c39kio is
    generic (
	cfgbits			: Bit_Vector(35 downto 0);
	xioClockWthHi		: time;		-- Checked parameters
	xioClockWthLo		: time;
	xioClockWthCy		: time;
	xioResetRcr		: time;
	xioResetWthHi		: time;
	xioIoRegSetup		: time;
	xioIoRegHold		: time;
	xioIoRegEnSup		: time;
	xioIoRegEnHld		: time;
	xioOeRegSetup		: time;
	xioOeRegHold		: time;
	xioFromChip2Pin		: time;		-- applied parameters
	xioFromChip2IoRegD	: time;
	xioIoRegCk2Pin		: time;
	xioIoRegRe2Pin		: time;
	xioIoRegRe2ToChip	: time;
	xioOeRegCk2PinEA	: time;
	xioOeRegCk2PinER	: time;
	xioOeRegRe2PinER	: time;
	xioOutEna2PinEA		: time;
	xioOutEna2PinER		: time;
	xioPin2IoRegD		: time;
	xioIoRegCk2ToChip	: time;		-- May be Vert or Hori
	xioPin2ToChip		: time;		-- May be Vert or Hori
	xioAddOslow		: time;
	xioAddEAslow		: time;
	xioAddERslow		: time;
	xioAdd			: time);
    -- xioAdd is the delay added by bus hold and any IO standard.
    port (
	oe	: in	std_logic;
	din	: in	std_logic;
	en	: in	std_logic;
	clk	: in	std_logic;
	clr	: in	std_logic;
	fb	: out	std_logic;
	iop	: inout	std_logic);
end c39kio;

architecture sim of c39kio is

    signal d, qi, qo, q, ena			: std_logic;
    signal iop_01, en_01, oe_01, clr_01		: std_logic;
    signal declk, den, ddclk, dd, doeclk, doe	: std_logic;

    -- Adjust the setup and hold reference times if they are negative.
    constant enSetup	: time := timeAdjust(xioIoRegEnSup);
    constant enHold	: time := timeAdjust(xioIoRegEnHld);
    constant dSetup	: time := timeAdjust(xioIoRegSetup);
    constant dHold	: time := timeAdjust(xioIoRegHold);
    constant oeSetup	: time := timeAdjust(xioOeRegSetup);
    constant oeHold	: time := timeAdjust(xioOeRegHold);

    constant unk	: string := " Setting output unknown.";

    signal clkerr	: std_logic;
    constant clk_high		: string :=
    "Clock high width violation:"		& unk;
    constant clk_low		: string :=
    "Clock low width violation:"		& unk;
    constant clk_cycle		: string :=
    "Clock cycle width violation:"		& unk;

    signal clrerr	: std_logic;
    constant reset_width	: string :=
    "Reset width violation:"			& unk;

    signal crcverr	: std_logic;
    constant reset_rcvry	: string :=
    "Reset recovery violation:"			& unk;

    signal orstuperr	: std_logic;
    constant odata2clk_setup	: string :=
    "Output Data to clock setup violation:"	& unk;

    signal orholderr	: std_logic;
    constant odata2clk_hold	: string :=
    "Clock to output data hold violation:"	& unk;

    signal enstuperr	: std_logic;
    constant enable2clk_setup	: string :=
    "Enable to clock setup violation:"		& unk;

    signal enholderr	: std_logic;
    constant enable2clk_hold	: string :=
    "Clock to enable hold violation:"		& unk;

    signal oestuperr	: std_logic;
    constant oe2clk_setup	: string :=
    "OE to clock setup violation:"		& unk;

    signal oeholderr	: std_logic;
    constant oe2clk_hold	: string :=
    "Clock to OE hold violation:"		& unk;

begin

    -- don't propogate anything except 1, 0, or X.
    oe_01  <= to_X01(oe);
    iop_01 <= to_X01(iop);
    en_01  <= to_X01(en);
    clr_01 <= to_X01(clr);

    -- check clk cycle, high and low times.
    process (clk)
	variable clkhi, clklo : time := 0 ns;
    begin
	if ((cfgbits(2)= '1') OR (cfgbits(3)= '1') OR (cfgbits(17)= '1')) then
	    if (clk = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xioClockWthHi)) then
		    assert (false)
			report clk_high
			severity warning;
		    clkerr <= '1';
		    clkerr <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (clk = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xioClockWthLo)) then
		   assert (false)
			report clk_low
			severity warning;
		    clkerr <= '1';
		    clkerr <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xioClockWthCy)) then
		    assert (false)
			report clk_cycle
			severity warning;
		    clkerr <= '1';
		    clkerr <= transport '0' AFTER 1 ns;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

    -- check reset recovery and reset width
    process (clr_01, clk)
        variable clrlastev, clklastev, clrhi : time := 0 ns;
    begin
	if ((cfgbits(2)= '1') OR (cfgbits(3)= '1') OR (cfgbits(17)= '1')) then
            if (clr_01'event) then
                clrlastev := NOW;
                if (clr_01 = '1') then
                    clrhi := NOW;
                else
                    if NOT ((clrhi=0 ns) OR ((NOW-clrhi) >= xioResetWthHi)) then
                        assert (false)
                            report reset_width
                            severity warning;
                        clrerr <= '1'; 
                        clrerr <= transport '0' AFTER 1 ns;
                    end if;
                end if;
            end if;
            if ((clr_01 = '0') AND rising_edge(clk)) then
                if NOT((clrlastev=0 ns) OR ((NOW-clrlastev)>=xioResetRcr)) then
                    assert (false)
			report reset_rcvry
                        severity warning;
                    crcverr <= '1';
                    crcverr <= transport '0' AFTER 1 ns;
                end if;
                clklastev := NOW;
            end if;
        end if;
    end process;

    -- Enable setup check
    declk <= clk after enSetup;
    process (en_01, declk)
    	variable enevent : time := 0 ns;
    begin
	if ((cfgbits(2) = '1') OR (cfgbits(3) = '1')) then
	    if ((clr_01 = '0') AND rising_edge(declk)) then
		if ((enevent /= 0 ns) AND
		    ((NOW-enevent) < xioIoRegEnSup-enSetup)) then
		    assert (false)
			report enable2clk_setup
			severity warning;
		    enstuperr <= '1'; 
		    enstuperr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (en_01'event) then
		enevent := NOW;
	    end if;
	end if;
    end process;

    -- Enable hold check
    den <= en_01 after enHold;
    process (den, clk)
    	variable clkevent : time := 0 ns;
    begin
	if ((cfgbits(2) = '1') OR (cfgbits(3) = '1')) then
	    if ((clr_01 = '0') AND rising_edge(clk)) then
		clkevent := NOW;
	    elsif (den'event) then
		if ((clkevent /= 0 ns) AND
		    ((NOW-clkevent) < xioIoRegEnHld-enHold)) then
		    assert (false)
			report enable2clk_hold
			severity warning;
		    enholderr <= '1'; 
		    enholderr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- Data setup check
    ddclk <= clk after dSetup;
    process (d, ddclk)
    	variable dataevent : time := 0 ns;
    begin
	if ((cfgbits(2) = '1') OR (cfgbits(3) = '1')) then
	    if ((clr_01='0') AND (en_01='1') AND rising_edge(ddclk)) then
		if ((dataevent /= 0 ns) AND
		    ((NOW-dataevent) < xioIoRegSetup+dSetup)) then
		    assert (false)
			report odata2clk_setup
			severity warning;
		    orstuperr <= '1'; 
		    orstuperr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (d'event) then
		dataevent := NOW;
	    end if;
	end if;
    end process;

    -- Data hold check
    dd <= d after dHold;
    process (dd, clk)
    	variable clkevent : time := 0 ns;
    begin
	if ((cfgbits(2) = '1') OR (cfgbits(3) = '1')) then
	    if ((clr_01='0') AND (en_01='1') AND rising_edge(clk)) then
		clkevent := NOW;
	    elsif (dd'event) then
		if ((clkevent /= 0 ns) AND
		    ((NOW-clkevent) < xioIoRegHold+dHold)) then
		    assert (false)
			report odata2clk_hold
			severity warning;
		    orholderr <= '1'; 
		    orholderr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- OE setup check
    doeclk <= clk after oeSetup;
    process (oe_01, doeclk)
    	variable oeevent : time := 0 ns;
    begin
    	if (cfgbits(17) = '0') then
	    if ((clr_01 = '0') AND rising_edge(doeclk)) then
		if ((oeevent /= 0 ns) AND 
		    ((NOW-oeevent) < xioOeRegSetup+oeSetup)) then
		    assert (false)
			report oe2clk_setup
			severity warning;
		    oestuperr <= '1'; 
		    oestuperr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (oe_01'event) then
		oeevent := NOW;
	    end if;
	end if;
    end process;

    -- OE hold check
    doe <= oe_01 after oeHold;
    process (doe, clk)
    	variable clkevent : time := 0 ns;
    begin
    	if (cfgbits(17) = '0') then
	    -- setup check
	    if ((clr_01 = '0') AND rising_edge(clk)) then
		clkevent := NOW;
	    elsif (doe'event) then
		if ((clkevent /= 0 ns) AND
		    ((NOW-clkevent) < xioOeRegHold+oeHold)) then
		    assert (false)
			report oe2clk_hold
			severity warning;
		    oeholderr <= '1'; 
		    oeholderr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- generate the "D" input
    with cfgbits(1) select
	d <= din    after xioFromChip2IoRegD when '1',
	     iop_01 after xioPin2IoRegD      when '0';

    -- generate the I/O register
    process (d, clr_01, clk, clkerr, crcverr, clrerr,
		enstuperr, enholderr, orstuperr, orholderr)
    begin
	if ((cfgbits(2) = '1') OR (cfgbits(3) = '1')) then
	    if    (clr_01 = '1') then
		qo <= '0' after xioIoRegRe2Pin;
		qi <= '0' after xioIoRegRe2ToChip;
	    elsif  (clkerr='1' OR crcverr='1' OR clrerr='1' OR enstuperr='1'
		    OR enholderr='1' OR orstuperr='1' OR orholderr='1') then
		qo <= 'X' after xioIoRegCk2Pin;
		qi <= 'X' after xioIoRegCk2ToChip;
	    elsif ((en_01 = '1') AND rising_edge(clk)) then
		qo <=  d  after xioIoRegCk2Pin;
		qi <=  d  after xioIoRegCk2ToChip;
	    end if;
	end if;
    end process;

    -- generate the output select muxes
    process (qo, qi, din, iop_01)
    begin
	case cfgbits(3 downto 2) is
	when "00" =>
	    fb <= iop_01 after xioPin2ToChip;
	    q  <= din    after xioFromChip2Pin;
	when "01" =>
	    fb <= qi;
	    q  <= din    after xioFromChip2Pin;
	when "10" =>
	    fb <= iop_01 after xioPin2ToChip;
	    q  <= qo;
	when "11" =>
	    fb <= qi;
	    q  <= qo;
	end case;
    end process;

    -- generate the output enable register
    process (oe_01, clr_01, clk, oestuperr, oeholderr, clkerr, crcverr, clrerr)
    begin
    	if (cfgbits(17) = '1') then		-- not registered
	    if (cfgbits(6) = '0') then
		if (oe_01 = '1') then
		    ena <= oe_01 after xioOutEna2PinEA;
		else
		    ena <= oe_01 after xioOutEna2PinER;
		end if;
	    else
		if (cfgbits(5) = '0') then
		    if (oe_01 = '1') then
			ena <= oe_01 after xioOutEna2PinEA;
		    else
			ena <= oe_01 after xioOutEna2PinER;
		    end if;
		else
		    if (cfgbits(4) = '1') then
			ena <= '0';
		    else
			ena <= '1';
		    end if;
		end if;
	    end if;
	else					-- registered
	    if (clr_01 = '1') then
		ena <= '0' after xioOeRegRe2PinER;
	    elsif  (clkerr='1' OR crcverr='1' OR clrerr='1'
				    OR oestuperr='1' OR oeholderr='1') then
	    	ena <= 'X' after xioOeRegCk2PinER;
	    elsif (rising_edge(clk)) then
		if (oe_01 = '1') then
		    ena <= oe_01 after xioOeRegCk2PinEA;
		else
		    ena <= oe_01 after xioOeRegCk2PinER;
		end if;
	    end if;
	end if;
    end process;

    -- generate the TRI-STATE buffer
    process (ena, q)
    	variable lastout : std_logic := '0';
    begin
    	if (ena'event) then
	    if (ena = '1') then
		if (cfgbits(0) = '1') then
		    iop <=  q  after xioadd + xioAddEAslow;
		else
		    iop <=  q  after xioAdd;
		end if;
		lastout :=  q;
	    elsif (ena = 'X') then
		if (cfgbits(0) = '1') then
		    iop <= 'X' after xioadd + xioAddERslow;
		else
		    iop <= 'X' after xioAdd;
		end if;
	    	lastout := 'X';
	    else
		if (cfgbits(16) = '0') then
		    if    (lastout = 'X') then
			iop <= 'W' after xioAdd;
		    elsif (lastout = '1') then
			iop <= 'H' after xioAdd;
		    else
			iop <= 'L' after xioAdd;
		    end if;
		else
		    iop <= 'Z' after xioAdd;
		end if;
	    end if;
	else
	    if (ena = '1') then
		if (cfgbits(0) = '1') then
		    iop <= q after xioAdd + xioAddOslow;
		else
		    iop <= q after xioAdd;
		end if;
		lastout := q;
	    elsif (ena = 'X') then
	    	iop <= 'X';
	    	lastout := 'X';
	    else
		if (cfgbits(16) = '0') then
		    if    (lastout = 'X') then
			iop <= 'W';
		    elsif (lastout = '1') then
			iop <= 'H';
		    else
			iop <= 'L';
		    end if;
		else
		    iop <= 'Z';
		end if;
	    end if;
	end if;
    end process; 

end sim;
