--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c16v8p IS			-- C16V8 Specific package.
    
    TYPE reg_def  IS (reg, comb);	-- Noreg generic.
    TYPE polarity IS (invt, ninv);	-- Port polarity.
    TYPE fb_type  IS (xpin, xreg, xadj);-- feedback type.

    COMPONENT c16v8m			-- Device C16V8 macro cell.
	GENERIC (
	    registered	: reg_def	:= reg;  -- Default is REGistered.
	    inv_setting	: polarity	:= invt; -- Default is INVerTed.
	    bta_sel	: fb_type	:= xreg; -- Default is Registered.
	    Tpd		: TIME		:= 10 ns;
	    Ten		: TIME		:= 10 ns;
	    Tdis	: TIME		:= 10 ns;
	    Tco		: TIME		:=  7 ns;
	    Tsu		: TIME		:=  7 ns;
	    Th		: TIME		:=  0 ns;
	    Twh		: TIME		:=  8 ns;
	    Twl		: TIME		:=  8 ns;
	    Tcf		: TIME		:=  6 ns);
	PORT (
	    d	: IN	vlbit;	-- D input to register.
	    clk	: IN	vlbit;	-- Positive Edge Clock.
	    oe	: IN	vlbit;	-- Output Enable.
	    adj	: IN	vlbit;	-- Adjacent cell feedback.
	    y	: INOUT	vlbit;	-- IO pin.
	    fb	: OUT	vlbit;	-- signal to Array.
	    yfb	: OUT	vlbit);	-- signal to adjacent cell.
    END COMPONENT;
	
END c16v8p;
