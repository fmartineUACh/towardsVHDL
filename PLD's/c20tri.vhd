--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

ENTITY c20tri IS
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
	y	: OUT	vlbit);
END c20tri;

ARCHITECTURE sim OF c20tri IS
BEGIN
    -- Simulate the Output.
    PROCESS (oe,x)
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
END sim;
