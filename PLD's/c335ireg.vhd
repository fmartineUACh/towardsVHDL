--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c335p.all;

ENTITY c335ireg IS

    GENERIC (
	iregister	: reg_def	:= reg;
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
	d	: IN  vlbit;
	iclk	: IN  vlbit;
	fb	: OUT vlbit);
END c335ireg;

ARCHITECTURE sim OF c335ireg IS
    SIGNAL	iregq	  : vlbit := '0';
    SIGNAL	iregq_ts  : vlbit := '0';
    SIGNAL	iregq_th  : vlbit := '0';
    SIGNAL	iregq_twh : vlbit := '0';
    SIGNAL	iregq_twl : vlbit := '0';
BEGIN
    -- check for iclk setup/hold violations
    PROCESS (iclk, d)
	VARIABLE dlastev	: TIME := 0 ns;
	VARIABLE iclklastev	: TIME := 0 ns;
    BEGIN
	-- only if it is a registered cell.
	if (iregister = reg) then
	    -- setup check
	    IF (pchanging(iclk) AND (iclk = '1')) THEN
		ASSERT ((NOW = 0 ns) OR (NOW - dlastev) >= Tis)
		    REPORT
		    "Setup ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - dlastev) >= Tis)) THEN
		    iregq_ts <= '1'; 
		    iregq_ts <= transport '0' after 1 ns;
		END IF;
		iclklastev := NOW;
	    END IF;
	    -- hold check
	    IF (pchanging(d)) then
		ASSERT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Tih))
		    REPORT
		    "Hold ERROR ON D: Setting output to unknown" 
		    SEVERITY WARNING;
		IF NOT ((NOW = 0 ns) OR ((NOW - iclklastev) >= Tih)) THEN
		    iregq_th <= '1'; 
		    iregq_th <= transport '0' after 1 ns;
		END IF;
		dlastev := NOW;
	    END IF;
	end if;
    END PROCESS;

    -- check iclk pulse width
    PROCESS (iclk)
	VARIABLE iclklastev : TIME := 0 ns;
    BEGIN
	-- only if it is a registered cell.
	if (iregister = reg) then
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

    -- Simulate the Register
    PROCESS (iclk, iregq_ts, iregq_th, iregq_twh, iregq_twl)
    BEGIN
	IF ((iregq_ts = '1') OR (iregq_th = '1') OR (iregq_twh = '1')
	OR (iregq_twl = '1')) THEN
	    iregq <= 'X' after (Tico - Tpd);
	ELSIF ((iclk = '1') AND pchanging(iclk)) THEN
	    IF (d = '1') THEN
		iregq <= '1' AFTER (Tico - Tpd);
	    ELSE
		iregq <= '0' AFTER (Tico - Tpd);
	    END IF;
	END IF;
    END PROCESS;

    -- Simulate the Feedback Mux.
    PROCESS (d, iregq)
    BEGIN
	IF (iregister = reg) THEN
	    fb <= iregq;
	ELSIF (iregister = comb) THEN
	    IF (d = '1') THEN
		fb <= '1';
	    ELSE
		fb <= '0';
	    END IF;
	END IF;
    END PROCESS;

END sim;
