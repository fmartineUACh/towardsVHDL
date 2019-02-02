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

entity c39kmc is
    generic (
	cfgbits	: Bit_Vector(11 downto 0);
	xlbRegSetup	: time;		-- checked parameters
	xlbRegHold	: time;
	xlbRegCkWthHi	: time;
	xlbRegCkWthLo	: time;
	xlbRegCkWthCy	: time;
	xlbRegPrRcr	: time;
	xlbRegPrWthHi	: time;
	xlbRegReRcr	: time;
	xlbRegReWthHi	: time;
	xlbSelin2Selout	: time;		-- applied parameters
	xlbCpt2Selout	: time;
	xlbCpt2RegD	: time;
	xlbEqn2RegD	: time;
	xlbSelin2RegD	: time;
	xlbRegQ2RegD	: time;
	xlbRegD2ToPim	: time;
	xlbRegCk2ToPim	: time;
	xlbRegPr2ToPim	: time;
	xlbRegRe2ToPim	: time);
    port (
	selin	: in	std_logic;
	cpt	: in	std_logic_vector(1 downto 0);
	set	: in	std_logic;
	clr	: in	std_logic;
	clk	: in	std_logic;
	din	: in	std_logic;
	selout	: out	std_logic;
	qout	: out	std_logic);
end c39kmc;

architecture sim of c39kmc is

    signal qp		: std_logic := '0';
    signal qn		: std_logic := '1';
    signal cmxout,c3	: std_logic;
    signal regd		: std_logic;
    signal xorin	: std_logic_vector(1 downto 0);
    signal dclk		: std_logic;
    signal dregd	: std_logic;

    constant dataSetup	: time := timeAdjust(xlbRegSetup);
    constant dataHold	: time := timeAdjust(xlbRegHold);
    constant unk	: string := " Setting output unknown.";

    signal clkerr	: std_logic;
    constant clk_high		: string :=
    "Clock high width violation:"	& unk;
    constant clk_low		: string :=
    "Clock low width violation:"	& unk;
    constant clk_cycle		: string :=
    "Clock cycle width violation:"	& unk;

    signal stuperr	: std_logic;
    constant data_setup		: string :=
    "Data to clock setup violation:"	& unk;

    signal holderr	: std_logic;
    constant data_hold		: string :=
    "Clock to data hold violation:"	& unk;

    signal clrerr	: std_logic;
    constant reset_width	: string :=
    "Reset width violation:"		& unk;

    signal crcverr	: std_logic;
    constant reset_rcvry	: string :=
    "Reset recovery violation:"		& unk;

    signal seterr	: std_logic;
    constant preset_width	: string :=
    "Preset width violation:"		& unk;

    signal srcverr	: std_logic;
    constant preset_rcvry	: string :=
    "Preset recovery violation:"	& unk;

