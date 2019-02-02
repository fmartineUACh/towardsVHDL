--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

library primitive;
use primitive.c37xp.all;

entity c37xprod is
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

end c37xprod;

architecture sim of c37xprod is
begin

-- Simulate the Product term.
    process (x)	
    begin
	fb <= x;
    end process;

end sim;
