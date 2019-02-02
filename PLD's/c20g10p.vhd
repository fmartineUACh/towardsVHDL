--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c20g10p IS

    TYPE reg_def  IS (reg, comb, dblreg);	-- Noreg generic.
    TYPE polarity IS (invt, ninv);		-- Port polarity.
    TYPE fb_type  IS (xpin, xreg, adj);		-- feedback select.

    COMPONENT c20g10m
	GENERIC (
	    registered	: reg_def	:= reg;
	    inv_setting	: polarity	:= ninv;
	    bta_sel	: fb_type	:= xreg;
	    Tpd		: TIME		:= 25 ns;  -- T_25
	    Tpzx	: TIME		:= 20 ns;
	    Tpxz	: TIME		:= 20 ns;
	    Tco		: TIME		:= 15 ns;
	    Ts		: TIME		:= 15 ns;
	    Th		: TIME		:=  0 ns;
	    Twh		: TIME		:= 12 ns;
	    Twl		: TIME		:= 12 ns);

	PORT (
		d	: IN vlbit;
		clk	: IN vlbit;
		oe	: IN vlbit;
		y	: INOUT vlbit;
		fb	: OUT vlbit);
    END COMPONENT;

END c20g10p;

