--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c331p.all;

ENTITY c331m IS
    GENERIC (
	Tpd		: TIME		:= 20 ns;
	Tico		: TIME		:= 35 ns;
	Tioh		: TIME		:=  5 ns;
	Tis		: TIME		:=  2 ns;
	Tih		: TIME		:= 11 ns;
	Tiar		: TIME		:= 35 ns;
	Tirw		: TIME		:= 35 ns;
	Tirr		: TIME		:= 35 ns;
	Tias		: TIME		:= 35 ns;
	Tisw		: TIME		:= 35 ns;
	Tisr		: TIME		:= 35 ns;
	Twh		: TIME		:= 12 ns;
	Twl		: TIME		:= 12 ns;
	Tco		: TIME		:= 20 ns;
	Ts		: TIME		:= 12 ns;
	Th		: TIME		:=  8 ns;
	Toar		: TIME		:= 20 ns;
	Torw		: TIME		:= 20 ns;
	Torr		: TIME		:= 20 ns;
	Toas		: TIME		:= 20 ns;
	Tosw		: TIME		:= 20 ns;
	Tosr		: TIME		:= 20 ns;
	Tpzx		: TIME		:= 20 ns;
	Tpxz		: TIME		:= 20 ns);
    PORT (
	x1	: IN    vlbit;
	x2	: IN    vlbit;
	clk	: IN    vlbit;
	iclk	: IN    vlbit;
	oe	: IN    vlbit;
	as	: IN    vlbit;
	ar	: IN    vlbit;
	ias	: IN    vlbit;
	iar 	: IN    vlbit;
	qfb	: OUT   vlbit := '1';
	y	: INOUT vlbit;
	qifb	: OUT   vlbit := '0');
END c331m;

ARCHITECTURE sim OF c331m IS
    SIGNAL	q		: vlbit	:= '0';
    SIGNAL	iregq_tis	: vlbit	:= '0';
    SIGNAL	iregq_tih	: vlbit	:= '0';
    SIGNAL	iregq_tirw	: vlbit	:= '0';
    SIGNAL	iregq_tirr	: vlbit	:= '0';
    SIGNAL	iregq_tisw	: vlbit	:= '0';
    SIGNAL	iregq_tisr	: vlbit	:= '0';
    SIGNAL	iregq_twh	: vlbit	:= '0';
    SIGNAL	iregq_twl	: vlbit	:= '0';
    SIGNAL	q_twh		: vlbit	:= '0';
    SIGNAL	q_twl		: vlbit	:= '0';
    SIGNAL	q_ts		: vlbit	:= '0';
    SIGNAL	q_th		: vlbit	:= '0';
    SIGNAL	q_torw		: vlbit	:= '0';
    SIGNAL	q_torr		: vlbit	:= '0';
    SIGNAL	q_tosw		: vlbit	:= '0';
    SIGNAL	q_tosr		: vlbit	:= '0';
    SIGNAL	q_tpzx		: vlbit	:= '0';
    SIGNAL	q_tpxz		: vlbit	:= '0';