begin

    -- check clk cycle, high and low times.
    process (clk)
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(11) = '1') then
	    if (clk = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xlbRegCkWthHi)) then
		    assert (false)
			report clk_high
			severity warning;
		    clkerr <= '1';
		    clkerr <= transport '0' AFTER 1 ns;
		end if;
		clklo := NOW;
	    elsif (clk = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xlbRegCkWthLo)) then
		   assert (false)
			report clk_low
			severity warning;
		    clkerr <= '1';
		    clkerr <= transport '0' AFTER 1 ns;
		end if;
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xlbRegCkWthCy)) then
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

    -- check setup
    dclk <= clk after dataSetup;
    process (regd, dclk)
    	variable dataev : time := 0 ns;
    begin
    	if (cfgbits(11) = '1') then
	    if ((clr = '0') AND (set = '0') AND rising_edge(dclk)) then
		if ((dataev/=0 ns) AND ((NOW-dataev)<xlbRegSetup+dataSetup))then
		    assert (false)
			report data_setup
			severity warning;
		    stuperr <= '1'; 
		    stuperr <= transport '0' AFTER 1 ns;
		end if;
	    elsif (regd'event) then
	    	dataev := NOW;
	    end if;
	end if;
    end process;

    -- check hold
    dregd <= regd after dataHold;
    process (dregd, clk)
    	variable clckev : time := 0 ns;
    begin
    	if (cfgbits(11) = '1') then
	    if ((clr = '0') AND (set = '0') AND rising_edge(clk)) then
	    	clckev := NOW;
	    elsif (dregd'event) then
		if ((clckev/=0 ns) AND ((NOW-clckev)<xlbRegHold+dataHold)) then
		    assert (false)
			report data_hold
			severity warning;
		    holderr <= '1'; 
		    holderr <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	end if;
    end process;

    -- check reset recovery and reset width
    process (clr, clk)
        variable clrlastev, clklastev, clrhi : time := 0 ns;
    begin
        if (cfgbits(11) = '1') then
            if (clr'event) then
                clrlastev := NOW;
                if (clr = '1') then
                    clrhi := NOW;
                else
                    if NOT ((clrhi=0 ns) OR ((NOW-clrhi) >= xlbRegReWthHi)) then
                        assert (false)
                            report reset_width
                            severity warning;
                        clrerr <= '1'; 
                        clrerr <= transport '0' AFTER 1 ns;
                    end if;
                end if;
            end if;
            if ((clr = '0') AND rising_edge(clk)) then
                if NOT((clrlastev=0 ns) OR ((NOW-clrlastev)>=xlbRegReRcr)) then
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

    -- check preset recovery and preset width
    process (set, clk)
        variable setlastev, clklastev, sethi : time := 0 ns;
    begin
        if (cfgbits(11) = '1') then
            if (set'event) then
                setlastev := NOW;
                if (set = '1') then
                    sethi := NOW;
                else
                    if NOT ((sethi=0 ns) OR ((NOW-sethi) >= xlbRegPrWthHi)) then
                        assert (false)
                            report preset_width
                            severity warning;
                        seterr <= '1'; 
                        seterr <= transport '0' AFTER 1 ns;
                    end if;
                end if;
            end if;
            if ((set = '0') AND rising_edge(clk)) then
                if NOT((setlastev=0 ns) OR ((NOW-setlastev)>=xlbRegPrRcr)) then
                    assert (false)
			report preset_rcvry
                        severity warning;
                    srcverr <= '1';
                    srcverr <= transport '0' AFTER 1 ns;
                end if;
                clklastev := NOW;
            end if;
        end if;
    end process;

    -- generate selout and carry chain mux output
    process (cpt, selin)
    begin
	if (cfgbits(2) = '0') then
	    selout <= cpt(0) after xlbCpt2Selout;
	    cmxout <= cpt(0) after xlbCpt2RegD;
    	elsif ( selin'event AND (selin = '0')) then
	    selout <= transport     cpt(0) after xlbSelin2Selout;
	    cmxout <= transport     cpt(0) after xlbSelin2RegD;
    	elsif ( selin'event AND (selin = '1')) then
	    selout <= transport NOT cpt(1) after xlbSelin2Selout;
	    cmxout <= transport NOT cpt(1) after xlbSelin2RegD;
    	elsif (cpt(0)'event AND (selin = '0')) then
	    selout <= transport     cpt(0) after xlbCpt2Selout;
	    cmxout <= transport     cpt(0) after xlbCpt2RegD;
    	elsif (cpt(1)'event AND (selin = '1')) then
	    selout <= transport NOT cpt(1) after xlbCpt2Selout;
	    cmxout <= transport NOT cpt(1) after xlbCpt2RegD;
	end if;
    end process;

    -- generate the XOR inputs
    c3 <= '1' when cfgbits(3) = '1' else '0';

    with cfgbits(1 downto 0) select
    	xorin(1) <= qp after xlbRegQ2RegD when "00",
		qn after xlbRegQ2RegD when "01",
		cmxout when "10",
		c3 when "11";

    xorin(0) <= din after xlbEqn2RegD;

    -- generate the "D" input
    regd  <= xorin(1) XOR xorin(0);

    -- generate the register
    process (set,clr,clk,regd,qp,
		stuperr,holderr,crcverr,srcverr,seterr,clrerr,clkerr)
    begin
    	if (cfgbits(11) = '1') then
	    if    (clr = '1') then
		qp <=      '0' after xlbRegRe2ToPim;
		qn <=      '1' after xlbRegRe2ToPim;
	    elsif (set = '1') then
		qp <=      '1' after xlbRegPr2ToPim;
		qn <=      '0' after xlbRegPr2ToPim;
	    elsif(stuperr='1' OR holderr='1' OR crcverr='1' OR srcverr='1' OR
		   seterr='1' OR clrerr='1'  OR clkerr='1') then
	    	qp <=      'X' after xlbRegCk2ToPim;
	    	qn <=      'X' after xlbRegCk2ToPim;
	    elsif (rising_edge(clk)) then
		qp <=     regd after xlbRegCk2ToPim;
		qn <= NOT regd after xlbRegCk2ToPim;
	    end if;
	    qout <= qp;
	else
	    qout <= regd after xlbRegD2ToPim;
	end if;
    end process;

end sim;
