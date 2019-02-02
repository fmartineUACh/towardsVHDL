--
--      Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--        as an unpublished work.
--

library primitive;
use primitive.c37xp.all;

entity c37xinp IS
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
end c37xinp;

architecture sim of c37xinp is
    signal   	dclk		:	vlbit	:= '0';
    signal   	q1		:	vlbit	:= '0';
    signal	q2		:	vlbit	:= '0';
    signal	q3		:	vlbit	:= '0';
    signal	iregq_tis	: 	vlbit	:= '0';
    signal	iregq_tih	: 	vlbit	:= '0';
    signal	iregq_twh	: 	vlbit	:= '0';
    signal	iregq_twl	: 	vlbit	:= '0';
begin

    dclk <= clk;

    -- check for clk setup/hold violations
    process (dclk, d)

	variable dlastev	: time := 0 ns;
	variable clklastev	: time := 0 ns;

    begin
	-- only if not combinatorial.
	if (iregister /= comb) then
	    -- setup check
	    if (pchanging(dclk) AND (dclk = '1')) then
		assert ((dlastev = 0 ns) OR ((NOW - dlastev) >= Tirsu))
		    report
		    "Setup ERROR ON D: Setting output to unknown" 
		    severity warning;
		if NOT ((dlastev = 0 ns) OR ((NOW - dlastev) >= Tirsu)) then
		    iregq_tis <= '1'; 
		    iregq_tis <= transport '0' after 1 ns;
		end if;
		clklastev := NOW;
	    end if;

	    -- hold check
	    if (pchanging(d)) then
		asserT ((clklastev = 0 ns) OR ((NOW - clklastev) >= Tirh))
		    report
		    "Hold ERROR ON D: Setting output to unknown" 
		    severity warning;
		if NOT ((clklastev = 0 ns) OR ((NOW - clklastev) >= Tirh)) then
		    iregq_tih <= '1'; 
		    iregq_tih <= transport '0' after 1 ns;
		end if;
		dlastev := NOW;
	    end if;
	end if;
    end process;

    -- check clk pulse width
    process (dclk)

	variable clklastevhi,clklastevlo : time := 0 ns;

    begin
	-- only if not combinatorial.
	if (iregister /= comb) then
	    if (dclk = '0') then
		assert ((clklastevhi = 0 ns) OR ((NOW - clklastevhi) >= Twh))
		    report

		    "Pulse Width (H) ERROR on CLK: Setting output to unknown"
		    severity warning;
		if NOT ((clklastevhi = 0 ns) OR ((NOW-clklastevhi) >= Twh)) then
		    iregq_twh <= '1'; 
		    iregq_twh <= transport '0' after 1 ns;
		end if;
		clklastevlo := NOW;
	    elsif (dclk = '1') then
	       assert ((clklastevlo = 0 ns) OR ((NOW - clklastevlo) >= Twl))
		    report
		    "Pulse Width (L) ERROR on CLK: Setting output to unknown"
		    severity warning;
		if NOT ((clklastevlo = 0 ns) OR ((NOW-clklastevlo) >= Twl)) then
		    iregq_twl <= '1'; 
		    iregq_twl <= transport '0' after 1 ns;
		end if;
		clklastevhi := NOW;
	    end if;
	end if;
    end process;

    -- Simulate the Register.
    process (d, dclk, iregq_tis, iregq_tih, iregq_twh, iregq_twl)
    begin
	if ((iregq_tis = '1') OR (iregq_tih = '1') OR (iregq_twh = '1')
	OR (iregq_twl = '1')) then
	    q1 <= 'X' after Tird;
	    q2 <= 'X' after Tird;
	    q3 <= 'X' after Tird;
	elsif (pchanging(dclk) AND (dclk = '1')) then
	    q1 <= d after Tird;
	    q2 <= q1 after Tird;
	    q3 <= d after Tird;
	elsif (dclk = '1') then
	    q3 <= d after Tilat;
	end if;
    end process;

    -- Simulate the Mux.
    process (q1, q2, q3, d)
    begin
	if (iregister = comb) then
	    fb <= d after Ticomb;
	elsif (iregister = ireg) then
	    fb <= q1;
	elsif (iregister = dblireg) then	
	    fb <= q2;
	elsif (iregister = iltch) then
	    fb <= q3;
	end if;
    end process;
end sim;
