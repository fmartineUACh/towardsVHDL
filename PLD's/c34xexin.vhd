--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--

use work.c34xp.all;

ENTITY c34xexin IS
    GENERIC (
	Tin	: TIME	:=  7 ns;
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
END c34xexin;

ARCHITECTURE sim OF c34xexin IS
BEGIN

    -- Simulate the Expander Array.
    PROCESS (x, expsrc, exp)						
    BEGIN
	IF (exp = '1') THEN						
	    fb <= x AFTER Texp;
	ELSE									
	    fb <= NOT(expsrc) AFTER Texp;
	END IF;
    END PROCESS;

END sim;

