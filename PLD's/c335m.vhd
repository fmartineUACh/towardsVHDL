--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c335p.all;

ENTITY c335m IS
    GENERIC (
	registered	: reg_def	:= reg;
	bta_sel		: fb_type	:= xreg;
	Tpd		: TIME		:= 15 ns;
	Twh		: TIME		:=  5 ns;
	Twl		: TIME		:=  5 ns;
	Tis		: TIME		:=  2 ns;
	Tih		: TIME		:=  2 ns;
	Tico		: TIME		:= 18 ns;
	Tpzx		: TIME		:= 12 ns;
	Tpxz		: TIME		:= 12 ns;
	Ts		: TIME		:=  9 ns;
	Th		: TIME		:=  0 ns;
	Tco		: TIME		:= 10 ns;
	Tco2		: TIME		:= 18 ns
    );
    PORT (
	x1	: IN    vlbit;
	x2	: IN    vlbit;
	clk	: IN    vlbit;
	iclk	: IN    vlbit;
	ss	: IN    vlbit;
	sr	: IN    vlbit;
	oe	: IN    vlbit;
	qfb	: OUT   vlbit := '1';
	fb	: OUT   vlbit;
	y	: INOUT vlbit);
END c335m;

ARCHITECTURE sim OF c335m IS
    SIGNAL	q	   : vlbit := '0';
    SIGNAL	iregq	   : vlbit := '0';
    SIGNAL	q_ts	   : vlbit := '0';
    SIGNAL	q_th	   : vlbit := '0';
    SIGNAL	q_twh	   : vlbit := '0';
    SIGNAL	q_twl	   : vlbit := '0';
    SIGNAL	iregq_ts   : vlbit := '0';
    SIGNAL	iregq_th   : vlbit := '0';
    SIGNAL	iregq_twh  : vlbit := '0';
    SIGNAL	iregq_twl  : vlbit := '0';
    SIGNAL	q_setreset : vlbit := '0';
