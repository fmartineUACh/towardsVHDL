--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c20ra10p.all;

ENTITY c20ra10m IS
    GENERIC (
	ibr		: polarity	:= invt;
	Tpd		: TIME		:= 15 ns;
	Tpzx		: TIME		:= 12 ns;
	Tpxz		: TIME		:= 12 ns;
	Tco		: TIME		:= 15 ns;
	Tsu		: TIME		:= 7 ns;
	Th		: TIME		:= 3 ns;
	Twh		: TIME		:= 10 ns;
	Twl		: TIME		:= 10 ns;
	Ts		: TIME		:= 15 ns;
	Tr		: TIME		:= 15 ns;
	Tarw		: TIME		:= 15 ns;
	Tasw		: TIME		:= 15 ns;
	Tar		: TIME		:= 10 ns;
	Twp		: TIME		:= 15 ns;
	Tsup		: TIME		:= 15 ns;
	Thp		: TIME		:= 15 ns
    );
    PORT (
	d	: IN	vlbit;
	clk	: IN	vlbit;
	oe	: IN	vlbit;
	pl	: IN	vlbit := '1';
	as	: IN	vlbit;
	ar	: IN	vlbit;
	y	: INOUT	vlbit;
	yfb	: OUT	vlbit);
END c20ra10m;

ARCHITECTURE sim OF c20ra10m IS
    SIGNAL	d_mod	: vlbit	:= '0';
    SIGNAL	q	: vlbit	:= '0';
    SIGNAL	q_tsu	: vlbit := '0';
    SIGNAL	q_th	: vlbit := '0';
    SIGNAL	q_twh	: vlbit := '0';
    SIGNAL	q_twl	: vlbit := '0';
    SIGNAL	q_tarw	: vlbit := '0';
    SIGNAL	q_tasw	: vlbit := '0';
    SIGNAL	q_tar	: vlbit := '0';
    SIGNAL	q_twp	: vlbit	:= '0';
    SIGNAL	q_tsup	: vlbit	:= '0';
    SIGNAL	q_thp	: vlbit	:= '0';
