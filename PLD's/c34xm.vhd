--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c34xp.all;

ENTITY c34xm IS
    GENERIC (
	Tin	: TIME	:=  7 ns;
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns
    );
    PORT (
	x1	: IN	vlbit;
	x2	: IN	vlbit;
	as	: IN	vlbit;
	ar	: IN	vlbit;
	clkpt	: IN	vlbit;
	clklab	: IN	vlbit;
	clksel	: IN	vlbit;
	oe	: IN	vlbit;
	y	: INOUT	vlbit;
	qfb	: OUT	vlbit := '0';
	yfb	: OUT	vlbit);
END c34xm;

ARCHITECTURE sim OF c34xm IS
    SIGNAL	q	: vlbit	:= '0';
    SIGNAL	x1_in	: vlbit	:= '0';
    SIGNAL	x2_in	: vlbit	:= '0';
    SIGNAL	as_in	: vlbit	:= '0';
    SIGNAL	ar_in	: vlbit	:= '0';
    SIGNAL	clkpt_in : vlbit := '0';
    SIGNAL	clklab_in : vlbit := '0';
    SIGNAL	clkcell	: vlbit := '0';
    SIGNAL	oe_in	: vlbit	:= '1';
    SIGNAL	q_trsu	: vlbit := '0';
    SIGNAL	q_trh	: vlbit := '0';
    SIGNAL	q_tchpt	: vlbit := '0';
    SIGNAL	q_tclpt	: vlbit := '0';
    SIGNAL	q_tchsys : vlbit := '0';
    SIGNAL	q_tclsys : vlbit := '0';
    SIGNAL	q_tpcwr	: vlbit	:= '0';
    SIGNAL	q_tpcws	: vlbit	:= '0';
    SIGNAL	q_tpcrr	: vlbit	:= '0';
    SIGNAL	q_tpcrs	: vlbit	:= '0';
    SIGNAL	q_clkchk : vlbit := '0';
