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

entity c2gcor is
port (txd	: in    std_logic_vector (15 downto 0);
    txclki	: in	std_logic;
    fifo_rstb	: in	std_logic;
    loop_time	: in	std_logic;
    diagloop	: in	std_logic;
    loopa	: in	std_logic;
    lineloop	: in	std_logic;
    resetb	: in	std_logic;
    pwrdnb	: in	std_logic;
    lockrefb	: in	std_logic;
    refclk	: in	std_logic;
    rd_in	: in	std_logic;
    sd		: in	std_logic;
    td_out	: out	std_logic;
    fifo_err	: inout	std_logic;
    txclko	: inout	std_logic;
    rxd		: out	std_logic_vector (15 downto 0) := (others => '0');
    rxclk	: inout	std_logic;
    lfib	: out	std_logic;
    locked	: out   std_logic);
end c2gcor;

architecture sim of c2gcor is

    signal txd_reg	: std_logic_vector (15 downto 0);
    signal rx_dat16	: std_logic_vector (15 downto 0);
    signal rx_dat16_bak	: std_logic_vector (15 downto 0);
    signal fifo_out	: std_logic_vector (15 downto 0);
    signal fifo_out_d	: std_logic_vector (15 downto 0);
    signal fifo_out_2d	: std_logic_vector (15 downto 0);
    signal rx_sd_cnt16	: natural;
    signal rx_cnt16	: natural;
    signal cnt16	: natural;
    signal shiftcnt	: natural;
    signal vco_buprox	: natural;
    signal vco_buprox_1	: natural;
    signal rd_in_d	: std_logic;
    signal out_1	: std_logic;
    signal retimed_data	: std_logic;
    signal done16	: std_logic;
    signal done16_rec	: std_logic;
    signal within_range	: std_logic;
    signal cntrstb	: std_logic;
    signal rxpll_in	: std_logic;
    signal tx_bit_clock	: std_logic;
    signal lfi_1	: std_logic;
    signal fifomt	: std_logic;
    signal fifomt_d	: std_logic;
    signal fifomt_2d	: std_logic;
    signal fifomt_2d_V	: std_logic;
    signal fifomt_3d	: std_logic;
    signal fifomt_d_tx	: std_logic := '1';
    signal fifomt_2d_tx	: std_logic := '1';
    signal fifomt_3d_tx	: std_logic := '1';
    signal fifomt_4d_tx	: std_logic := '1';
    signal fifomt_4d_tv	: std_logic := '1';
    signal out_1_d	: std_logic;
    signal txclk_pll	: std_logic := '0';
    signal recovered_clk: std_logic := '0';
    signal sd_d		: std_logic;
    signal fifo_rstb_d	: std_logic;
    signal fifo_rstb_2d	: std_logic;

    signal timestamp_in_0	: time := 0 fs;
    signal timestamp_in_1	: time := 0 fs;
    signal timestamp_in_2	: time := 0 fs;
    signal timestamp_out_0	: time := 0 fs;
    signal timestamp_out_1	: time := 0 fs;
    signal timestamp_clk_0	: time := 0 fs;
    signal timestamp_clk_1	: time := 0 fs;
    signal dur_rec_clk		: time := 0 fs;
    signal duration_in_0	: time := 0 fs;
    signal duration_in_1	: time := 0 fs;
    signal duration_in		: time := 0 fs;
    signal duration_clk		: time := 0 fs;
    signal duration_txclk	: time := 0 fs;
    signal duration_in_0_d	: time := 0 fs;
    signal duration_in_last	: time := 0 fs;

