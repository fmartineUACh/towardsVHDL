--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

library primitive;
use primitive.c37xp.all;

entity c37xoreg is
    generic (
	oregister	: oreg_type	:= dreg;
	source		: src_type	:= src_ptm;

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );

    port (as	: in	vlbit;
	x	: in	vlbit;
	clk	: in	vlbit;
	ar	: in	vlbit;
	fb	: out	vlbit;
	q	: inout	vlbit := '0');

end c37xoreg;

architecture sim of c37xoreg is

    signal	regq_ts		: vlbit	:= '0';
    signal	regq_th		: vlbit	:= '0';
    signal	regq_twh	: vlbit	:= '0';
    signal	regq_twl	: vlbit	:= '0';
    signal	regq_tpw	: vlbit	:= '0';
    signal	regq_tpr	: vlbit	:= '0';
    signal	regq_trr	: vlbit	:= '0';
    signal	regq_trw	: vlbit	:= '0';
    signal	ireg_err	: vlbit	:= '0';
    signal	dclk		: vlbit;

begin

    dclk <= clk;

    -- check for clk setup/hold violations
    process (dclk, x)
	variable xlastev, clklastev	: time := 0 ns;
    begin
	-- only if not combinatorial
	if (oregister /= cmb) then
	    -- setup check
	    if (pchanging(dclk) AND (dclk = '1')) then
		if (source = src_ptm) then

			assert ((xlastev = 0 ns) OR ((NOW - xlastev) >= Torsu))
			    report
			    "Setup ERROR ON X: Setting output to unknown" 
			    severity warning;
			if NOT ((xlastev=0 ns) OR ((NOW-xlastev) >= Torsu)) then
			    regq_ts <= '1'; 
			    regq_ts <= transport '0' AFTER 1 ns;
			end if;

		else		-- Buried macrocell used as input register

			assert ((xlastev = 0 ns) OR ((NOW - xlastev) >= Tirsu))
			    report
			    "Setup ERROR ON X: Setting output to unknown" 
			    severity warning;
			if NOT ((xlastev=0 ns) OR ((NOW-xlastev) >= Tirsu)) then
			    regq_ts <= '1'; 
			    regq_ts <= transport '0' AFTER 1 ns;
			end if;

		end if;
		clklastev := NOW;
	    end if;

	    -- hold check
	    if (pchanging(x)) then
		if (source = src_ptm) then

			assert ((clklastev=0 ns) OR ((NOW - clklastev) >= Torh))
			    report
			    "Hold ERROR ON X: Setting output to unknown" 
			    severity warning;
			if NOT((clklastev=0 ns) OR ((NOW-clklastev)>=Torh)) then
			    regq_th <= '1'; 
			    regq_th <= transport '0' AFTER 1 ns;
			end if;

		else		-- Buried macrocell used as input register

			assert ((clklastev = 0 ns) OR ((NOW-clklastev) >= Tirh))
			    report
			    "Hold ERROR ON X: Setting output to unknown" 
			    severity warning;
			if NOT((clklastev=0 ns) OR ((NOW-clklastev)>=Tirh)) then
			    regq_ts <= '1'; 
			    regq_ts <= transport '0' AFTER 1 ns;
			end if;

		end if;
		xlastev := NOW;
	    end if;
	end if;
    end process;

    -- check clk pulse width
    process (clk)

	variable clklastevhi, clklastevlo : time := 0 ns;

    begin
	-- only if not combinatorial.
	if (oregister /= cmb) then
	    if (clk = '0') then
		assert ((clklastevhi = 0 ns) OR ((NOW - clklastevhi) >= Twh))
		    report
		    "Pulse Width (H) ERROR on CLK: Setting output unknown"
		    severity warning;
		if NOT ((clklastevhi = 0 ns) OR ((NOW-clklastevhi) >= Twh)) then
		    regq_twh <= '1'; 
		    regq_twh <= transport '0' AFTER 1 ns;
		end if;
		clklastevlo := NOW;
	    elsif (clk = '1') then
	       assert ((clklastevlo = 0 ns) OR ((NOW - clklastevlo) >= Twl))
		    report
		    "Pulse Width (L) ERROR on CLK: Setting output unknown"
		    severity warning;
		if NOT ((clklastevlo = 0 ns) OR ((NOW-clklastevlo) >= Twl)) then
		    regq_twl <= '1'; 
		    regq_twl <= transport '0' AFTER 1 ns;
		end if;
		clklastevhi := NOW;
	    end if;
	end if;
    end process;

    -- check RESET minimum pulse width
    process (ar)

	variable arlastev : time := 0 ns;

    begin
	-- only if not combinatorial
	if (oregister /= cmb) then
	    if (ar = '0') then
		assert ((arlastev = 0 ns) OR ((NOW - arlastev) >= Trw))
		    report
		    "Pulse Width ERROR on AR: Setting output to unknown"
		    severity warning;
		if NOT ((arlastev = 0 ns) OR ((NOW - arlastev) >= Trw)) then
		    regq_trw <= '1'; 
		    regq_trw <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	    arlastev := NOW;
	end if;
    end process;

    -- check PRESET minimum pulse width
    process (as)

	variable aslastev : time := 0 ns;

    begin
	-- only if not combinatorial
	if (oregister /= cmb) then
	    if (as = '0') then
		assert ((aslastev = 0 ns) OR ((NOW - aslastev) >= Tpw))
		    report
		    "Pulse Width ERROR on AS: Setting output to unknown"
		    severity warning;
		if NOT ((aslastev = 0 ns) OR ((NOW - aslastev) >= Tpw)) then
		    regq_tpw <= '1'; 
		    regq_tpw <= transport '0' AFTER 1 ns;
		end if;
	    end if;
	    aslastev := NOW;
	end if;
    end process;

    -- check for Asynchronous Reset Recovery violation
    process (dclk, ar)

	variable arlastev, clklastev	: time := 0 ns;

    begin
	-- only if not combinatorial
	if (oregister /= cmb) then
	    if (pchanging(ar)) then
		arlastev := NOW;
	    end if;
	    if (ar = '0') then
		if (pchanging(dclk) AND (dclk = '1')) then
		    assert ((arlastev = 0 ns) OR ((NOW - arlastev) >= Trr))
			report
			"Recovery ERROR on AR: Setting output to unknown" 
			severity warning;
		    if NOT ((arlastev = 0 ns) OR ((NOW - arlastev) >= Trr)) then
			regq_trr <= '1'; 
			regq_trr <= transport '0' AFTER 1 ns;
		    end if;
		    clklastev := NOW;
		end if;
	    end if;
	end if;
    end process;

    -- check for Asynchronous Preset Recovery violation
    process (dclk, as)

	variable aslastev, clklastev	: time := 0 ns;

    begin
	-- only if not combinatorial
	if (oregister /= cmb) then
	    if (pchanging(as)) then
		aslastev := NOW;
	    end if;
	    if (as = '0') then
		if (pchanging(dclk) AND (dclk = '1')) then
		    assert ((aslastev = 0 ns) OR ((NOW - aslastev) >= Tpr))
			report
			"Recovery ERROR on AS: Setting output to unknown" 
			severity warning;
		    if NOT ((aslastev = 0 ns) OR ((NOW - aslastev) >= Tpr)) then
			regq_tpr <= '1'; 
			regq_tpr <= transport '0' AFTER 1 ns;
		    end if;
		    clklastev := NOW;
		end if;
	    end if;
	end if;
    end process;

    -- Simulate the register.
    process (dclk, x, as, ar, regq_ts, regq_th, regq_twl, regq_twh, regq_tpw,
   		 regq_tpr, regq_trr, regq_trw)
    begin
	if (source = src_ptm) then
	    if (oregister = cmb) then
		q <= x AFTER Tocomb;
	    elsif ((regq_ts = '1') OR (regq_th  = '1') OR (regq_twh = '1')
		OR (regq_twl = '1') OR (regq_tpw = '1') OR (regq_tpr = '1')
		OR (regq_trr = '1') OR (regq_trw = '1')) then
		q <= 'X' AFTER Tord;
	    elsif (ar = '1') then
		q <= '0' AFTER Trst;
	    elsif (as = '1') then
		q <= '1' AFTER Tpst;
	    elsif (oregister = oltch) then
		if (pchanging(dclk) AND (dclk = '1')) then
		    q <= x AFTER Tord;
		elsif (dclk = '1') then	
		    q <= x AFTER Tolat;
		end if;
	    elsif (oregister = dreg) then
		if (pchanging(dclk) AND (dclk = '1')) then
		    q <= x AFTER Tord;
		end if;
	    elsif (oregister = treg) then
		if (pchanging(dclk) AND (dclk = '1')) then
		    if (x = '1') then
			q <= not q AFTER Tord;
		    end if;
		end if;
	    end if;
	else			-- Buried macrocell used as input register.
	    assert (oregister /= cmb)
		report
		"Illegal configuration: Configured as input combinatorial"
		severity error;
	    if (oregister = cmb) then
		ireg_err <= '1'; 
		ireg_err <= transport '0' AFTER 1 ns;
	    end if;
	    assert (oregister /= treg)
		report
		"Illegal configuration: Configured as input T-register"
		severity error;
	    if (oregister = treg) then
		ireg_err <= '1'; 
		ireg_err <= transport '0' AFTER 1 ns;
	    end if;
	    if ((regq_ts = '1') OR (regq_th  = '1') OR (regq_twh = '1')
		OR (regq_twl = '1') OR (regq_tpw = '1') OR (regq_tpr = '1')
		OR (regq_trr = '1') OR (regq_trw = '1') OR (ireg_err = '1'))then
		q <= 'X' AFTER Tird;
	    elsif (ar = '1') then
		q <= '0' AFTER Trst;
	    elsif (as = '1') then
		q <= '1' AFTER Tpst;
	    elsif (oregister = oltch) then
		if (pchanging(dclk) AND (dclk = '1')) then
		    q <= x AFTER Tird;
		elsif (dclk = '1') then	
		    q <= x AFTER Tilat;
		end if;
	    elsif (oregister = dreg) then
		if (pchanging(dclk) AND (dclk = '1')) then
		    q <= x AFTER Tird;
		end if;
	    end if;
	end if;
    end process;

    -- Simulate the feedback.
    process (q)
    begin
	if (source = src_ptm) then
	    fb <= q AFTER Tfb;
	else
	    fb <= q;
	end if;
    end process;
end sim;
