--------------------------------------------------------------------------------
-- 
--              Copyright Cypress Semiconductor, 2000
--              Protected as an unpublished work.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c2gsp.all;

entity c25g01serdes is
    port(txd		: in	std_logic_vector (15 downto 0);
	fifo_rstb	: in	std_logic;
	loop_time	: in	std_logic;
	diagloop	: in	std_logic;
	loopa		: in	std_logic;
	lineloop	: in	std_logic;
	resetb		: in	std_logic;
	pwrdnb		: in	std_logic;
	lockrefb	: in	std_logic;
	refclk_n	: in	std_logic;
	refclk_p	: in	std_logic;
	serial_in_n	: in	std_logic := '0';
	serial_in_p	: in	std_logic := '1';
	sd		: in	std_logic := '0';
	serial_out_n	: out	std_logic;
	serial_out_p	: out	std_logic;
	fifo_err	: out	std_logic;
	txclk		: out	std_logic;
	rxd		: out	std_logic_vector (15 downto 0);
	rxclk		: out	std_logic;
	lfib		: out	std_logic);
end c25g01serdes;

architecture sim of c25g01serdes is

    signal refclk	: std_logic;
    signal rd_in	: std_logic;
    signal td_out	: std_logic;
    signal txclki	: std_logic;
    signal t_rxd	: std_logic_vector (15 downto 0);
    signal t_txclk	: std_logic;
    signal t_fifo_err	: std_logic;
    signal t_rxclk	: std_logic;

    signal in_there	: std_logic;
    signal in_there_x	: std_logic;
    signal in_there_d	: std_logic;
    signal locked	: std_logic;
    signal duration_in		: real := 6425.0/16.0;
    signal duration_in_0	: real := 0.0;
    signal refclk_period	: real := 0.0;
    signal timestamp_in_0	: time := 0 ps;
    signal timestamp_in_1	: time := 0 ps;

    constant txclk_period_min	: time	:= 6380 ps;
    constant txclk_period_max	: time	:= 6470 ps;
    constant txclk_period_vio	: string
	:= "ERROR-001: TXCLK Period Violation";

    constant txclk_dutycy_min	: real	:= 0.43;
    constant txclk_dutycy_max	: real	:= 0.57;
    constant txclk_dutycy_vio	: string
	:= "ERROR-002: TXCLK Duty-cycle Violation";

    constant rxclk_period_min	: time	:= 6380 ps;
    constant rxclk_period_max	: time	:= 6470 ps;
    constant rxclk_period_vio	: string
	:= "ERROR-005: RXCLK Period Violation";

    constant rxclk_dutycy_min	: real	:= 0.43;
    constant rxclk_dutycy_max	: real	:= 0.57;
    constant rxclk_dutycy_vio	: string
	:= "ERROR-006: RXCLK Duty Cycle Violation";

    constant rfclk_period_min	: time	:= 6380 ps;
    constant rfclk_period_max	: time	:= 6470 ps;
    constant rfclk_period_vio	: string
	:= "ERROR-007: REFCLK Period Violation";

    constant rfclk_dutycy_min	: real	:= 0.35;
    constant rfclk_dutycy_max	: real	:= 0.65;
    constant rfclk_dutycy_vio	: string
	:= "ERROR-008: REFCLK Duty Cycle Violation";

    constant rfclk_freqtol	: real	:= 0.0001; -- +/- 100 ppm
    constant rfclk_freqtol_vio : string
	:= "ERROR-009: REFCLK Frequency Tolerance Violation";


    constant txds		: time	:= 1500 ps;
    constant txds_vio		: string
	:= "ERROR-010: Write Data setup Violation to posedge of TXCLK";

    constant txdh		: time	:= 500 ps;
    constant txdh_vio		: string
	:= "ERROR-011: Write Data Hold Violation from posedge of TXCLK";

    constant rxds		: time	:= 2200 ps;
    constant rxds_vio		: string
	:= "ERROR-012: Recovered Data Setup Violation w.r.t. posedge of REFCLK";

    constant rxdh		: time	:= 2200 ps;
    constant rxdh_vio		: string
	:= "ERROR-013: Recovered Data Hold Violation w.r.t. posedge of REFCLK";