BEGIN

    -- check for clk setup/hold violations
    PROCESS (clk, x1, x2)
	VARIABLE xlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
    -- only check constraints if as and ar are not enabled.
    IF ((as = '0') AND (ar = '0')) THEN
	
	-- setup check
	IF (pchanging(clk) AND (clk = '1')) THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - xlastev) >= Ts))
		REPORT
		"Setup ERROR on X: Setting output to Unknown" 
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - xlastev) >= Ts)) THEN
		q_ts <= '1'; 
		q_ts <= transport '0' after 1 ns;
	    END IF;
	    clklastev := NOW;
	END IF;

	-- hold check
	IF (pchanging(x1) OR
	    (x2'event)) then
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

    END IF;
    END PROCESS;

    -- check for iclk setup/hold violations
    PROCESS (iclk, y)
	VARIABLE ylastev	: TIME := 0 ns;
	VARIABLE iclklastev	: TIME := 0 ns;
    BEGIN
    -- only check constraints if ias and iar are not enabled.
    IF ((ias = '0') AND (iar = '0')) THEN

	-- setup check
	IF (pchanging(iclk) AND (iclk = '1')) THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - ylastev) >= Tis))
		REPORT
		"Setup ERROR ON Y: Setting output to Unknown" 
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - ylastev) >= Tis)) THEN
		iregq_tis <= '1'; 
		iregq_tis <= transport '0' after 1 ns;
	    END IF;
	    iclklastev := NOW;
	END IF;

	-- hold check
	IF (pchanging(y)) then
	    ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Tih))
		REPORT
		"Hold ERROR ON Y: Setting output to Unknown" 
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Tih)) THEN
		iregq_tih <= '1'; 
		iregq_tih <= transport '0' after 1 ns;
	    END IF;
	    ylastev := NOW;
	END IF;

    END IF;
    END PROCESS;

    -- check clk pulse width
    PROCESS (clk)
	VARIABLE clklastev : TIME := 0 ns;
    BEGIN
    -- Only check constraints when as & ar are disabled
    IF ((as = '0') AND (ar = '0')) THEN
	IF (clk = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twh))
		REPORT
		"Pulse Width (H) ERROR on CLK: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twh)) THEN
		q_twh <= '1'; 
		q_twh <= transport '0' after 1 ns;
	    END IF;
	ELSIF (clk = '1') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twl))
		REPORT
		"Pulse Width (L) ERROR on CLK: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Twl)) THEN
		q_twl <= '1'; 
		q_twl <= transport '0' after 1 ns;
	    END IF;
	END IF;
	clklastev := NOW;
    END IF;
    END PROCESS;

    -- check iclk pulse width
    PROCESS (iclk)
	VARIABLE iclklastev : TIME := 0 ns;
    BEGIN
    -- Only check constraints when as & ar are disabled
    IF ((ias = '0') AND (iar = '0')) THEN
	IF (iclk = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twh))
		REPORT
		"Pulse Width (H) ERROR on CLK: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twh)) THEN
		iregq_twh <= '1'; 
		iregq_twh <= transport '0' after 1 ns;
	    END IF;
	ELSIF (iclk = '1') THEN
	   ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twl))
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Twl)) THEN
		iregq_twl <= '1'; 
		iregq_twl <= transport '0' after 1 ns;
	    END IF;
	END IF;
	iclklastev := NOW;
    END IF;
    END PROCESS;

    -- check for Asynchronous Reset Recovery violation
    PROCESS (clk, ar)
	VARIABLE arlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(ar)) then
	    arlastev := NOW;
	END IF;
	IF (ar = '0') THEN
	    IF (pchanging(clk) AND (clk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR (NOW - arlastev) >= Torr)
		    REPORT
		    "Recovery ERROR on AR: Setting output to Unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - arlastev) >= Torr)) THEN
		    q_torr <= '1'; 
		    q_torr <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- check for Asynchronous Preset Recovery violation
    PROCESS (clk, as)
	VARIABLE aslastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(as)) then
	    aslastev := NOW;
	END IF;
	IF (as = '0') THEN
	    IF (pchanging(clk) AND (clk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR (NOW - aslastev) >= Tosr)
		    REPORT
		    "Recovery ERROR on AS: Setting output to Unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tosr)) THEN
		    q_tosr <= '1'; 
		    q_tosr <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- check for Asynchronous Reset Recovery violation
    PROCESS (iclk, iar)
	VARIABLE iarlastev	: TIME := 0 ns;
	VARIABLE iclklastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(iar)) then
	    iarlastev := NOW;
	END IF;
	IF (iar = '0') THEN
	    IF (pchanging(iclk) AND (iclk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR (NOW - iarlastev) >= Tirr)
		    REPORT
		    "Recovery ERROR on IAR: Setting output to Unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - iarlastev) >= Tirr)) THEN
		    iregq_tirr <= '1'; 
		    iregq_tirr <= transport '0' after 1 ns;
		END IF;
		iclklastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- check for Asynchronous Preset Recovery violation
    PROCESS (iclk, ias)
	VARIABLE iaslastev	: TIME := 0 ns;
	VARIABLE iclklastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(ias)) then
	    iaslastev := NOW;
	END IF;
	IF (ias = '0') THEN
	    IF (pchanging(iclk) AND (iclk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR (NOW - iaslastev) >= Tisr)
		    REPORT
		    "Recovery ERROR on IAS: Setting output to Unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - iaslastev) >= Tisr)) THEN
		    iregq_tisr <= '1'; 
		    iregq_tisr <= transport '0' after 1 ns;
		END IF;
		iclklastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- check Asynchronous Reset pulse width
    PROCESS (ar)
	VARIABLE arlastev : TIME := 0 ns;
    BEGIN
	IF (clk = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - arlastev) >= Torw))
		REPORT
		"Pulse Width ERROR on AR: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - arlastev) >= Torw)) THEN
		q_torw <= '1'; 
		q_torw <= transport '0' after 1 ns;
	    END IF;
	END IF;
	arlastev := NOW;
    END PROCESS;

    -- check Asynchronous Set pulse width
    PROCESS (as)
	VARIABLE aslastev : TIME := 0 ns;
    BEGIN
	IF (clk = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tosw))
		REPORT
		"Pulse Width ERROR on AS: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - aslastev) >= Tosw)) THEN
		q_tosw <= '1'; 
		q_tosw <= transport '0' after 1 ns;
	    END IF;
	END IF;
	aslastev := NOW;
    END PROCESS;

    -- check Asynchronous Reset pulse width
    PROCESS (iar)
	VARIABLE iarlastev : TIME := 0 ns;
    BEGIN
	IF (iclk = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - iarlastev) >= Tirw))
		REPORT
		"Pulse Width ERROR on IAR: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - iarlastev) >= Tirw)) THEN
		iregq_tirw <= '1'; 
		iregq_tirw <= transport '0' after 1 ns;
	    END IF;
	END IF;
	iarlastev := NOW;
    END PROCESS;

    -- check Asynchronous Set pulse width
    PROCESS (ias)
	VARIABLE iaslastev : TIME := 0 ns;
    BEGIN
	IF (iclk = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - iaslastev) >= Tisw))
		REPORT
		"Pulse Width ERROR on IAS: Setting output to Unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - iaslastev) >= Tisw)) THEN
		iregq_tisw <= '1'; 
		iregq_tisw <= transport '0' after 1 ns;
	    END IF;
	END IF;
	iaslastev := NOW;
    END PROCESS;

    -- Simulate the Output Register.
    PROCESS (clk,ar,as,q_ts,q_th,q_twh,q_twl,q_tosw,q_torw,q_tosr,q_torr,x1,x2)
    BEGIN
	IF ((q_ts = '1') OR (q_th = '1') OR (q_twh = '1') OR (q_twl = '1')
	OR (q_tosw = '1') OR (q_torw = '1') OR (q_tosr = '1')
	OR (q_torr = '1')) THEN
	    q <= 'X' after Tco;
	ELSIF ((ar = '1') AND (as = '1')) THEN
	    q <= x1 XOR x2 AFTER Tpd;
	ELSIF (ar = '1') THEN
	    q <= '0' AFTER Toar;
	ELSIF (as = '1') THEN
	    q <= '1' AFTER Toas;
	ELSIF (clk = '1' AND pchanging(clk)) THEN
	    q <= x1 XOR x2 AFTER Tco;		
	END IF;
    END PROCESS;

    -- Simulate the Register Feedback.
    PROCESS (q)
    BEGIN
	qfb <= NOT q;
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
	    IF (pchanging(oe)) THEN
		y <= 'Z' AFTER Tpxz;
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Input Register.
    PROCESS (iclk,iar,ias,y,iregq_tis,iregq_tih,iregq_twh,iregq_twl,iregq_tisw,
		 iregq_tirw,iregq_tisr,iregq_tirr)
    BEGIN
	IF ((iregq_tis = '1') OR (iregq_tih = '1') OR (iregq_twh = '1')
	OR (iregq_twl = '1') OR (iregq_tisw = '1') OR (iregq_tirw = '1')
	OR (iregq_tisr = '1') OR (iregq_tirr = '1')) THEN
	    qifb <= 'X' after (Tico - Tpd);
	ELSIF ((iar = '1') AND (ias = '1')) THEN
	    IF (y = '1') THEN
		qifb <= '1';
	    ELSE
		qifb <= '0';
	    END IF;
	ELSIF (iar = '1') THEN
	    qifb <= '0' AFTER Tiar;
	ELSIF (ias = '1') THEN
	    qifb <= '1' AFTER Tias;
	ELSIF (iclk = '1' AND pchanging(iclk)) THEN
	    IF (y = '1') THEN
		qifb <= '1' AFTER (Tico -Tpd);
	    ELSE
		qifb <= '0' AFTER (Tico -Tpd);
	    END IF;
	END IF;
    END PROCESS;
END sim;
