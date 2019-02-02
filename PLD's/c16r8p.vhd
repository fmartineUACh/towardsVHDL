--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c16r8p IS

    COMPONENT c20r			-- Device macro cell.
	GENERIC (
	    Tpd  : TIME := 25 ns;	--	T_25
	    Tea  : TIME := 25 ns;
	    Ter  : TIME := 25 ns;
	    Tpzx : TIME := 20 ns;
	    Tpxz : TIME := 20 ns;
	    Tco  : TIME := 15 ns;
	    Ts   : TIME := 20 ns;
	    Th   : TIME :=  0 ns;
	    Tw   : TIME := 15 ns);
	PORT (
	    d	: IN	vlbit;
	    oe	: IN	vlbit;
	    clk	: IN	vlbit;
	    y	: OUT	vlbit;
	    qfb	: OUT	vlbit);
    END COMPONENT;

END c16r8p;

