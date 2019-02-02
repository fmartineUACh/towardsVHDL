
--
--      Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--        as an unpublished work.
--

package c37kp IS

    type polarity IS (invt, ninv);
    type oreg_type IS (dreg, treg, oltch, cmb);
    type ireg_type IS (comb, ireg, dblireg, iltch);
    type src_type IS (src_ptm, src_adj);

    type clk_type IS (nopt, ckpt);
    type slw_type IS (fast, slow);
    type pwr_type IS (hipw, lopw);

    component c37km
    generic (
	bsel	: 	polarity := ninv;

	Ticomb	:	time := 1000 ps;
	Tod	:	time := 2000 ps;
	Txz	:	time := 5500 ps;
	Tzx	:	time := 5500 ps;
	Tsl	:	time := 2000 ps;
	slsel	: 	slw_type := fast);

    port (x	: in	vlbit;
	oe	: in	vlbit;
	y	: inout	vlbit;
	fb	: out	vlbit);
    end component;

    component c37kinp
    generic (
	iregister	: ireg_type	:= ireg;

	Tclk	:	time := 2000 ps;
	Tird	:	time :=  500 ps;
	Ticomb	:	time := 1000 ps;
	Tilat	:	time := 3500 ps;
	Tirsu	:	time := 4000 ps;
	Tirh	:	time := 0000 ps;
	Twl	:	time := 2500 ps;

	Twh	:	time := 2500 ps);

    port (d	: in	vlbit;
	clk	: in	vlbit;
	fb	: out	vlbit);
    end component;

    component c37koreg
    generic (
	oregister	: oreg_type	:= dreg;
	source		: src_type	:= src_ptm;

	Tclk	:	time := 2000 ps;
	Tird	:	time :=  500 ps;
	Tilat	:	time := 3500 ps;
	Tirsu	:	time := 4000 ps;
	Tirh	:	time :=    0 ps;
	Tord	:	time := 1000 ps;
	Tocomb	:	time :=    0 ps;
	Tolat	:	time := 2500 ps;
	Torsu	:	time := 1000 ps;
	Torh	:	time := 3500 ps;
	Tfb	:	time :=    0 ps;
	Trst	:	time := 4500 ps;
	Tpst	:	time := 4500 ps;
	Twl	:	time := 2500 ps;
	Twh	:	time := 2500 ps;
	Trw	:	time := 8000 ps;
	Trr	:	time :=10000 ps;
	Tpw	:	time := 8000 ps;
	Tpr	:	time :=10000 ps;
	Tirsupt	:	time := 3500 ps;
	Tirhpt	:	time := 1000 ps;
	Torsupt	:	time := 2500 ps;
	Torhpt	:	time := 2500 ps;

	cksel	: 	clk_type := nopt);

    port (as	: in	vlbit;
	x	: in	vlbit;
	clk	: in	vlbit;
	ar	: in	vlbit;
	fb	: out	vlbit;
	q	: inout	vlbit);
    end component;

    component c37kmux
    generic (

	Tsop	:	time := 4500 ps);

    port (x	: in	vlbit;
	fb	: out	vlbit);
    end component;

end c37kp;

