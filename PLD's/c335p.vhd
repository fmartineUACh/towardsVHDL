--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c335p IS			-- C335 Specific package.
    
    TYPE reg_def IS (reg, comb, dblreg);	
    TYPE fb_type IS (xreg, xpin, adj);		-- Noreg generic.

    COMPONENT c335m			-- Device C335 macro cell.
	GENERIC (			-- Cell configuration:
	    registered	: reg_def	:= reg;		-- REGistered.
	    bta_sel	: fb_type	:= xreg;	-- REGistered.
	    Tpd		: TIME		:= 15 ns;	-- C335-83
            Twh		: TIME		:=  5 ns;
            Twl		: TIME		:=  5 ns;
            Tis		: TIME		:=  2 ns;
            Tih		: TIME		:=  2 ns;
            Tico	: TIME		:= 18 ns;
            Tpzx	: TIME		:= 12 ns;
            Tpxz	: TIME		:= 12 ns;
	    Ts		: TIME		:=  9 ns;
	    Th		: TIME		:=  0 ns;
	    Tco		: TIME		:= 10 ns;
	    Tco2	: TIME		:= 18 ns);
	PORT (
	    x1	 : IN    vlbit;		-- D input to register.
	    x2	 : IN    vlbit;		-- D input to register.
	    clk	 : IN    vlbit;		-- Positive edge clock.
	    iclk : IN    vlbit;		-- Positive edge clock.
	    ss	 : IN    vlbit;		-- Asynchronous Set (chip wide).
	    sr	 : IN    vlbit;		-- Asynchronous Reset (chip wide).
	    oe	 : IN    vlbit;		-- output enable (pin 14).
	    qfb	 : OUT   vlbit;		-- Shared Bit to array
	    fb	 : OUT   vlbit;		-- Bit To Array 
	    y	 : INOUT vlbit);	-- IO pin.
    END COMPONENT;			-- End component c335m.

    COMPONENT c335h			-- Device C335 hidden register
	GENERIC (			-- Cell configuration:
	    Tpd		: TIME		:= 15 ns;	-- C335-83
            Twh		: TIME		:=  5 ns;
            Twl		: TIME		:=  5 ns;
            Tis		: TIME		:=  2 ns;
            Tih		: TIME		:=  2 ns;
            Tico	: TIME		:= 18 ns;
            Tpzx	: TIME		:= 12 ns;
            Tpxz	: TIME		:= 12 ns;
	    Ts		: TIME		:=  9 ns;
	    Th		: TIME		:=  0 ns;
	    Tco		: TIME		:= 10 ns;
	    Tco2	: TIME		:= 18 ns);
	PORT (
	    x1	: IN  vlbit;
	    x2	: IN  vlbit;
	    clk	: IN  vlbit;
	    ss	: IN  vlbit;
	    sr	: IN  vlbit;
	    qfb	: OUT vlbit);					
    END COMPONENT;			-- End component c335h.

    COMPONENT c335ireg		-- Device C335 input register/mux
	GENERIC (
	    iregister	: reg_def	:= reg;		-- Registered.
	    Tpd		: TIME		:= 15 ns;	-- C335-83
            Twh		: TIME		:=  5 ns;
            Twl		: TIME		:=  5 ns;
            Tis		: TIME		:=  2 ns;
            Tih		: TIME		:=  2 ns;
            Tico	: TIME		:= 18 ns;
            Tpzx	: TIME		:= 12 ns;
            Tpxz	: TIME		:= 12 ns;
	    Ts		: TIME		:=  9 ns;
	    Th		: TIME		:=  0 ns;
	    Tco		: TIME		:= 10 ns;
	    Tco2	: TIME		:= 18 ns);
	PORT (
	    d	 : IN  vlbit;
	    iclk : IN  vlbit;
	    fb	 : OUT vlbit);
    END COMPONENT;			-- End component c335ireg.

    COMPONENT c335ckmx		-- Device C335 Clock Mux.
	GENERIC (
	    Tpd		: TIME		:= 15 ns;	-- C335-83
            Twh		: TIME		:=  5 ns;
            Twl		: TIME		:=  5 ns;
            Tis		: TIME		:=  2 ns;
            Tih		: TIME		:=  2 ns;
            Tico	: TIME		:= 18 ns;
            Tpzx	: TIME		:= 12 ns;
            Tpxz	: TIME		:= 12 ns;
	    Ts		: TIME		:=  9 ns;
	    Th		: TIME		:=  0 ns;
	    Tco		: TIME		:= 10 ns;
	    Tco2	: TIME		:= 18 ns);
	PORT (
	    clksrc	 : IN  vlbit;
	    clk		 : OUT vlbit);
    END COMPONENT;			-- End component c335ckmx.

END c335p;				-- End package c335p;

