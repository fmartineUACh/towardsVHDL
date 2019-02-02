--------------------------------------------------------------------------------
--
--              Copyright Cypress Semiconductor		1999
--              Protected as an unpublished work.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity c39kck is
    generic (
	cfgbits	: Bit_Vector(63 downto 0);
	xplPulseWthLo		: time;
	xplPulseWthHi		: time;
	xplEdgeUncertainty	: time;
	xplMinPinClkPeriod	: time;
	xplMaxPinClkPeriod	: time;
	xplLockTime		: time;
	xplClkTreeDelay		: time;
	xckPin2GClkDirect	: time;
	xckPin2GClkViaPLL	: time);
    port (
	clk	: in	std_logic_vector(3 downto 0);
	nios	: in	std_logic;
	lock	: out	std_logic;
	glclk	: out	std_logic_vector(3 downto 0));
end c39kck;

architecture sim of c39kck is

    -- To use the real silicon time, replace 3 us with xplLockTime.
    constant simLockTime: time := 3 us;
    constant LockNote	: string :=
    "The actual Lock Time of 3 ms has been reduced to 3 us for simulation.";

    signal clk_01	: std_logic_vector(3 downto 0);
    signal feedback	: std_logic := '0';
    signal intclk	: std_logic := '0';
    signal plllock	: std_logic := '0';
    signal syncb	: std_logic := '1';
    signal align	: std_logic := '1';
    signal cy		: time := 0 ns;
    signal mult		: natural;
    signal pllclk	: std_logic_vector(3 downto 0);
    signal hold		: std_logic_vector(3 downto 0) := (others => '0');
    signal pllout	: std_logic_vector(7 downto 0);

    constant clk_high		: string :=
    "Clock high width violation:";
    constant clk_low		: string :=
    "Clock low width violation:";
    constant clk_cycle_max	: string :=
    "Clock cycle maximum width violation:";
    constant clk_cycle_min	: string :=
    "Clock cycle minimum width violation:";