begin

    -- check txclk period and duty cycle
    process (t_txclk)
	variable txckhi	: time := 0 ns;
	variable txcklo	: time := 0 ns;
	variable tcy	: real;
    begin
	if (pwrdnb = '1') then
	    if (t_txclk = '0') then
		txcklo := NOW;
	    elsif (t_txclk = '1') then
		if ((txckhi /= 0 ns) AND (txcklo /= 0 ns)) then
		    tcy := (time_to_real(NOW-txcklo)/time_to_real(NOW-txckhi));
		    if((tcy < txclk_dutycy_min) OR (tcy > txclk_dutycy_max))then
			assert (locked /= '1')
			    report txclk_dutycy_vio severity warning;
		    end if;
		end if;
		if (((txckhi/=0 ns) AND ((NOW-txckhi) < txclk_period_min)) OR
		    ((txckhi/=0 ns) AND ((NOW-txckhi) > txclk_period_max))) then
		    assert (locked /= '1')
			report txclk_period_vio severity warning;
		end if;
		txckhi := NOW;
	    end if;
	end if;
    end process;

    -- check transmit data setup and hold
    process (txd, t_txclk)
    	variable tdataevent : time := 0 ns;
    	variable tclkevent  : time := 0 ns;
    begin
	if (pwrdnb = '1') then
	    if (rising_edge(t_txclk)) then
		if ((tdataevent /= 0 ns) AND
		    ((NOW - tdataevent) < txds)) then
		    assert (locked /= '1')
			report txds_vio severity warning;
		end if;
		tclkevent := NOW;
	    elsif (txd'event) then
		if ((tclkevent /= 0 ns) AND
		    ((NOW - tclkevent) < txdh)) then
		    assert (locked /= '1')
			report txdh_vio severity warning;
		end if;
		tdataevent := NOW;
	    end if;
	end if;
    end process;

    -- check rxclk period and duty cycle
    process (t_rxclk)
	variable rxckhi	: time := 0 ns;
	variable rxcklo	: time := 0 ns;
	variable rcy	: real;
    begin
	if (pwrdnb = '1') then
	    if (t_rxclk = '0') then
		rxcklo := NOW;
	    elsif (t_rxclk = '1') then
		if ((rxckhi /= 0 ns) AND (rxcklo /= 0 ns)) then
		    rcy := (time_to_real(NOW-rxcklo)/time_to_real(NOW-rxckhi));
		    if((rcy < rxclk_dutycy_min) OR (rcy > rxclk_dutycy_max))then
			assert (locked /= '1')
			    report rxclk_dutycy_vio severity warning;
		    end if;
		end if;
		if (((rxckhi/=0 ns) AND ((NOW-rxckhi) < rxclk_period_min)) OR
		    ((rxckhi/=0 ns) AND ((NOW-rxckhi) > rxclk_period_max))) then
		    assert (locked /= '1')
			report rxclk_period_vio severity warning;
		end if;
		rxckhi := NOW;
	    end if;
	end if;
    end process;

    -- check recovered data setup and hold
    process (t_rxd, t_rxclk)
    	variable rdataevent : time := 0 ns;
    	variable rclkevent  : time := 0 ns;
    begin
	if (pwrdnb = '1') then
	    if (rising_edge(t_rxclk)) then
		if ((rdataevent /= 0 ns) AND
		    ((NOW - rdataevent) < rxds)) then
		    assert (locked /= '1')
			report rxds_vio severity warning;
		end if;
		rclkevent := NOW;
	    elsif (t_rxd'event) then
		if ((rclkevent /= 0 ns) AND
		    ((NOW - rclkevent) < rxdh)) then
		    assert (locked /= '1')
			report rxdh_vio severity warning;
		end if;
		rdataevent := NOW;
	    end if;
	end if;
    end process;

    -- check refclk period and duty cycle
    process (refclk)
	variable rfckhi	: time := 0 ns;
	variable rfcklo	: time := 0 ns;
	variable fcy	: real;
    begin
	if (pwrdnb = '1') then
	    if (refclk = '0') then
		rfcklo := NOW;
	    elsif (refclk = '1') then
		if ((rfckhi /= 0 ns) AND (rfcklo /= 0 ns)) then
		    fcy := (time_to_real(NOW-rfcklo)/time_to_real(NOW-rfckhi));
		    if((fcy < rfclk_dutycy_min) OR (fcy > rfclk_dutycy_max))then
			assert (locked /= '1')
			    report rfclk_dutycy_vio severity warning;
		    end if;
		end if;
		refclk_period <= time_to_real(NOW - rfckhi);
		if (((rfckhi/=0 ns) AND ((NOW-rfckhi) < rfclk_period_min)) OR
		    ((rfckhi/=0 ns) AND ((NOW-rfckhi) > rfclk_period_max))) then
		    assert (locked /= '1')
			report rfclk_period_vio severity warning;
		end if;
		rfckhi := NOW;
	    end if;
	end if;
    end process;

    -- check refclk freqency tolerance
    process (rd_in, pwrdnb)
    begin
	if (pwrdnb = '1') then
	    timestamp_in_0 <= NOW;
	    timestamp_in_1 <= timestamp_in_0;
	    in_there <= '1';
	end if;
    end process;

    process (rd_in)
    begin
	if ((pwrdnb = '1') AND rising_edge(rd_in)) then
	    in_there_x <= in_there;
	    in_there_d <= in_there_x;
	end if;
    end process;

    process (timestamp_in_0, timestamp_in_1)
    begin
    	duration_in_0 <= time_to_real(timestamp_in_0 - timestamp_in_1);
    end process;

    process (duration_in_0, refclk_period, pwrdnb)
    begin
	if ((pwrdnb = '1') AND (refclk_period > 0.0) AND
	((16.0 * duration_in_0)/refclk_period <= (1.0 + rfclk_freqtol) AND
	((16.0 * duration_in_0)/refclk_period >= (1.0 - rfclk_freqtol)))) then
	    duration_in <= duration_in_0;
	end if;
    end process;

    process (refclk)
    begin
	if ((pwrdnb = '1') AND (rising_edge(refclk)) AND (in_there_d = '1')
	    AND (resetb = '1') AND (refclk_period > 0.0) AND
	    ((16.0 * duration_in)/refclk_period > (1.0 + rfclk_freqtol) OR
	    ((16.0 * duration_in)/refclk_period < (1.0 - rfclk_freqtol)))) then
		assert (locked /= '1')
		    report rfclk_freqtol_vio severity warning;
	 end if;
    end process;

    fifo_err	<= t_fifo_err;
    rxclk	<= t_rxclk;
    txclki	<= t_txclk;
    txclk	<= t_txclk;
    rxd		<= t_rxd;

    refclk <= refclk_p    AND NOT refclk_n;
    rd_in  <= serial_in_p AND NOT serial_in_n;

    U1: c2gcor port map
	(txd		=>	txd,
	txclki		=>	txclki,
	fifo_rstb	=>	fifo_rstb,
	loop_time	=>	loop_time,
	diagloop	=>	diagloop,
	loopa		=>	loopa,
	lineloop	=>	lineloop,
	resetb		=>	resetb,
	pwrdnb		=>	pwrdnb,
	lockrefb	=>	lockrefb,
	refclk		=>	refclk,
	rd_in		=>	rd_in,
	sd		=>	sd,
	td_out		=>	td_out,
	fifo_err	=>	t_fifo_err,
	txclko		=>	t_txclk,
	rxd		=>	t_rxd,
	rxclk		=>	t_rxclk,
	lfib		=>	lfib,
	locked		=>	locked);

    serial_out_n <= NOT td_out;
    serial_out_p <=     td_out;

end sim;

