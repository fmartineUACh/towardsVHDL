--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

PACKAGE c34xp IS			-- C340 Specific package.

    COMPONENT c34xm			-- Device C340 macro cell.
	GENERIC (				-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);

	PORT (
	x1	: IN	vlbit;		-- D input to register.
	x2	: IN	vlbit;		-- D input to register.
	as	: IN	vlbit;		-- Asynchronous Set (chip wide).
	ar	: IN	vlbit;		-- Asynchronous Reset (chip wide).
	clkpt	: IN	vlbit;		-- Positive edge clock.
	clklab	: IN	vlbit;		-- Positive System Clock.
	clksel	: IN	vlbit;		-- Clock select.
	oe	: IN	vlbit;		-- output enable.
	y	: INOUT	vlbit;		-- IO pin.
	qfb	: OUT	vlbit;		-- Bit to Array.
	yfb	: OUT	vlbit);		-- To feedback mux adjacent macrocell.

    END COMPONENT;			-- End component c34xm.

    COMPONENT c34xh
	GENERIC (				-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);
	PORT (
	x1	: IN	vlbit;
	x2	: IN	vlbit;
	as	: IN	vlbit;
	ar	: IN	vlbit;
	clkpt	: IN	vlbit;
	clklab	: IN	vlbit;
	clksel	: IN	vlbit;
	exp	: IN	vlbit; 
	qfb	: OUT	vlbit);

    END COMPONENT;			 -- End component c34xh.

    COMPONENT c34xexp
	GENERIC (				-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);
	PORT (
	x	: IN	vlbit;
	expsrc	: IN	vlbit;
	exp	: IN	vlbit;
	fb	: OUT	vlbit);

    END COMPONENT;			-- End component c34xexp

    COMPONENT c34xin
	GENERIC (			-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);
	PORT (
	    x	: IN	vlbit;
	    fb	: OUT	vlbit);

    END COMPONENT;			-- End component c34xin

    COMPONENT c34xpia 
	GENERIC (			-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);
        PORT (
	    x	: IN	vlbit;
	    fb	: OUT	vlbit);
    END COMPONENT;			-- End component c34xpia

    COMPONENT c34xexin 
	GENERIC (				-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);
	PORT (
	    x		: IN vlbit;	-- Array input (product term)
	    expsrc	: IN vlbit;	-- Input from mcell pin
	    exp		: IN vlbit;	-- Select Signal from mcell
	    fb		: OUT vlbit);
    END COMPONENT;				-- End entity c34xexin.

    COMPONENT c34xckmx 
	GENERIC (				-- Cell configuration:
	Tin	: TIME	:=  7 ns;	-- Defaults to C341-30
	Texp	: TIME	:= 14 ns;
	Tpia	: TIME	:= 16 ns;
	Tlac	: TIME	:= 12 ns;
	Tlad	: TIME	:= 14 ns;
	Tic	: TIME	:= 16 ns;
	Tics	: TIME	:=  2 ns;
	Tclr	: TIME	:=  6 ns;
	Tpre	: TIME	:=  6 ns;
	Trsu	: TIME	:=  8 ns;
	Trh	: TIME	:=  8 ns;
	Tcomb	: TIME	:=  4 ns;
	Tlatch	: TIME	:=  4 ns;
	Trd	: TIME	:=  2 ns;
	Tio	: TIME	:=  6 ns;
	Tod	: TIME	:=  5 ns;
	Txz	: TIME	:= 11 ns;
	Tzx	: TIME	:= 11 ns;
	Tfd	: TIME	:=  1 ns;
	Tpcw	: TIME 	:=  6 ns;
	Tpcr	: TIME	:=  6 ns;
	Tch	: time	:= 10 ns;
	Tcl	: TIME	:= 10 ns);
	PORT (
	    x		: IN vlbit;
	    oe		: IN vlbit;
	    fb		: OUT vlbit);
    END COMPONENT;

END c34xp;				-- End package c34xp;
