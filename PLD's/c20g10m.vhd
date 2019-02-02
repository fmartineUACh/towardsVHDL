--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c20g10p.all;

ENTITY c20g10m IS
    GENERIC (
	registered	: reg_def	:= reg;
	inv_setting	: polarity	:= ninv;
	bta_sel		: fb_type	:= xreg;
	Tpd		: TIME		:= 25 ns;
	Tpzx		: TIME		:= 20 ns;
	Tpxz		: TIME		:= 20 ns;
	Tco		: TIME		:= 15 ns;
	Ts		: TIME		:= 15 ns;
	Th		: TIME		:=  0 ns;
	Twh		: TIME		:= 12 ns;
	Twl		: TIME		:= 12 ns);

    PORT (
	    d	: IN	vlbit;
	    clk	: IN	vlbit;
	    oe	: IN	vlbit;
	    y	: INOUT vlbit;
	    fb	: OUT	vlbit);
END c20g10m;

ARCHITECTURE sim OF c20g10m IS
    SIGNAL   	q	: vlbit	:= '0';
    SIGNAL	d_mod	: vlbit	:= '0';
    SIGNAL	d_pol	: vlbit	:= '0';
    SIGNAL	q_ts	: vlbit := '0';
    SIGNAL	q_th	: vlbit := '0';
    SIGNAL	q_twh	: vlbit := '0';
    SIGNAL	q_twl	: vlbit := '0';
BEGIN
    -- check for clk setup/hold violations
    PROCESS (clk, d)
	VARIABLE dlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN

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

    END PROCESS;

    -- check clk pulse width
    PROCESS (clk)
	VARIABLE clklastev : TIME := 0 ns;
    BEGIN
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
    END PROCESS;

    -- Simulate the Register.
    PROCESS (clk, q_ts, q_th, q_twh, q_twl)
    BEGIN
	IF ((q_ts = '1') OR (q_th = '1') OR (q_twh = '1') OR (q_twl = '1')) THEN
	    q <= 'X' after Tco;
	ELSIF ((clk = '1') AND pchanging(clk)) THEN
	    q <= d AFTER Tco;
	END IF;
    END PROCESS;

    -- Simulate the Register Mux.
    PROCESS (q, d)
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
	IF (inv_setting = ninv) THEN
	    IF ((d_mod = '0') OR (d_mod = '1')) THEN
		d_pol <= NOT(d_mod);
	    ELSE
		d_pol <= 'X';
	    END IF;
	ELSE
	    d_pol <= d_mod;
	END IF;
    END PROCESS;

    -- Simulate the Output.
    PROCESS (oe, d_pol)
    BEGIN
	IF (pchanging(oe)) THEN
	    IF (oe = '1') THEN
		IF ((d_pol = '0') OR (d_pol = '1')) THEN
		    y <= NOT d_pol AFTER Tpzx;
		ELSE
		    y <= 'X' after Tpzx;
		END IF;
	    ELSE
		y <= 'Z' AFTER Tpxz;
	    END IF;
	ELSE
	    IF (oe = '1') THEN
		IF ((d_pol = '0') OR (d_pol = '1')) THEN
		    y <= NOT d_pol; 
		ELSE
		    y <= 'X';
		END IF;
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Feedback Mux.
    PROCESS (q, y)
    BEGIN
	IF (bta_sel = xreg) THEN
	    IF ((q = '0') OR (q = '1')) THEN
		fb <= NOT(q);
	    ELSE
		fb <= 'X';
	    END IF;
	ELSIF (bta_sel = xpin) THEN
	    IF (y = '1') THEN
		fb <= '1';
	    ELSE
		fb <= '0';
	    END IF;
	END IF;
    END PROCESS;
    
END sim;
