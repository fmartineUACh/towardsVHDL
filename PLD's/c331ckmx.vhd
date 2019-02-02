--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c331p.all;

ENTITY c331ckmx IS
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
	clksrc	 : IN vlbit;
	clk	 : OUT vlbit);
END c331ckmx;

ARCHITECTURE sim OF c331ckmx IS
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
