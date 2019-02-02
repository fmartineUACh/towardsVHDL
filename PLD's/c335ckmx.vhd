--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c335p.all;

ENTITY c335ckmx IS
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
	clksrc	 : IN vlbit;
	clk	 : OUT vlbit);
END c335ckmx;

ARCHITECTURE sim OF c335ckmx IS
    SIGNAL	clksrc_twh	: vlbit := '0';
    SIGNAL	clksrc_twl	: vlbit := '0';
BEGIN
    -- check clksrc pulse width
    PROCESS (clksrc)
	VARIABLE clksrclastev : TIME := 0 ns;
    BEGIN
	IF (clksrc = '0') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - clksrclastev) >= Twh))
		REPORT
		"Pulse Width (H) ERROR on CLKSRC: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - clksrclastev) >= Twh)) THEN
		clksrc_twh <= '1'; 
		clksrc_twh <= transport '0' after 1 ns;
	    END IF;
	ELSIF (clksrc = '1') THEN
	    ASSERT ((NOW = 0 ns) OR ((NOW - clksrclastev) >= Twl))
		REPORT
		"Pulse Width (L) ERROR on CLKSRC: Setting output to unknown"
		SEVERITY WARNING;
	    IF NOT ((NOW = 0 ns) OR ((NOW - clksrclastev) >= Twl)) THEN
		clksrc_twl <= '1'; 
		clksrc_twl <= transport '0' after 1 ns;
	    END IF;
	END IF;
	clksrclastev := NOW;
    END PROCESS;

    -- Simulate the Clock Mux.
    PROCESS (clksrc, clksrc_twh, clksrc_twl)
    BEGIN
	IF ((clksrc_twh = '1') OR (clksrc_twl = '1')) THEN
	    clk <= 'X';
	ELSE
	    clk <= clksrc;
	END IF;
    END PROCESS;
END sim;