BEGIN
    -- check for clk setup/hold violations
    PROCESS (clk, x1, x2)
	VARIABLE xlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	-- only if the cell is registered.
	if (registered = reg) then

	    -- setup check
	    IF (pchanging(clk) AND (clk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - xlastev) >= Ts))
		    REPORT
		    "Setup ERROR on X: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - xlastev) >= Ts)) THEN
		    q_ts <= '1'; 
		    q_ts <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;

	    -- hold check
	    IF (pchanging(x1) OR
		pchanging(x2)) then
		ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Th))
		    REPORT
		    "Hold ERROR ON X: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Th)) THEN
		    q_th <= '1';
		    q_th <= transport '0' after 1 ns;
		END IF;
		xlastev := NOW;
	    END IF;

	end if;
    END PROCESS;

    -- check for iclk setup/hold violations
    PROCESS (iclk, y)
	VARIABLE ylastev	: TIME := 0 ns;
	VARIABLE iclklastev	: TIME := 0 ns;
    BEGIN
	-- only if the cell is registered.
	if (bta_sel = xreg) then

	    -- setup check
	    IF (pchanging(iclk) AND (iclk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR (NOW - ylastev) >= Tis)
		    REPORT
		    "Setup ERROR ON Y: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR (NOW - ylastev) >= Tis) THEN
		    iregq_ts <= '1'; 
		    iregq_ts <= transport '0' after 1 ns;
		END IF;
		iclklastev := NOW;
	    END IF;

	    -- hold check
	    IF (pchanging(y)) then
		ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Tih))
		    REPORT
		    "Hold ERROR ON Y: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Tih)) THEN
		    iregq_th <= '1'; 
		    iregq_th <= transport '0' after 1 ns;
		END IF;
		ylastev := NOW;
	    END IF;

	end if;
    END PROCESS;

    -- check clk pulse width
    PROCESS (clk)
	VARIABLE clklastev : TIME := 0 ns;
    BEGIN
	-- only if the cell is registered.
	if (registered = reg) then

	    IF (clk = '0') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twh))
		    REPORT
		    "Pulse Width (H) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twh)) THEN
		    q_twh <= '1'; 
		    q_twh <= transport '0' after 1 ns;
		END IF;
	    ELSIF (clk = '1') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twl))
		    REPORT
		    "Pulse Width (L) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twl)) THEN
		    q_twl <= '1'; 
		    q_twl <= transport '0' after 1 ns;
		END IF;
	    END IF;
	    clklastev := NOW;
	end if;
    END PROCESS;

    -- check iclk pulse width
    PROCESS (iclk)
	VARIABLE iclklastev : TIME := 0 ns;
    BEGIN
	-- only if the cell is registered.
	if (bta_sel = xreg) then

	    IF (iclk = '0') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twh))
		    REPORT
		    "Pulse Width (H) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twh)) THEN
		    iregq_twh <= '1'; 
		    iregq_twh <= transport '0' after 1 ns;
		END IF;
	    ELSIF (iclk = '1') THEN
	       ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twl))
		    REPORT
		    "Pulse Width (L) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twl)) THEN
		    iregq_twl <= '1'; 
		    iregq_twl <= transport '0' after 1 ns;
		END IF;
	    END IF;
	    iclklastev := NOW;
	end if;
    END PROCESS;

    -- IS THIS CHECK REallY NECESSARY AND VALID????  See notes below.
    -- check for invalid control
    PROCESS (clk)
    BEGIN
	IF (clk = '1') THEN
	    ASSERT NOT ((ss = '1') AND (sr = '1'))
		REPORT
		"ERROR: Preset & Clear both Active: Setting outputs to unknown"
		SEVERITY warning;
	    IF ((ss = '1') AND (sr = '1')) THEN
		q_setreset <= '1';
		q_setreset <= transport '0' after 1 ns;
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Output Register.
    PROCESS (clk, sr, ss, q_ts, q_th, q_twh, q_twl, q_setreset)
    BEGIN
	IF ((q_ts = '1') OR (q_th = '1') OR (q_twh = '1') OR (q_twl = '1')
	OR (q_setreset = '1')) THEN
	    q <= 'X' after Tco;
	ELSIF ((clk = '1') AND pchanging(clk)) THEN
	    IF (sr = '1') THEN
		q <= '0';
	    ELSIF (ss = '1') THEN
		q <= '1';
	    ELSE
		q <= x1 XOR x2 AFTER Tco;
	    END IF;
	END IF;
    END PROCESS;

 -- Since the sr and ss terms come from product terms, most of their
 -- delay is modeled in c335m.  They are really NOT synchronous for this
 -- model.  Their affect on QFB is not 0, but there is no information given
 -- in the data sheet for these parameters.

    -- Simulate the Feedback.
    PROCESS (q)
    BEGIN
	IF (q = '1') THEN
	    qfb <= '0';
	ELSE
	    qfb <= '1';
	END IF;
    END PROCESS;

    -- Simulate the Output.
    PROCESS (q, oe, x1, x2)
    BEGIN
	IF (oe = '1') THEN
	    IF (pchanging(oe)) THEN
		IF (registered = reg) THEN
		    y <= NOT q AFTER Tpzx;
		ELSIF (registered = comb) THEN
		    y <= NOT (x1 XOR x2) AFTER Tpzx;
		END IF;
	    ELSE
		IF (registered = reg) THEN
		    y <= NOT q;
		ELSIF (registered = comb) THEN
		    y <= NOT (x1 XOR x2) AFTER Tpd;
		END IF;
	    END IF;
	ELSE
	    IF (pchanging(oe)) THEN
		y <= 'Z' AFTER Tpxz;
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Input Register.
    PROCESS (iclk, iregq_ts, iregq_th, iregq_twh, iregq_twl)
    BEGIN
	IF ((iregq_ts = '1') OR (iregq_th = '1') OR (iregq_twh = '1')
	OR (iregq_twl = '1')) THEN
	    iregq <= 'X' after (Tico - Tpd);
	ELSIF ((iclk = '1') AND pchanging(iclk)) THEN
	    IF (y = '1') THEN
		iregq <= '1' AFTER (Tico - Tpd);
	    ELSE
		iregq <= '0' AFTER (Tico - Tpd);
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Feedback Mux.
    PROCESS (iregq, y)
    BEGIN
	IF (bta_sel = xreg) THEN
	    fb <= iregq;
	ELSIF (bta_sel = xpin) THEN
	    IF (y = '1') THEN
		fb <= '1';
	    ELSE
		fb <= '0';
	    END IF;
	END IF;
    END PROCESS;
END sim;