begin

    clk_01 <= to_X01(clk);

    -- check clk cycle, high and low times.
    process (clk_01(0))
	variable clkhi, clklo : time := 0 ns;
    begin
	if (cfgbits(0) = '1') then
	    if (clk_01(0) = '0') then
		if NOT ((clkhi = 0 ns) OR ((NOW-clkhi) >= xplPulseWthHi)) then
		    assert (false)
			report clk_high
			severity failure;
		end if;
		clklo := NOW;
	    elsif (clk_01(0) = '1') then
		if NOT ((clklo = 0 ns) OR ((NOW-clklo) >= xplPulseWthLo)) then
		   assert (false)
			report clk_low
			severity failure;
		end if;
		if NOT((clkhi=0 ns)OR((NOW-clkhi) >= xplMinPinClkPeriod)) then
		    assert (false)
			report clk_cycle_min
			severity failure;
		end if;
		if NOT((clkhi=0 ns)OR((NOW-clkhi) <= xplMaxPinClkPeriod)) then
		    assert (false)
			report clk_cycle_max
			severity failure;
		end if;
		clkhi := NOW;
	    end if;
	end if;
    end process;

    -- Get the feedback
    process (clk_01)
    begin
	if (cfgbits(0) = '1') then
	    case cfgbits(5 downto 4) is
		when "11" => feedback <= '0';
		    assert(false)
		    report "Illegal PLL feedback select."
		    severity failure;
		when "10" => feedback <= clk_01(1);
		when "01" => feedback <= clk_01(0) after xplClkTreeDelay;
		when "00" => feedback <= clk_01(0);
	    end case;
	end if;
    end process;

    mult <= 6  when (cfgbits(3 downto 1)) = "111" else
	    5  when (cfgbits(3 downto 1)) = "110" else
	    3  when (cfgbits(3 downto 1)) = "101" else
	    16 when (cfgbits(3 downto 1)) = "100" else
	    8  when (cfgbits(3 downto 1)) = "011" else
	    4  when (cfgbits(3 downto 1)) = "010" else
	    2  when (cfgbits(3 downto 1)) = "001" else
	    1  when (cfgbits(3 downto 1)) = "000";

    assert NOT(mult=6) report "Illegal PLL multiply mode (6)." severity failure;
    assert NOT(mult=5) report "Illegal PLL multiply mode (5)." severity failure;
    assert NOT(mult=3) report "Illegal PLL multiply mode (3)." severity failure;
    assert NOT(mult=16)report "Illegal PLL multiply mode (16)."severity failure;


    -- PLL and clock multiplier
    process (clk_01(0), feedback)
	variable fbevent: time := 0 ps;
	variable fbwidth: time := 0 ps;
	variable ckevent: time := 0 ps;
	variable ckwidth: time := 0 ps;
	variable kpwidth: time := 0 ps;
	variable width	: time := 0 ps;
	variable edges	: time := 0 ps;
	variable clock	: std_logic := '1';
    begin

	if (cfgbits(0) = '1') then

	    if (rising_edge(clk_01(0))) then
		kpwidth := ckwidth;
		ckwidth := NOW - ckevent;
	    	ckevent := NOW;
	    end if;

	    if (rising_edge(feedback)) then
		fbwidth := NOW - fbevent;
	    	fbevent := NOW;
	    end if;

	    if (rising_edge(feedback)) then
		if ((((ckwidth-fbwidth > xplEdgeUncertainty)
		  OR (fbwidth-ckwidth > xplEdgeUncertainty))
			AND (plllock = '1'))
		  OR ((ckwidth-kpwidth > xplEdgeUncertainty)
		  OR (kpwidth-ckwidth > xplEdgeUncertainty))) then
		    plllock <= '0';
		    syncb   <= '1';
		    assert (NOW <= xplEdgeUncertainty)
		    report LockNote
		    severity note;
		elsif (((ckwidth-fbwidth <= xplEdgeUncertainty)
		    AND (fbwidth-ckwidth <= xplEdgeUncertainty))) then
		    plllock <= transport '1' after   simLockTime;
		    syncb   <= transport '0' after 1*simLockTime/4;
		end if;
	    end if;

	    if (rising_edge(clk_01(0))) then
		width := (NOW - edges)/(mult*2);
		edges :=  NOW;
		for i in 1 to 2*mult loop
		    clock := NOT clock;
		    intclk <= transport clock after (i * width);
		end loop;
	    end if;
	else
	    intclk <= '0';
	end if;
	if rising_edge(clk_01(0)) then
	    align <= syncb after (mult*width*2);
	end if;
    end process;

    -- lock detect select
    process (plllock, nios)
    begin

	if (cfgbits(0) = '1') then
	    case cfgbits(42) is
		when '1' => lock <= plllock;
		when '0' => lock <= nios;
	    end case;
	end if;

    end process;

    -- phase shifter
    process (intclk, syncb)
	variable width	: time := 0 ns;
	variable edges	: time := 0 ns;
	variable ed	: time := 0 ns;
    begin

	if (cfgbits(0) = '1') then
	    width := (NOW - edges);
	    edges := NOW;
	pllout(7) <= transport intclk OR syncb after width*1.75; -- 315 degrees
        pllout(6) <= transport intclk OR syncb after width*1.50; -- 270 degrees
        pllout(5) <= transport intclk OR syncb after width*1.25; -- 225 degrees
        pllout(4) <= transport intclk OR syncb after width*1.00; -- 180 degrees
        pllout(3) <= transport intclk OR syncb after width*0.75; -- 135 degrees
        pllout(2) <= transport intclk OR syncb after width*0.50; --  90 degrees
        pllout(1) <= transport intclk OR syncb after width*0.25; --  45 degrees
        pllout(0) <= transport intclk OR syncb after width*0.00; --   0 degrees
	end if;

	if intclk'event then cy <= (NOW - ed); ed := NOW; end if;

    end process;

    -- divider
    process (pllout, align)
	type intarray is array (3 downto 0) of natural;
    	variable divide : intarray;
    	variable phase  : intarray;
    begin

	if (cfgbits(0) = '1') then
	    if (align = '1') then
		pllclk <= (others => '1');
	    else
		for i in 0 to 3 loop
		    if (cfgbits(22 + i*5) = '1') then
			divide(i) := 1;
			if    (cfgbits(21+i*5 downto 18+i*5) = "0110") then
			    phase(i) := 315;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0101") then
			    phase(i) := 270;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0100") then
			    phase(i) := 225;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0011") then
			    phase(i) := 180;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0010") then
			    phase(i) := 135;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0001") then
			    phase(i) :=  90;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0000") then
			    phase(i) :=  45;
			else
			    assert(false)
			    report "Illegal phase and divide select."
			    severity failure;
			end if;
		    else
			if    (cfgbits(8+i*3 downto 6+i*3)="111") then
			    divide(i) := 6;
			elsif (cfgbits(8+i*3 downto 6+i*3)="110") then
			    divide(i) := 5;
			elsif (cfgbits(8+i*3 downto 6+i*3)="101") then
			    divide(i) := 3;
			elsif (cfgbits(8+i*3 downto 6+i*3)="100") then
			    divide(i) := 16;
			elsif (cfgbits(8+i*3 downto 6+i*3)="011") then
			    divide(i) := 8;
			elsif (cfgbits(8+i*3 downto 6+i*3)="010") then
			    divide(i) := 4;
			elsif (cfgbits(8+i*3 downto 6+i*3)="001") then
			    divide(i) := 2;
			elsif (cfgbits(8+i*3 downto 6+i*3)="000") then
			    divide(i) := 1;
			end if;

			if    (cfgbits(21+i*5 downto 18+i*5) = "1110") then
			    phase(i) := 315;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "1101") then
			    phase(i) := 270;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "1100") then
			    phase(i) := 225;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "1011") then
			    phase(i) := 180;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "1010") then
			    phase(i) := 135;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "1001") then
			    phase(i) :=  90;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "1000") then
			    phase(i) :=  45;
			elsif (cfgbits(21+i*5 downto 18+i*5) = "0000") then
			    phase(i) :=   0;
			else
			    assert(false)
			    report "Illegal phase select."
			    severity failure;
			end if;
		    end if;
		    case phase(i) is
		    when 315 =>
		    if (pllout(7)'event AND pllout(7)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when 270 =>
		    if (pllout(6)'event AND pllout(6)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when 225 =>
		    if (pllout(5)'event AND pllout(5)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when 180 =>
		    if (pllout(4)'event AND pllout(4)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when 135 =>
		    if (pllout(3)'event AND pllout(3)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when  90 =>
		    if (pllout(2)'event AND pllout(2)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when  45 =>
		    if (pllout(1)'event AND pllout(1)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;
		    when   0 =>
		    if (pllout(0)'event AND pllout(0)='1' AND hold(i)='0') then
			hold(i)   <= '1';
			pllclk(i) <= transport '0' after divide(i) * cy;
			hold(i)   <= transport '0' after divide(i) * cy * 2;
			pllclk(i) <= transport '1' after divide(i) * cy * 2;
		    end if;

		    when others	=> assert(false)
				report "Illegal Phase select."
				severity failure;
		    end case;
		end loop;
	    end if;
	end if;
    end process;

    -- global clock output mux
    process (pllclk, clk_01, intclk)
    begin

	for i in 3 downto 0 loop
	    if (cfgbits(38+i) = '1') then
		if (cfgbits(0) = '1') then
		    if (syncb = '0') then
			glclk(i)<= pllclk(i) after xckPin2GClkViaPLL;
		    else
			glclk(i)<= intclk    after xckPin2GClkViaPLL;
		    end if;
		else
		    assert(false)
		    report "PLL powered down, no signal available for output."
		    severity failure;
		end if;
	    else
		glclk(i)<= clk_01(i) after xckPin2GClkDirect;
	    end if;
	end loop;

    end process;

end sim;