begin

    -- parallel input to serial output

    U0: c2gffo port map
	    (data_in	=> txd_reg,
	    rstb	=> fifo_rstb,
	    wrclk	=> txclki,
	    out_2d	=> fifo_out,
	    rdclk	=> txclko,
	    fifoerr	=> fifo_err,
	    fifoempty	=> fifomt);

    P1: process (txclki)
    begin
	if (rising_edge(txclki) AND (pwrdnb = '1')) then
	    txd_reg <= txd;
	end if;
    end process;

    P2: process (txclko, resetb)
    begin
    	if (resetb = '0') then
	    fifo_rstb_d  <= '0';
	    fifo_rstb_2d <= '0';
	elsif (rising_edge(txclko)) then
	    fifo_rstb_d  <= fifo_rstb;
	    fifo_rstb_2d <= fifo_rstb_d;
	    fifomt_d_tx  <= fifomt;
	    fifomt_2d_tx <= fifomt_d_tx;
	    fifomt_3d_tx <= fifomt_2d_tx;
	end if;
    end process;

    P3: process (txclko, fifomt_2d_tx)
    begin
    	if (fifomt_2d_tx = '1') then
	    fifo_out_d <= x"5555";
	elsif (rising_edge(txclko)) then
	    fifo_out_d <= fifo_out;
	end if;
    end process;

    P4: process (txclko, fifomt_2d_tx)
    begin
    	if (fifomt_2d_tx = '1') then
	    fifo_out_2d <= x"5555";
	elsif (falling_edge(txclko)) then
	    fifo_out_2d <= fifo_out_d;
	end if;
    end process;

    P5: process (txclko)
    begin
	if (falling_edge(txclko)) then
	    fifomt_4d_tx <= fifomt_3d_tx;
	end if;
    end process;

    P6: process (tx_bit_clock, resetb)
    begin
    	if (resetb = '0') then
	    out_1	<= '0';
	    shiftcnt	<= 15;
	elsif (rising_edge(tx_bit_clock)) then
	    if ((pwrdnb = '1') AND
		    (fifo_rstb_2d = '0') AND (fifo_rstb_d = '1')) then
	    	out_1 <= '0';
	    elsif ((pwrdnb = '1') AND (fifomt_4d_tx = '1')) then
	    	out_1 <= NOT out_1;
		shiftcnt <= 15;
	    elsif (pwrdnb = '1') then
	    	out_1 <= fifo_out_2d(shiftcnt);
		if (shiftcnt = 0) then
		    shiftcnt <= 15;
		else
		    shiftcnt <= shiftcnt - 1;
		end if;
	    end if;
	end if;
    end process;

    P7: process (tx_bit_clock, resetb)
    begin
    	if (resetb  = '0') then
	    cnt16  <=  0;
	elsif (rising_edge(tx_bit_clock) AND (pwrdnb = '1')) then
	    if (cnt16 = 15) then
		cnt16 <= 0;
	    else
		cnt16 <= cnt16 + 1;
	    end if;
	end if;
    end process;

    P7a: process (tx_bit_clock, resetb)
    begin
    	if (resetb  = '0') then
	    txclko <= '0';
	elsif (falling_edge(tx_bit_clock) AND (pwrdnb = '1')) then
	    if (cnt16 = 8) then
		txclko <= '0';
	    elsif (cnt16 = 0) then
		txclko <= '1';
	    end if;
	end if;
    end process;

    td_out <= retimed_data when (lineloop = '1') else
		     rd_in when (loopa = '1')    else out_1;

    tx_bit_clock <= recovered_clk when (loop_time = '1') else txclk_pll;

    -- serial input to parallel output

    P7b: process (out_1_d, rd_in_d, tx_bit_clock)
    begin
    	if (diagloop = '1') then
	    if(rising_edge(tx_bit_clock)) then
		rxpll_in <= out_1_d;
	    end if;
	else
	    if (rd_in_d'event) then
		rxpll_in <= rd_in_d;
	    end if;
	end if;
    end process;
    rd_in_d  <= rd_in after 10 ps;--10 ps;

    P8: process (recovered_clk, resetb)
    begin
    	if (resetb  = '0') then
	    vco_buprox <= 0;
	elsif (rising_edge(recovered_clk) AND (vco_buprox /= 131072)) then
	    vco_buprox <= vco_buprox + 1;
	end if;
    end process;

    P8a: process (rxpll_in, resetb)
    begin
    	if (resetb  = '0') then
	    vco_buprox_1 <= 0;
	elsif (rising_edge(rxpll_in) AND (vco_buprox_1 /= 32768)) then
	    vco_buprox_1 <= vco_buprox_1 + 1;
	end if;
    end process;

    P9: process (recovered_clk)
    begin
     	if (pwrdnb = '1' AND falling_edge(recovered_clk)) then
	    out_1_d <= out_1;
	    fifomt_4d_tv <= fifomt_4d_tx;
	    sd_d <= sd;
	elsif (falling_edge(recovered_clk)) then
	    sd_d <= sd;
	end if;
    end process;

    P9a: process (duration_in_0, duration_clk)
    begin
	if (duration_clk > 0 fs) then
	    if (((16.0*time_to_real(duration_in_0)/(time_to_real(duration_clk)))
		    <= 1.0002)  AND
		((16.0*time_to_real(duration_in_0)/(time_to_real(duration_clk)))
		    >= 0.9998)) then
		within_range <= '1';
	    else
		within_range <= '0';
	    end if;
	end if;
    end process;

    P10: process (pwrdnb, rxpll_in, diagloop, fifomt_2d)
    begin
	if (pwrdnb = '1') then
	    if ((diagloop = '1' AND fifomt_2d = '1') OR (diagloop = '0')) then
		timestamp_in_0 <= NOW;
		timestamp_in_1 <= timestamp_in_0;
		timestamp_in_2 <= timestamp_in_1;
	    end if;
	end if;
    end process;

    P11: process (refclk)
    begin
	if (pwrdnb = '1' AND rising_edge(refclk)) then
	    timestamp_clk_0 <= NOW;
	    timestamp_clk_1 <= timestamp_clk_0;
	end if;
    end process;

    P12: process (within_range)
    begin
    	if (falling_edge(within_range)) then
	    duration_in_last <= duration_in after 1 ps; --ps;
	end if;
    end process;

    P12x: process (duration_in_0)
    begin
	duration_in_0_d <= duration_in_0 after 1 ps; --ps;
    end process;

    P12a: process (duration_in_0_d)
    begin
    	if (within_range = '1') then
	    duration_in <= duration_in_0;
	else
	    duration_in <= duration_in_last;
	end if;
    end process;

    P12b: process (pwrdnb, timestamp_in_0, timestamp_in_1, timestamp_clk_0,
		    duration_in, timestamp_clk_1, sd, lockrefb, within_range,
		    diagloop, lfi_1)
    	variable var_clk : time;
    begin
     	if (pwrdnb = '1') then
	    duration_in_0 <= timestamp_in_0 - timestamp_in_1;

	    var_clk      := timestamp_clk_0 - timestamp_clk_1;
	    duration_clk <= var_clk;

	    if (lockrefb = '0' OR ((diagloop = '0') AND (sd = '0'))) then
		dur_rec_clk <= (var_clk / 16);
	    elsif (lfi_1 = '1') then
		dur_rec_clk <= duration_in;
	    else
		dur_rec_clk <= (var_clk / 16);
	    end if;
	    duration_txclk <= var_clk / 32;

	end if;
    end process;

     P13: process
     begin
	wait on refclk, pwrdnb, done16;
     	if (pwrdnb = '1') then
	    if (duration_txclk /= 0 fs) then
		for i in 1 to 32 loop
		    wait for duration_txclk;
		    txclk_pll <= NOT txclk_pll;
		end loop;
		done16 <= '1';
		wait for 5 fs;
		done16 <= '0';
	    end if;
	end if;
     end process;

    P15: process
    begin
	wait on pwrdnb, done16_rec, dur_rec_clk;
	if (pwrdnb = '1') then
	    if (dur_rec_clk /= 0 fs) then
		for i in 1 to 32 loop
		    wait for dur_rec_clk/2;
		    recovered_clk <= NOT recovered_clk;
		end loop;
		done16_rec <= '1';
		wait for 5 fs;
		done16_rec <= '0';
	    end if;
	end if;
     end process;

    P17: process (recovered_clk, resetb)
     begin
     	if (resetb = '0') then
	    rx_cnt16  <=  0;
	    fifomt_2d <= '1';
	    fifomt_3d <= '1';
	elsif ((pwrdnb = '1') AND (rising_edge(recovered_clk))) then
	    if (rx_cnt16 = 15) then
		rx_cnt16 <= 0;
	    else
		rx_cnt16 <= rx_cnt16 + 1;
	    end if;
	    fifomt_2d <= fifomt_d;
	    fifomt_3d <= fifomt_2d;
	end if;
     end process;

    P17a: process (recovered_clk, resetb)
     begin
     	if (resetb = '0') then
	    rxclk <= '1';
	elsif ((pwrdnb = '1') AND (falling_edge(recovered_clk))) then
	    if (rx_cnt16 = 8) then
		rxclk <= '1';
	    elsif (rx_cnt16 = 0) then
		rxclk <= '0';
	    end if;
	end if;
     end process;

     P18: process (recovered_clk, resetb)
     begin
     	if (resetb = '0') then
	    fifomt_d <= '1';
	elsif ((pwrdnb = '1') AND (rising_edge(recovered_clk))) then
	    fifomt_d <= fifomt_4d_tv;
	end if;
     end process;
     
     P19: process (refclk, resetb)
     begin
     	if (resetb = '0') then
	    lfi_1 <= '0';
	elsif ((within_range = '1') AND (pwrdnb = '1') AND
		(vco_buprox   = 131072) AND (vco_buprox_1 = 32768)  AND
		(rising_edge(refclk))) then
	    lfi_1 <= '1';
	elsif ((pwrdnb = '0') AND (within_range = '0')) then
	    lfi_1 <= '0';
	end if;
     end process;

     locked <= lfi_1;
     lfib <= lfi_1 AND lockrefb AND (diagloop OR sd);

     P20: process (recovered_clk, resetb)
     begin
     	if (resetb = '0') then
	    rx_dat16     <= (others => '0');
	    rx_dat16_bak <= (others => '0');
	    retimed_data <= '0';
	elsif ((pwrdnb = '1') AND (rising_edge(recovered_clk))) then
	    rx_dat16(rx_sd_cnt16) <= retimed_data;
	    if (rx_sd_cnt16 = 15) then
		rx_dat16_bak <= rx_dat16;
	    end if;
	    retimed_data <= rxpll_in;
	end if;
     end process;

     cntrstb <= resetb AND NOT (fifomt_2d AND diagloop);
     fifomt_2d_V <= fifomt_2d after 1 ps; --ps;

     P21: process (recovered_clk, cntrstb)
     begin
     	if (cntrstb = '0') then
	    rx_sd_cnt16  <= 15;
	elsif ((pwrdnb = '1') AND (rising_edge(recovered_clk))) then
	    if ((diagloop = '1' AND fifomt_2d_V = '0') OR (diagloop = '0')) then
		if (rx_sd_cnt16 = 0) then
		    rx_sd_cnt16 <= 15;
		else
		    rx_sd_cnt16 <= rx_sd_cnt16 - 1;
		end if;
	    end if;
	end if;
     end process;

     P22: process (rxclk, resetb)
     begin
     	if (resetb = '0') then
	    rxd <= (others => '0');
	elsif ((pwrdnb = '1') AND falling_edge(rxclk)) then
	    rxd <= rx_dat16_bak;
	end if;
     end process;

end sim;
