--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c335p.all;

ENTITY c335h IS				
    GENERIC (
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
	x1	: IN  vlbit;
	x2	: IN  vlbit;
	clk	: IN  vlbit;
	ss	: IN  vlbit;
	sr	: IN  vlbit;
	qfb	: OUT vlbit := '0');
END c335h;

ARCHITECTURE sim OF c335h IS
    SIGNAL	q_ts	   : vlbit := '0';
    SIGNAL	q_th	   : vlbit := '0';
    SIGNAL	q_twh	   : vlbit := '0';
    SIGNAL	q_twl	   : vlbit := '0';
    SIGNAL	q_setreset : vlbit := '0';
BEGIN

    -- check for clk setup/hold violations
    PROCESS (clk, x1, x2)
	VARIABLE xlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
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

    -- IS THIS CHECK REALLY NECESSARY AND VALID????  See notes below.
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

    -- Simulate the Register.
    PROCESS (clk, sr, ss, q_ts, q_th, q_twh, q_twl, q_setreset)
    BEGIN
	IF ((q_ts = '1') OR (q_th = '1') OR (q_twh = '1') OR (q_twl = '1')
	OR (q_setreset = '1')) THEN
	    qfb <= 'X' after Tco;
	ELSIF ((clk = '1') AND pchanging(clk)) THEN
	    IF (sr = '1') THEN
		qfb <= '0';
	    ELSIF (ss = '1') THEN
		qfb <= '1';
	    ELSE
		qfb <= NOT (x1 XOR x2) AFTER Tco;
	    END IF;
	END IF;	
    END PROCESS;
END sim;

-- NOTE:  The time through a hidden register is not really Tco;
-- however, there is no information given in the data sheet for this parameter.

-- Also, since the sr and ss terms come from product terms, most of their
-- delay is modeled in c335m.  They are really NOT synchronous for this
-- model.  Their affect on QFB is not 0, but there is no information given
-- in the data sheet for these parameters.
