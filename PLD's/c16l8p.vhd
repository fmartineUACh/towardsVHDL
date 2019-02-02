--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c16l8p IS

    COMPONENT c20m
	GENERIC (
	    Tpd  : TIME := 25 ns;	--	T_25
	    Tea  : TIME := 25 ns;
	    Ter  : TIME := 25 ns;
	    Tpzx : TIME := 20 ns;
	    Tpxz : TIME := 20 ns;
	    Tco  : TIME := 15 ns;
	    Ts 	 : TIME := 20 ns;
	    Th 	 : TIME :=  0 ns;
	    Tw 	 : TIME := 15 ns);
	PORT (
	    x	: IN	vlbit;
	    oe	: IN	vlbit;
	    y	: INOUT	vlbit;
	    yfb	: OUT	vlbit);
    END COMPONENT;

    COMPONENT c20tri
	GENERIC (
	    Tpd	 : TIME	:= 25 ns;	--	T_25
	    Tea	 : TIME	:= 25 ns;
	    Ter	 : TIME	:= 25 ns;
	    Tpzx : TIME := 20 ns;
	    Tpxz : TIME := 20 ns;
	    Tco	 : TIME	:= 15 ns;
	    Ts	 : TIME	:= 20 ns;
	    Th	 : TIME	:=  0 ns;
	    Tw	 : TIME	:= 15 ns);
	PORT (
	    x	: IN	vlbit;
	    oe	: IN	vlbit;
	    y	: OUT	vlbit);
    END COMPONENT;

END c16l8p;
