--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

library primitive;
use primitive.c37xp.all;

entity c37xm is
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
end c37xm;

architecture sim of c37xm is
begin

    -- Simulate the I/O Macro-cell.
    process (oe, x)
    begin
	if (bsel = invt) then
	    if (pchanging(oe)) then
		if (oe = '1') then

		    y <= NOT x AFTER (Tzx + Tvcco);

		else

		    y <= 'Z' AFTER (Txz + Tvcco);

		end if;
	    else
		if (oe = '1') then

		    y <= NOT x  AFTER (Tod + Tvcco) ;

		else
		    y <= 'Z';
		end if;
	    end if;
	elsif (bsel = ninv) then
	    if (pchanging(oe)) then
		if (oe = '1') then

		    y <= x AFTER (Tzx + Tvcco);

		else

		    y <= 'Z' AFTER (Txz + Tvcco);

		end if;
	    else
		if (oe = '1') then

		    y <= x AFTER (Tod + Tvcco);

		else
		    y <= 'Z';
		end if;
	    end if;
	end if;
    end process;

    -- Simulate the feedback.
    process (y)
    begin

	fb <= y;

    end process;
end sim;
