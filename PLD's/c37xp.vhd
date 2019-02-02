--
--      Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--        as an unpublished work.
--

package c37xp IS

    type polarity IS (invt, ninv);
    type oreg_type IS (dreg, treg, oltch, cmb);
    type ireg_type IS (comb, ireg, dblireg, iltch);
    type src_type IS (src_ptm, src_adj);

    component c37xm
    generic (
	bsel	: 	polarity := ninv;

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );

    port (x	: in	vlbit;
	oe	: in	vlbit;
	y	: inout	vlbit;
	fb	: out	vlbit);
    end component;

    component c37xinp
    generic (
	iregister	: ireg_type	:= ireg;

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );

    port (d	: in	vlbit;
	clk	: in	vlbit;
	fb	: out	vlbit);
    end component;

    component c37xoreg
    generic (
	oregister	: oreg_type	:= dreg;
	source		: src_type	:= src_ptm;

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );

    port (as	: in	vlbit;
	x	: in	vlbit;
	clk	: in	vlbit;
	ar	: in	vlbit;
	fb	: out	vlbit;
	q	: inout	vlbit);
    end component;

    component c37xprod
    generic (

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );
    port (x	: in	vlbit;
	fb	: out	vlbit);
    end component;

    component c37xclk
    generic (
	bsel	: 	polarity := ninv;

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );
    port (x	: in	vlbit;
	fb	: out	vlbit);
    end component;

    component c37xmux
    generic (

	tCLK	:	time :=  4000 ps;
	tIRD	:	time :=  1000 ps;
	tICOMB	:	time :=  3000 ps;
	tILAT	:	time :=  5500 ps;
	tIRSU	:	time :=  6000 ps;
	tIRH	:	time :=  2000 ps;
	tSOP	:	time :=  1500 ps;
	tORD	:	time :=  1000 ps;
	tOCOMB	:	time :=  3000 ps;
	tOLAT	:	time :=  5500 ps;
	tORSU	:	time :=  4500 ps;
	tORH	:	time :=  0000 ps;
	tOD	:	time :=  1000 ps;
	tXZ	:	time :=  8500 ps;
	tZX	:	time :=  8500 ps;
	tFB	:	time :=  0000 ps;
	tRST	:	time :=  8500 ps;
	tPST	:	time :=  8500 ps;
	tWL	:	time :=  2500 ps;
	tWH	:	time :=  2500 ps;
	tRW	:	time :=  8000 ps;
	tRR	:	time := 10000 ps;
	tPW	:	time :=  8000 ps;
	tPR	:	time := 10000 ps;
	tVCCO	:	time :=     0 ps );

    port (x	: in	vlbit;
	fb	: out	vlbit);
    end component;

end c37xp;

