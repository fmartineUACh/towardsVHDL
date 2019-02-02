
--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

library primitive;
use primitive.c37kp.all;

entity c37km is
    generic (
	bsel	: 	polarity := ninv;

	Ticomb  :       time := 1000 ps; -- Unused in this model.
	Tod     :       time := 2000 ps;
	Txz     :       time := 5500 ps;
	Tzx     :       time := 5500 ps;
	Tsl     :       time := 2000 ps;
	slsel   :       slw_type := fast);

    port (x	: in	vlbit;
	oe	: in	vlbit;
	y	: inout	vlbit;
	fb	: out	vlbit);
end c37km;

architecture sim of c37km is
begin

    -- Simulate the I/O Macro-cell.
    process (oe, x)
    begin
	if (bsel = invt) then
	    if (pchanging(oe)) then
		if (oe = '1') then

		    if (slsel = fast) then
			y <= NOT x AFTER Tzx;
		    else
			y <= NOT x AFTER (Tzx + Tsl);
		    end if;

		else

		    if (slsel = fast) then
			y <= 'Z' AFTER Txz;
		    else
			y <= 'Z' AFTER (Txz + Tsl);
		    end if;

		end if;
	    else
		if (oe = '1') then

		    if (slsel = fast) then
			y <= NOT x  AFTER Tod;
		    else
			y <= NOT x  AFTER (Tod + Tsl);
		    end if;

		else
		    y <= 'Z';
		end if;
	    end if;
	elsif (bsel = ninv) then
	    if (pchanging(oe)) then
		if (oe = '1') then

		    if (slsel = fast) then
			y <= x AFTER Tzx;
		    else
			y <= x AFTER (Tzx + Tsl);
		    end if;

		else

		    if (slsel = fast) then
			y <= 'Z' AFTER Txz;
		    else
			y <= 'Z' AFTER (Txz + Tsl);
		    end if;

		end if;
	    else
		if (oe = '1') then

		    if (slsel = fast) then
			y <= x AFTER Tod;
		    else
			y <= x AFTER (Tod + Tsl);
		    end if;

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
