--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c20ra10p IS		-- C20ra10 Specific package.

    TYPE polarity IS (invt, ninv);		-- Port polarity.

    COMPONENT c20ra10m				-- Device C20ra10 macro cell.
	GENERIC (					-- Cell configuration:
	    ibr		: polarity	:= invt;	-- Default is INVerTed.
	    Tpd		: TIME		:= 15 ns;	-- C20ra10-15
	    Tpzx	: TIME		:= 12 ns;
	    Tpxz	: TIME		:= 12 ns;
	    Tco		: TIME		:= 15 ns;
	    Tsu		: TIME		:= 7 ns;
	    Th		: TIME		:= 3 ns;
	    Twh		: TIME		:= 10 ns;
	    Twl		: TIME		:= 10 ns;
	    Ts		: TIME		:= 15 ns;
	    Tr		: TIME		:= 15 ns;
	    Tarw	: TIME		:= 15 ns;
	    Tasw	: TIME		:= 15 ns;
	    Tar		: TIME		:= 10 ns;
	    Twp		: TIME		:= 15 ns;
	    Tsup	: TIME		:= 15 ns;
	    Thp		: TIME		:= 15 ns
	);
	PORT (
	    d	: IN	vlbit;	-- D input to register.
	    clk	: IN	vlbit;	-- Positive edge clock.
	    oe	: IN	vlbit;	-- Output Enable.
	    pl	: IN	vlbit;	-- Preload (Synchronous --  Active Low.)
	    as	: IN	vlbit;	-- Asynchronous Set (chip wide).
	    ar	: IN	vlbit;	-- Asynchronous Reset (chip wide).
	    y	: INOUT	vlbit;	-- IO pin.
	    yfb	: OUT	vlbit);	-- Bit To Array (is output from macro cell).
    END COMPONENT;		-- End component ra10_io.

END c20ra10p;			-- End package c20ra10p;

