
--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

library primitive;
use primitive.c37kp.all;

entity c37kmux is
    generic (

	Tsop	:	time := 4500 ps);

    port (x	: in	vlbit;

	fb	: out	vlbit := '0');

end c37kmux;

architecture sim of c37kmux is
begin

    -- Simulate the PIM.
    process (x)
    begin

	if (x = '1') OR (x = '0') then
	    fb <= x AFTER Tsop;
	else
	    fb <= 'X' AFTER Tsop;
	end if;

    end process;

end sim;