BEGIN
    -- check for clk setup/hold violations
    PROCESS (clk, d_mod)
	VARIABLE d_modlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	IF ((as = '0') AND (ar = '0') AND (pl = '1')) THEN

	    -- setup check
	    IF (pchanging(clk) AND (clk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - d_modlastev) >= Tsu))
		    REPORT
		    "Setup ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - d_modlastev) >= Tsu)) THEN
		    q_tsu <= '1';
		    q_tsu <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;

	    -- hold check
	    IF (pchanging(d_mod)) then
		ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Th))
		    REPORT
		    "Hold ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Th)) THEN
		    q_th <= '1';
		    q_th <= transport '0' after 1 ns;
		END IF;
		d_modlastev := NOW;
	    END IF;

	END IF;
    END PROCESS;

    -- check for pl setup/hold violations
    PROCESS (pl, y)
	VARIABLE ylastev	: TIME := 0 ns;
	VARIABLE pllastev	: TIME := 0 ns;
    BEGIN
	IF ((as = '0') AND (ar = '0') AND (pl = '0')) THEN

	    -- setup check
	    IF (pchanging(pl) AND (pl = '0')) THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - ylastev) >= Tsup))
		    REPORT
		    "Setup ERROR ON Y: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - ylastev) >= Tsup)) THEN
		    q_tsup <= '1';
		    q_tsup <= transport '0' after 1 ns;
		END IF;
		pllastev := NOW;
	    END IF;

	    -- hold check
	    IF (pchanging(y)) then
		ASSERT ((NOW = 0 ns) OR ((NOW - pllastev) >= Thp))
		    REPORT
		    "Hold ERROR ON Y: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - pllastev) >= Thp)) THEN
		    q_thp <= '1';
		    q_thp <= transport '0' after 1 ns;
		END IF;
		ylastev := NOW;
	    END IF;

	END IF;
    END PROCESS;

    -- check for Asynchronous Set/Reset Recovery violation
    PROCESS (as, ar)
	VARIABLE arlastev	: TIME := 0 ns;
	VARIABLE aslastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(as)) then
	    aslastev := NOW;
	END IF;
	IF (as = '0') THEN
	    IF (pchanging(ar) AND (ar = '0')) THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tar))
		    REPORT
		    "Recovery ERROR on AS against AR: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tar)) THEN
		    q_tar <= '1'; 
		    q_tar <= transport '0' after 1 ns;
		END IF;
		arlastev := NOW;
	    END IF;
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

    -- check Asynghronous Reset pulse width
    PROCESS (ar)
	VARIABLE arlastev : TIME := 0 ns;
    BEGIN
	IF (ar = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - arlastev) >= Tarw))
		REPORT
		"Pulse Width ERROR on AR: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - arlastev) >= Tarw)) THEN
		q_tarw <= '1'; 
		q_tarw <= transport '0' after 1 ns;
	    END IF;
	END IF;
	arlastev := NOW;
    END PROCESS;

    -- check Asynghronous Set pulse width
    PROCESS (as)
	VARIABLE aslastev : TIME := 0 ns;
    BEGIN
	IF (as = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tasw))
		REPORT
		"Pulse Width ERROR on AS: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tasw)) THEN
		q_tasw <= '1'; 
		q_tasw <= transport '0' after 1 ns;
	    END IF;
	END IF;
	aslastev := NOW;
    END PROCESS;

    -- check Preload pulse width
    PROCESS (pl)
	VARIABLE pllastev : TIME := 0 ns;
    BEGIN
	IF (pl = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - pllastev) >= Twp))
		REPORT
		"Pulse Width ERROR on PL: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - pllastev) >= Twp)) THEN
		q_twp <= '1'; 
		q_twp <= transport '0' after 1 ns;
	    END IF;
	END IF;
	pllastev := NOW;
    END PROCESS;

    -- Simulate the Polarity Switch.
    PROCESS (d)
    BEGIN
	IF (ibr = invt) THEN
	    d_mod <= NOT d;
	ELSE
	    d_mod <= d;
	END IF;
    END PROCESS;

    -- Simulate the Register.
    PROCESS(d_mod,clk,ar,as,q_tsu,q_th,q_twh,q_twl,
		q_tarw,q_tasw,q_tar,q_twp,q_tsup,q_thp)
    BEGIN
	IF ( (q_tsu	= '1')
	    OR (q_th	= '1')
	    OR (q_twh	= '1')
	    OR (q_twl	= '1')
	    OR (q_tarw	= '1')
	    OR (q_tasw	= '1')
	    OR (q_tar	= '1')
	    OR (q_twp	= '1')
	    OR (q_tsup	= '1')
	    OR (q_thp	= '1')) THEN
	    q <= 'X' after Tco;
	ELSIF ((ar = '1') AND (as = '1')) THEN
	    q <= d_mod AFTER Tpd;
	ELSIF (ar = '1') THEN
	    q <= '0' AFTER Tr;
	ELSIF (as = '1') THEN
	    q <= '1' AFTER Ts;
	ELSIF (clk = '1' AND pchanging(clk)) THEN
	    IF (pl = '0') THEN
		IF (y = '1') THEN
		    q <= '0' AFTER Tco;
		ELSE
		    q <= '1' AFTER Tco;
		END IF;
	    ELSE
		    q <= d_mod AFTER Tco;
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Output.
    PROCESS (q, oe)
    BEGIN
	IF (oe = '1') THEN
	    IF (pchanging(oe)) THEN
		y <= NOT q AFTER Tpzx;					
	    ELSE
		y <= NOT q;
	    END IF;
	ELSE 
	    y <= 'Z' AFTER Tpxz;
	END IF;
    END PROCESS;

    -- Simulate the Feedback.
    PROCESS (y)
    BEGIN
	IF (y = '1') THEN
	    yfb <= '1';
	ELSE
	    yfb <= '0';
	END IF;
    END PROCESS;
END sim;