BEGIN

    -- Simulate the Logic Array.
    PROCESS (x1, x2 , as, ar, oe, clkpt, clklab)
    BEGIN
	x1_in <= x1 AFTER Tlad;
	x2_in <= x2 AFTER Tlad;
	as_in <= as AFTER Tlac;
	ar_in <= ar AFTER Tlac;
	oe_in <= oe AFTER Tlac;
	clkpt_in <= clkpt AFTER Tic;
	clklab_in <= clklab AFTER Tics;
    END PROCESS;

    -- Simulate the Clock Mux.
    PROCESS (clkpt_in, clklab_in)
    BEGIN
	clkcell <= (clkpt_in OR (clksel AND clklab_in));
    END PROCESS;

    -- check for clk setup/hold violations
    PROCESS (clkcell, x1_in, x2_in)
	VARIABLE xlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	-- Check to see that Set & Reset aren't enabled
	IF ((as_in = '1') AND (ar_in = '1')) THEN

	    -- setup check
	    IF (pchanging(clkcell) AND (clkcell = '1')) THEN
		ASSERT ((NOW <= Tlac) OR ((NOW - xlastev) >= Trsu))
		    REPORT
		    "Setup ERROR on X: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW <= Tlac) OR ((NOW - xlastev) >= Trsu)) THEN
		    q_trsu <= '1'; 
		    q_trsu <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;

	    -- hold check
	    IF (pchanging(x1_in) OR
		pchanging(x2_in)) then
		ASSERT ((NOW <= Tlad) OR ((NOW - clklastev) >= Trh))
		    REPORT
		    "Hold ERROR ON X: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW <= Tlad) OR ((NOW - clklastev) >= Trh)) THEN
		    q_trh <= '1';
		    q_trh <= transport '0' after 1 ns;
		END IF;
		xlastev := NOW;
	    END IF;

	END IF;
    END PROCESS;

    -- check clkpt_in pulse width
    PROCESS (clkpt_in)
	VARIABLE clkptlastev : TIME := 0 ns;
    BEGIN
	-- Check to see that Set & Reset aren't enabled
	IF ((as_in = '1') AND (ar_in = '1')) THEN
	    IF (clkpt_in = '0') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - clkptlastev) >= Tch))
		    REPORT
		    "Pulse Width (H) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clkptlastev) >= Tch)) THEN
		    q_tchpt <= '1'; 
		    q_tchpt <= transport '0' after 1 ns;
		END IF;
	    ELSIF (clkpt_in = '1') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - clkptlastev) >= Tcl))
		    REPORT
		    "Pulse Width (L) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clkptlastev) >= Tcl)) THEN
		    q_tclpt <= '1'; 
		    q_tclpt <= transport '0' after 1 ns;
		END IF;
	    END IF;
	clkptlastev := NOW;
	END IF;
    END PROCESS;

    -- check clklab pulse width
    PROCESS (clklab_in)
	VARIABLE clklablastev : TIME := 0 ns;
    BEGIN
	-- Check to see that Set & Reset aren't enabled
	IF ((as_in = '1') AND (ar_in = '1')) THEN
	    IF (clklab_in = '0') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - clklablastev) >= Tch))
		    REPORT
		    "Pulse Width (H) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklablastev) >= Tch)) THEN
		    q_tchsys <= '1'; 
		    q_tchsys <= transport '0' after 1 ns;
		END IF;
	    ELSIF (clklab_in = '1') THEN
		ASSERT ((NOW = 0 ns) OR ((NOW - clklablastev) >= Tcl))
		    REPORT
		    "Pulse Width (L) ERROR on CLK: Setting output to unknown"
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - clklablastev) >= Tcl)) THEN
		    q_tclsys <= '1'; 
		    q_tclsys <= transport '0' after 1 ns;
		END IF;
	    END IF;
	clklablastev := NOW;
	END IF;
    END PROCESS;

    -- check SET pulse width
    PROCESS (as_in)
	VARIABLE as_inlastev : TIME := 0 ns;
    BEGIN
	IF (as_in = '1') THEN
	    ASSERT ((NOW <= Tlac) OR ((NOW - as_inlastev) >= Tpcw))
		REPORT
		"Pulse Width (L) ERROR on AS: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW <= Tlac) OR ((NOW - as_inlastev) >= Tpcw)) THEN
		q_tpcws <= '1'; 
		q_tpcws <= transport '0' after 1 ns;
	    END IF;
	END IF;
	as_inlastev := NOW;
    END PROCESS;

    -- check RESET pulse width
    PROCESS (ar_in)
	VARIABLE ar_inlastev : TIME := 0 ns;
    BEGIN
	IF (ar_in = '1') THEN
	    ASSERT ((NOW <= Tlac) OR ((NOW - ar_inlastev) >= Tpcw))
		REPORT
		"Pulse Width (L) ERROR on AR: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW <= Tlac) OR ((NOW - ar_inlastev) >= Tpcw)) THEN
		q_tpcwr <= '1'; 
		q_tpcwr <= transport '0' after 1 ns;
	    END IF;
	END IF;
	ar_inlastev := NOW;
    END PROCESS;

    -- check for Asynchronous Reset Recovery violation
    PROCESS (clkcell, ar_in)
	VARIABLE ar_inlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(ar_in)) then
	    ar_inlastev := NOW;
	END IF;
	IF (ar_in = '0') THEN
	    IF (pchanging(clkcell) AND (clkcell = '1')) THEN
		ASSERT ((NOW <= Tlac) OR (NOW - ar_inlastev) >= Tpcr)
		    REPORT
		    "Recovery ERROR on AR: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW <= Tlac) OR ((NOW - ar_inlastev) >= Tpcr)) THEN
		    q_tpcrr <= '1'; 
		    q_tpcrr <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- check for Asynchronous Set Recovery violation
    PROCESS (clkcell, as_in)
	VARIABLE as_inlastev	: TIME := 0 ns;
	VARIABLE clklastev	: TIME := 0 ns;
    BEGIN
	IF (pchanging(as_in)) then
	    as_inlastev := NOW;
	END IF;
	IF (as_in = '0') THEN
	    IF (pchanging(clkcell) AND (clkcell = '1')) THEN
		ASSERT ((NOW <= Tlac) OR (NOW - as_inlastev) >= Tpcr)
		    REPORT
		    "Recovery ERROR on AS: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW <= Tlac) OR ((NOW - as_inlastev) >= Tpcr)) THEN
		    q_tpcrs <= '1'; 
		    q_tpcrs <= transport '0' after 1 ns;
		END IF;
		clklastev := NOW;
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Register.
    PROCESS (x1_in, x2_in, clkcell, ar_in, as_in, q_trsu, q_trh, q_tchpt,
		q_tchsys, q_tclpt, q_tclsys, q_tpcwr, q_tpcws, q_tpcrr,
		q_tpcrs, q_clkchk)
    BEGIN
	IF ((q_trsu = '1') OR (q_trh    = '1') OR (q_tchpt  = '1')
	OR (q_tclpt = '1') OR (q_tchsys = '1') OR (q_tclsys = '1')
	OR (q_tpcwr = '1') OR (q_tpcws  = '1') OR (q_tpcrr  = '1')
	OR (q_tpcrs = '1') OR (q_clkchk = '1')) THEN
	    q   <= 'X' AFTER Trd;
	    qfb <= 'X' AFTER Trd + Tfd;            
	ELSIF ((ar_in = '0') AND (as_in = '0')) THEN
	    IF (clkcell = '1' AND NOT pchanging(clkcell)) then
		q   <= (x1_in XOR x2_in) AFTER Tcomb;
		qfb <= (x1_in XOR x2_in) AFTER Tcomb + Tfd;
	    ELSIF ((clkcell = '1') AND pchanging(clkcell)) then
		q   <= (x1_in XOR x2_in) AFTER Tlatch;
		qfb <= (x1_in XOR x2_in) AFTER Tlatch + Tfd;
	    END IF;
	ELSIF (ar_in = '0') THEN
	    q   <= '0' AFTER Tclr;
	    qfb <= '0' AFTER Tclr + Tfd;
	ELSIF (as_in = '0') THEN
	    q   <= '1' AFTER Tpre;
	    qfb <= '1' AFTER Tpre + Tfd;
	ELSIF ((clkcell = '1') AND pchanging(clkcell)) THEN
		q   <= (x1_in XOR x2_in) AFTER Trd;
		qfb <= (x1_in XOR x2_in) AFTER Trd + Tfd;
	END IF;
    END PROCESS;

    -- Simulate the Output.
    PROCESS (q, oe_in)
    BEGIN
	IF (oe_in = '1') THEN
	    IF (pchanging(oe_in)) THEN
		y <= q AFTER Tzx;
	    ELSE
		y <= q AFTER Tod;
	    END IF;
	ELSE
	    IF (pchanging(oe_in)) THEN
		y <= 'Z' AFTER Txz;
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Y-Feedback.
    PROCESS (y)
    BEGIN
	IF (y = '1') THEN			
	    yfb <= '1' AFTER Tio;
	ELSE
	    yfb <= '0' AFTER Tio;
	END IF;
    END PROCESS;
END sim;
