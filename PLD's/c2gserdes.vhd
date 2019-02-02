--
--	Legacy c2gserdes
--

library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c2gsp.all;

entity c2gserdes is
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
end c2gserdes;
architecture sim of c2gserdes is
begin
    UA: c25g01serdes port map (
	txd		=>	txd,
	fifo_rstb	=>	fifo_rstb,
	loop_time	=>	loop_time,
	diagloop	=>	diagloop,
	loopa		=>	loopa,
	lineloop	=>	lineloop,
	resetb		=>	resetb,
	pwrdnb		=>	pwrdnb,
	lockrefb	=>	lockrefb,
	refclk_n	=>	refclk_n,
	refclk_p	=>	refclk_p,
	serial_in_n	=>	serial_in_n,
	serial_in_p	=>	serial_in_p,
	sd		=>	sd,
	serial_out_n	=>	serial_out_n,
	serial_out_p	=>	serial_out_p,
	fifo_err	=>	fifo_err,
	txclk		=>	txclk,
	rxd		=>	rxd,
	rxclk		=>	rxclk,
	lfib		=>	lfib);
end sim;
