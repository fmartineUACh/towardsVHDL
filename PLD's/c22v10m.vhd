--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c22v10p.all;

ENTITY c22v10m IS
    GENERIC (
	registered	: reg_def	:= reg;
	inv_setting	: polarity	:= invt;
	bta_sel		: fb_type	:= xreg;
	Tpd		: TIME		:= 20 ns;
	Tea		: TIME		:= 20 ns;
	Ter		: TIME		:= 20 ns;
	Tco		: TIME		:= 12 ns;
	Ts		: TIME		:= 12 ns;
	Th		: TIME		:=  0 ns;
	Twh		: TIME		:= 10 ns;
	Twl		: TIME		:= 10 ns;
	Tcf		: TIME		:= 10 ns;
	Taw		: TIME		:= 20 ns;
	Tar		: TIME		:= 20 ns;
	Tap		: TIME		:= 25 ns;
	Tspr		: TIME		:= 20 ns);
    PORT (
	d	: IN	vlbit;
	clk	: IN	vlbit;
	oe	: IN	vlbit;
	ss	: IN	vlbit;
	ar	: IN	vlbit;
	y	: INOUT vlbit;
	fb	: OUT	vlbit);
END c22v10m;

ARCHITECTURE sim OF c22v10m IS
	SIGNAL	q	: vlbit	:= '0';
	SIGNAL	q_not	: vlbit := '1';
	SIGNAL	qbar	: vlbit	:= '0';
	SIGNAL	d_mod	: vlbit	:= '0';
	SIGNAL	d_pol	: vlbit	:= '0';
	SIGNAL	q_ts	: vlbit := '0';
	SIGNAL	q_th	: vlbit := '0';
	SIGNAL	q_twh	: vlbit := '0';
	SIGNAL	q_twl	: vlbit := '0';
	SIGNAL	q_tar	: vlbit := '0';
	SIGNAL	q_ss	: vlbit := '0';
	SIGNAL	q_tspr	: vlbit := '0';
	SIGNAL	q_taw	: vlbit	:= '0';
BEGIN

    -- check for clk setup/hold violations
    PROCESS (clk, d)
	VARIABLE dlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	-- Check only if the cell is registered.
	IF (registered = reg) THEN

	    -- setup check
	    IF (pchanging(clk) AND (clk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - dlastev) >= Ts))
		    REPORT
		    "Setup ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - dlastev) >= Ts)) THEN
		    q_ts <= '1';
		    q_ts <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;

	    -- hold check
	    IF (pchanging(d)) then
		ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Th))
		    REPORT
		    "Hold ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Th)) THEN
		    q_th <= '1';
		    q_th <= transport '0' after 1 ns;
		END IF;
		dlastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- check for Asynchronous Reset Recovery violation
    PROCESS (clk, ar)
	VARIABLE arlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	-- Check only if the cell is registered.
	IF (registered = reg) THEN
	    IF (pchanging(ar)) then
		arlastev := NOW;
	    END IF;
	    IF (ar = '0') THEN
		IF (pchanging(clk) AND (clk = '1')) THEN
		    ASSERT ((NOW = 0 ns) OR ((NOW - arlastev) >= Tar))
			REPORT
			"Recovery ERROR on AR: Setting output to unknown" 
			SEVERITY WARNING;
		    IF NOT ((NOW = 0 ns) OR ((NOW - arlastev) >= Tar)) THEN
			q_tar <= '1'; 
			q_tar <= transport '0' after 1 ns;
		    END IF;
		    clklastev := NOW;
		END IF;
	    END IF;
	END IF;
    END PROCESS;

    -- check for Synchronous Preset Recovery violation
    PROCESS (clk, ss)
	VARIABLE sslastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	-- Check only if the cell is registered.
	IF (registered = reg) THEN
	    IF (pchanging(ss)) then
		sslastev := NOW;
	    END IF;
	    IF (ss = '0') THEN
		IF (pchanging(clk) AND (clk = '1')) THEN
		    ASSERT ((NOW = 0 ns) OR ((NOW - sslastev) >= Tspr))
			REPORT
			"Recovery ERROR on SS: Setting output to unknown" 
			SEVERITY WARNING;
		    IF NOT ((NOW = 0 ns) OR ((NOW - sslastev) >= Tspr)) THEN
			q_tspr <= '1'; 
			q_tspr <= transport '0' after 1 ns;
		    END IF;
		    clklastev := NOW;
		END IF;
	    END IF;
	END IF;
    END PROCESS;

    -- check clk pulse width
    PROCESS (clk)
	VARIABLE clklastev : TIME := 0 ns;
    BEGIN
	-- Check only if the cell is registered.
	IF (registered = reg) THEN
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
	END IF;
    END PROCESS;

    -- check Asynchronous Reset pulse width
    PROCESS (ar)
	VARIABLE arlastev : TIME := 0 ns;
    BEGIN
	-- Check only if the cell is registered.
	IF (registered = reg) THEN
	    IF (clk = '0') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - arlastev) >= Taw))
		    REPORT
		    "Pulse Width ERROR on AR: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - arlastev) >= Taw)) THEN
		    q_taw <= '1'; 
		    q_taw <= transport '0' after 1 ns;
		END IF;
	    END IF;
	END IF;
	arlastev := NOW;
    END PROCESS;

    -- Simulate the Register.
    PROCESS (clk, ar, ss, q_ts, q_th, q_twh, q_twl, q_taw, q_tar, q_tspr, q_ss)
    BEGIN
	IF ((q_ts = '1') OR (q_th = '1') OR (q_twh = '1') OR (q_twl = '1') OR
	(q_taw = '1') OR (q_tar = '1') OR (q_tspr = '1') OR (q_ss = '1')) THEN
	    q <= 'X' after Tco;
	    q_not <= 'X' after Tcf;
	ELSIF (ar = '1') THEN
	    q <= '0' AFTER Tap;
	    q_not <= '1' AFTER Tcf;
	ELSIF ((clk = '1') AND pchanging(clk)) THEN
	    IF (ss = '1') THEN
		q <= '1' AFTER Tco;
		q_not <= '0' AFTER Tcf;
	    ELSE
		q <= d AFTER Tco;
		IF (d = '1') THEN
		    q_not <= '0' after Tcf;
		ELSE
		    q_not <= '1' after Tcf;
		END IF;
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Register Mux.
    PROCESS (d, q)
    BEGIN
	IF (registered = comb) THEN
	    d_mod <= d AFTER Tpd;
	ELSIF (registered = reg) THEN
	    d_mod <= q;
	END IF;
    END PROCESS;

    -- Simulate the Polarity Switch.
    PROCESS (d_mod)
    BEGIN
	IF (inv_setting = invt) THEN
	    d_pol <= d_mod;
	ELSE
	    d_pol <= NOT d_mod;
	END IF;
    END PROCESS;

    -- Simulate the Output.
    PROCESS (oe, d_pol)
    BEGIN
	IF (pchanging(oe)) THEN
	    IF (oe = '1') THEN
		y <= NOT d_pol AFTER Tea;
	    ELSE
		y <= 'Z' AFTER Ter;
	    END IF;
	ELSE
	    IF (oe = '1') THEN
		y <= NOT d_pol; 
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Feedback.
    PROCESS (y, q)
    BEGIN
	IF (bta_sel = xpin) THEN
	    IF (y = '1') THEN
		fb <= '1';
	    ELSE
		fb <= '0';
	    END IF;
	ELSIF (bta_sel = xreg) THEN
	    fb <= q_not;
	END IF;
    END PROCESS;

END sim;
