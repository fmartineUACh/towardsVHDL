--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

ENTITY c20r IS
    GENERIC (
	Tpd	: TIME	:= 25 ns;
	Tea	: TIME	:= 25 ns;
	Ter	: TIME	:= 25 ns;
	Tpzx 	: TIME 	:= 20 ns;
	Tpxz 	: TIME 	:= 20 ns;
	Tco	: TIME 	:= 15 ns;
	Ts	: TIME	:= 20 ns;
	Th	: TIME	:=  0 ns;
	Tw	: TIME	:= 15 ns);
    PORT (
	d	: IN	vlbit;
	oe	: IN	vlbit;
	clk	: IN	vlbit;
	y	: OUT	vlbit;
	qfb	: OUT	vlbit := '1');
END c20r;

ARCHITECTURE sim OF c20r IS
    SIGNAL   	q 	: vlbit	:= '0';
    SIGNAL	q_ts	: vlbit := '0';
    SIGNAL	q_th	: vlbit := '0';
    SIGNAL	q_tw	: vlbit := '0';
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
	ASSERT ((NOW = 0 ns) OR ((NOW - clklastev) >= Tw))
	    REPORT
	    "Pulse Width ERROR on CLK: Setting output to unknown"
	    SEVERITY WARNING;
	IF NOT ((NOW = 0 ns) OR ((NOW - clklastev) >= Tw)) THEN
	    q_tw <= '1'; 
	    q_tw <= transport '0' after 1 ns;
	END IF;
	clklastev := NOW;
    END PROCESS;

    -- Simulate the Register.
    PROCESS (clk, q_ts, q_th, q_tw)
    BEGIN
	IF ((q_ts = '1') OR (q_th = '1') OR (q_tw = '1')) THEN
	    q <= 'X' after Tco;
	    qfb <= 'X' after Tco;
	ELSIF (pchanging(clk) AND (clk = '1')) THEN
	    q <= d AFTER Tco;
	    qfb <= NOT d AFTER Tco;
	END IF;
    END PROCESS;

    -- Simulate the Output.
    PROCESS (oe,q)
    BEGIN
	IF (pchanging(oe)) THEN
	    IF (oe = '0') THEN
		IF (q = '1') THEN
		    y <= '0' AFTER Tpzx;
		ELSIF (q = '0') THEN
		    y <= '1' after Tpzx;
		ELSE
		    y <= 'X' after Tpzx;
		END IF;
	    ELSE
		y <= 'Z' AFTER Tpxz;
	    END IF;
	ELSE
	    IF (oe = '0') THEN
		IF (q = '1') THEN
		    y <= '0';
		ELSIF (q = '0') THEN
		    y <= '1';
		ELSE
		    y <= 'X';
		END IF;
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;
END sim;
