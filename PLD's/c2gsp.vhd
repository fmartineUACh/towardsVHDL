--------------------------------------------------------------------------------
--
--              Copyright Cypress Semiconductor         2000,2001
--              Protected as an unpublished work.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package c2gsp is

    function time_to_real (a : time) return real;

    component c25g01serdes
	port(txd	: in	std_logic_vector (15 downto 0);
	    fifo_rstb	: in	std_logic;
	    loop_time	: in	std_logic;
	    diagloop	: in	std_logic;
	    loopa	: in	std_logic;
	    lineloop	: in	std_logic;
	    resetb	: in	std_logic;
	    pwrdnb	: in	std_logic;
	    lockrefb	: in	std_logic;
	    refclk_n	: in	std_logic;
	    refclk_p	: in	std_logic;
	    serial_in_n	: in	std_logic := '0';
	    serial_in_p	: in	std_logic := '1';
	    sd		: in	std_logic := '0';
	    serial_out_n: out	std_logic;
	    serial_out_p: out	std_logic;
	    fifo_err	: out	std_logic;
	    txclk	: out	std_logic;
	    rxd		: out	std_logic_vector (15 downto 0);
	    rxclk	: out	std_logic;
	    lfib	: out	std_logic);
    end component;

    component c25g01serdes_slave
	port(txd	: in	std_logic_vector (15 downto 0);
	    fifo_rstb	: in	std_logic;
	    loop_time	: in	std_logic;
	    diagloop	: in	std_logic;
	    loopa	: in	std_logic;
	    lineloop	: in	std_logic;
	    resetb	: in	std_logic;
	    pwrdnb	: in	std_logic;
	    lockrefb	: in	std_logic;
	    refclk_n	: in	std_logic;
	    refclk_p	: in	std_logic;
	    serial_in_n	: in	std_logic := '0';
	    serial_in_p	: in	std_logic := '1';
	    sd		: in	std_logic := '0';
	    serial_out_n: out	std_logic;
	    serial_out_p: out	std_logic;
	    fifo_err	: out	std_logic;
	    txclk	: in	std_logic;
	    rxd		: out	std_logic_vector (15 downto 0);
	    rxclk	: out	std_logic;
	    lfib	: out	std_logic);
    end component;

    component c2gserdes
	port(txd	: in	std_logic_vector (15 downto 0);
	    fifo_rstb	: in	std_logic;
	    loop_time	: in	std_logic;
	    diagloop	: in	std_logic;
	    loopa	: in	std_logic;
	    lineloop	: in	std_logic;
	    resetb	: in	std_logic;
	    pwrdnb	: in	std_logic;
	    lockrefb	: in	std_logic;
	    refclk_n	: in	std_logic;
	    refclk_p	: in	std_logic;
	    serial_in_n	: in	std_logic := '0';
	    serial_in_p	: in	std_logic := '1';
	    sd		: in	std_logic := '0';
	    serial_out_n: out	std_logic;
	    serial_out_p: out	std_logic;
	    fifo_err	: out	std_logic;
	    txclk	: out	std_logic;
	    rxd		: out	std_logic_vector (15 downto 0);
	    rxclk	: out	std_logic;
	    lfib	: out	std_logic);
    end component;

    component c2gcor
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
	    rxd		: out	std_logic_vector (15 downto 0):=(others => '0');
	    rxclk	: inout	std_logic;
	    lfib	: out	std_logic;
	    locked	: out   std_logic);
    end component;

    component c2gffo
	port (data_in	: in	std_logic_vector(15 downto 0);
	    rstb	: in	std_logic;
	    wrclk	: in	std_logic;
	    out_2d	: out	std_logic_vector(15 downto 0);
	    rdclk	: in	std_logic;
	    fifoerr	: out	std_logic;
	    fifoempty	: inout	std_logic);
    end component;

end c2gsp;

package body c2gsp is

    -- This is necessary to avoid loss of precision when
    -- convering time to a real number.
    function time_to_real (a : time) return real is

       variable result	: real;
       variable x	: time;
       variable os_count: integer;
       variable us_count: integer;
       variable ns_count: integer;
       variable ps_count: integer;
       variable fs_count: integer;

    begin

       x := a;
       os_count := x / 1 sec;
       x := x - os_count * 1 sec;
       us_count := x / 1 us;
       x := x - us_count * 1 us;
       ns_count := x / 1 ns;
       x := x - ns_count * 1 ns;
       x := x * 1e3;
       ps_count := x / 1 ns;
       x := x - ps_count * 1 ns;
       x := x * 1e3;
       fs_count := x / 1 ns;
       x := x - fs_count * 1 ns;

       result := 0.0;
       result := result + real(fs_count) * 1.0e-15;
       result := result + real(ps_count) * 1.0e-12;
       result := result + real(ns_count) * 1.0e-9;
       result := result + real(us_count) * 1.0e-6;
       result := result + real(os_count);
       return result;
    end time_to_real;

end c2gsp;

