--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

ENTITY c20m IS
    GENERIC (
	Tpd	: TIME	:= 25 ns;
	Tea	: TIME	:= 25 ns;
	Ter	: TIME	:= 25 ns;
	Tpzx 	: TIME 	:= 20 ns;
	Tpxz 	: TIME 	:= 20 ns;
	Tco	: TIME 	:= 15 ns;
	Ts	: TIME	:= 20 ns;
	Th	: TIME	:=  0 ns;
	Tw	: TIME	:= 15 ns);
    PORT (
	x	: IN	vlbit;
	oe	: IN	vlbit;
	y	: INOUT	vlbit;
	yfb	: OUT	vlbit);
END c20m;

ARCHITECTURE sim OF c20m IS

BEGIN
    -- resolves tristate
    PROCESS (oe, x)
    BEGIN
	IF (pchanging(oe)) THEN
	    IF (oe = '1') THEN
		IF (x = '1') THEN
		    y <= '0' AFTER Tea;
		ELSE
		    y <= '1' AFTER Tea;
		END IF;
	    ELSE
		y <= 'Z' AFTER Ter;
	    END IF;
	ELSE
	    IF (oe = '1') THEN
		IF (x = '1') THEN
		    y <= '0' AFTER Tpd;
		ELSE
		    y <= '1' AFTER Tpd;
		END IF;
	    ELSE
		y <= 'Z';
	    END IF;
	END IF;
    END PROCESS;

    -- resolves node contention
    PROCESS (y)
    BEGIN
	IF (y = '1') THEN
	    yfb <= '1';
	ELSE
	    yfb <= '0';
	END IF;
    END PROCESS;

END sim;
