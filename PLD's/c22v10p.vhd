--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c22v10p IS			-- C22V10 Specific package.
    
    TYPE reg_def  IS (reg, comb, dblreg);		-- Noreg generic.
    TYPE polarity IS (invt, ninv);	-- Port polarity.
    TYPE fb_type  IS (xpin, xreg, adj);	-- feedback type.

    COMPONENT c22v10m			-- Device C22v10 macro cell.
	GENERIC (
	    registered	: reg_def	:= reg;	-- Default is REGistered.
	    inv_setting	: polarity	:= invt; -- Default is INVerTed.
	    bta_sel	: fb_type	:= xreg; -- Default is Registered.
	    Tpd		: TIME		:= 20 ns; -- PALC22v10-20
	    Tea		: TIME		:= 20 ns;
	    Ter		: TIME		:= 20 ns;
	    Tco		: TIME		:= 12 ns;
	    Ts		: TIME		:= 12 ns;
	    Th		: TIME		:=  0 ns;
	    Twh		: TIME		:= 10 ns;
	    Twl		: TIME		:= 10 ns;
	    Tcf		: TIME		:= 10 ns;
	    Taw		: TIME		:= 20 ns;
	    Tar		: TIME		:= 20 ns;
	    Tap		: TIME		:= 25 ns;
	    Tspr	: TIME		:= 20 ns);
	PORT (
	    d	: IN	vlbit;	-- D input to register.
	    clk	: IN	vlbit;	-- Positive Edge Clock.
	    oe	: IN	vlbit;	-- Output Enable.
	    ss	: IN	vlbit;	-- Synchronous Set (chip wide).
	    ar	: IN	vlbit;	-- Asynchronous Reset (chip wide).
	    y	: INOUT	vlbit;	-- IO pin.
	    fb	: OUT	vlbit);	-- bit To Array (is output from macro cell).
    END COMPONENT;		-- End component c22v10m.
	
END c22v10p;			-- End package c22v10p;

