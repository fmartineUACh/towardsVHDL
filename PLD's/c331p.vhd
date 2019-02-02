--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c331p IS			-- C331 Specific package.

    COMPONENT c331ckmx
	GENERIC (
	    Tpd		: TIME		:= 20 ns;	--cy7c331-20
	    Tico	: TIME		:= 35 ns;
	    Tioh	: TIME		:=  5 ns;
	    Tis		: TIME		:=  2 ns;
	    Tih		: TIME		:= 11 ns;
	    Tiar	: TIME		:= 35 ns;
	    Tirw	: TIME		:= 35 ns;
	    Tirr	: TIME		:= 35 ns;
	    Tias	: TIME		:= 35 ns;
	    Tisw	: TIME		:= 35 ns;
	    Tisr	: TIME		:= 35 ns;
	    Twh		: TIME		:= 12 ns;
	    Twl		: TIME		:= 12 ns;
	    Tco		: TIME		:= 20 ns;
	    Ts		: TIME		:= 12 ns;
	    Th		: TIME		:=  8 ns;
	    Toar	: TIME		:= 20 ns;
	    Torw	: TIME		:= 20 ns;
	    Torr	: TIME		:= 20 ns;
	    Toas	: TIME		:= 20 ns;
	    Tosw	: TIME		:= 20 ns;
	    Tosr	: TIME		:= 20 ns;
	    Tpzx	: TIME		:= 20 ns;
	    Tpxz	: TIME		:= 20 ns);
	PORT (
	    clksrc	:IN	vlbit;
	    clk		:OUT	vlbit);
    END COMPONENT;

    COMPONENT c331m
	GENERIC (
	    Tpd		: TIME		:= 20 ns;	--cy7c331-20
	    Tico	: TIME		:= 35 ns;
	    Tioh	: TIME		:=  5 ns;
	    Tis		: TIME		:=  2 ns;
	    Tih		: TIME		:= 11 ns;
	    Tiar	: TIME		:= 35 ns;
	    Tirw	: TIME		:= 35 ns;
	    Tirr	: TIME		:= 35 ns;
	    Tias	: TIME		:= 35 ns;
	    Tisw	: TIME		:= 35 ns;
	    Tisr	: TIME		:= 35 ns;
	    Twh		: TIME		:= 12 ns;
	    Twl		: TIME		:= 12 ns;
	    Tco		: TIME		:= 20 ns;
	    Ts		: TIME		:= 12 ns;
	    Th		: TIME		:=  8 ns;
	    Toar	: TIME		:= 20 ns;
	    Torw	: TIME		:= 20 ns;
	    Torr	: TIME		:= 20 ns;
	    Toas	: TIME		:= 20 ns;
	    Tosw	: TIME		:= 20 ns;
	    Tosr	: TIME		:= 20 ns;
	    Tpzx	: TIME		:= 20 ns;
	    Tpxz	: TIME		:= 20 ns);
	PORT (
	    x1	 :IN	vlbit;	-- D input to register.
	    x2	 :IN	vlbit;	-- D input to register.
	    clk	 :IN	vlbit;	-- Positive edge clock.
	    iclk :IN	vlbit;	-- Positive edge clock.
	    oe	 :IN	vlbit;	-- output enable
	    as	 :IN	vlbit;	-- Asynchronous Set (chip wide).
	    ar	 :IN	vlbit;	-- Asynchronous Reset (chip wide).
	    ias	 :IN	vlbit;
	    iar	 :IN	vlbit;
	    qfb	 :OUT	vlbit;		-- Bit to Array.
	    y	 :INOUT	vlbit;		-- IO pin
	    qifb :OUT	vlbit);		-- Shared Bit to array
    END COMPONENT;			-- End component c331m.

END c331p;				-- End package c331p;

