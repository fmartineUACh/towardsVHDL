--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c16v8p.all;

ENTITY c16v8m IS
    GENERIC (
	registered	: reg_def	:= reg;
	inv_setting	: polarity	:= invt;
	bta_sel		: fb_type	:= xreg;
	Tpd		: TIME		:= 10 ns;
	Ten		: TIME		:= 10 ns;
	Tdis		: TIME		:= 10 ns;
	Tco		: TIME		:=  7 ns;
	Tsu		: TIME		:=  7 ns;
	Th		: TIME		:=  0 ns;
	Twh		: TIME		:=  8 ns;
	Twl		: TIME		:=  8 ns;
	Tcf		: TIME		:=  6 ns);
    PORT (
	d	: IN	vlbit;
	clk	: IN	vlbit;
	oe	: IN	vlbit;
	adj	: IN	vlbit;
	y	: INOUT vlbit;
	fb	: OUT	vlbit;
	yfb	: OUT	vlbit);
END c16v8m;

ARCHITECTURE sim OF c16v8m IS
	SIGNAL	q	: vlbit	:= '0';
	SIGNAL	q_not	: vlbit := '1';
	SIGNAL	d_mod	: vlbit	:= '0';
	SIGNAL	d_pol	: vlbit	:= '0';
	SIGNAL	q_tsu	: vlbit := '0';
	SIGNAL	q_th	: vlbit := '0';
	SIGNAL	q_twh	: vlbit := '0';
	SIGNAL	q_twl	: vlbit := '0';
BEGIN

    -- check for clk setup/hold violations
    PROCESS (clk, d)
	VARIABLE dlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	-- Check to see if it is a registered cell.
	IF (registered = reg) THEN

	    -- setup check
	    IF (pchanging(clk) AND (clk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - dlastev) >= Tsu))
		    REPORT
		    "Setup ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - dlastev) >= Tsu)) THEN
		    q_tsu <= '1';
		    q_tsu <= transport '0' after 1 ns;
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

    -- check clk pulse width
    PROCESS (clk)
	VARIABLE clklastev : TIME := 0 ns;
    BEGIN
	-- Check to see if it is a registered cell.
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

    -- Simulate the polarity gate.
    PROCESS (d)
    BEGIN
	IF (inv_setting = invt) THEN
	    d_pol <= NOT (d);
	ELSE
	    d_pol <= d;
	END IF;
    END PROCESS;

    -- Simulate the Register.
    PROCESS (clk, q_tsu, q_th, q_twh, q_twl)
    BEGIN
	IF ((q_tsu = '1') OR (q_th = '1') OR (q_twh = '1') OR (q_twl = '1'))THEN
	    q <= 'X' after Tco;
	    q_not <= 'X' after Tcf;
	ELSIF ((clk = '1') AND pchanging(clk)) THEN
	    q <= d_pol AFTER Tco;
	    IF (d_pol = '1') THEN
		q_not <= '0' after Tcf;
	    ELSE
		q_not <= '1' after Tcf;
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the register definition mux.
    PROCESS (d_pol, q)
    BEGIN
	IF (registered = comb) THEN
	    d_mod <= d_pol AFTER Tpd;
	ELSIF (registered = reg) THEN
	    d_mod <= q;
	END IF;
    END PROCESS;

    -- Simulate the output driver.
    PROCESS (oe, d_mod)
    BEGIN
	IF (pchanging(oe)) THEN
	    IF (oe = '1') THEN
		y <= not d_mod AFTER Ten;
	    ELSE
		y <= 'Z' AFTER Tdis;
	    END IF;
	ELSE
	    IF (oe = '1') THEN
		y <= not d_mod; 
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the feedback mux.
    PROCESS (y, q_not, adj)
    BEGIN
	IF (bta_sel = xpin) THEN
	    IF (y = '1') THEN
		fb <= '1';
	    ELSE
		fb <= '0';
	    END IF;
	ELSIF (bta_sel = xreg) THEN
	    fb <= q_not;
	ELSIF (bta_sel = xadj) THEN
	    fb <= adj;
	END IF;
    END PROCESS;

    -- Simulate feedback from Y.
    PROCESS (y)
    BEGIN
	IF (y = '1') THEN                       
	    yfb <= '1';
	ELSE
	    yfb <= '0';
	END IF;
    END PROCESS;

END sim;
