--------------------------------------------------------------------------------
--
--              Copyright Cypress Semiconductor		1999
--              Protected as an unpublished work.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package c39kp is

    type clmem is array (1023 downto 0) of std_logic_vector(7 downto 0);
    type chmem is array ( 511 downto 0) of std_logic_vector(7 downto 0);

    function to_integer	(a: std_logic_vector) return natural;
    function to_integer	(a: Bit_Vector) return natural;
    function timeAdjust	(time_constraint: time) return time;

    -- Global clock block
    component c39kck
	generic (
	    cfgbits	: Bit_Vector(63 downto 0) := (others => '0');
	    xplPulseWthLo		: time := 100 ps;
	    xplPulseWthHi		: time := 100 ps;
	    xplEdgeUncertainty		: time := 100 ps;
	    xplMinPinClkPeriod		: time := 100 ns;
	    xplMaxPinClkPeriod		: time := 1000 ns;
	    xplLockTime			: time := 100 ns;
	    xplClkTreeDelay		: time := 100 ps;
	    xckPin2GClkDirect		: time := 100 ps;
	    xckPin2GClkViaPLL		: time := 100 ps);
	port (
	    clk		: in	std_logic_vector(3 downto 0);
	    nios	: in	std_logic;
	    lock	: out	std_logic;
	    glclk	: out	std_logic_vector(3 downto 0));
    end component;

    -- Channel memory FIFO
    component c39kcf
	generic (
	    cfgbits	: Bit_Vector(45 downto 0) := (others => '0');
	    memdata	: chmem	:= (others => "00000000");
	    xcmfClockWthCy		: time	:= 100 ps;
	    xcmfClockWthHi		: time	:= 100 ps;
	    xcmfClockWthLo		: time	:= 100 ps;
	    xcmfDinAtClkWrSetup		: time	:= 100 ps;
	    xcmfDinAtClkWrHold		: time	:= 100 ps;
	    xcmfEnxAtClockSetup		: time	:= 100 ps;
	    xcmfEnxAtClockHold		: time	:= 100 ps;
	    xcmfEfbInAtClkRdSetup	: time	:= 100 ps;
	    xcmfEfbInAtClkRdHold	: time	:= 100 ps;
	    xcmfHfbInAtClkRdSetup	: time	:= 100 ps;
	    xcmfHfbInAtClkRdHold	: time	:= 100 ps;
	    xcmfEfbInAtClkWrSetup	: time	:= 100 ps;
	    xcmfEfbInAtClkWrHold	: time	:= 100 ps;
	    xcmfHfbInAtClkWrSetup	: time	:= 100 ps;
	    xcmfHfbInAtClkWrHold	: time	:= 100 ps;
	    xcmfMrbWthLo		: time	:= 100 ps;
	    xcmfMrbRcr			: time	:= 100 ps;
	    xcmfRdWrSkewEfb		: time	:= 100 ps;
	    xcmfRdWrSkewHfb		: time	:= 100 ps;
	    xcmfRdWrSkewPafeb		: time	:= 100 ps;
	    xcmfDoutRegReWthHi		: time	:= 100 ps;
	    xcmfDoutRegReRcr		: time	:= 100 ps;
	    xcmfClkWr2FlagOut		: time	:= 100 ps;
	    xcmfClkRd2FlagOut		: time	:= 100 ps;
	    xcmfMrb2Output		: time	:= 100 ps;
	    xcmfClock2Dout		: time	:= 100 ps;
	    xcmfReset2Dout		: time	:= 100 ps);
	port (
	    din		: in	std_logic_vector(7 downto 0);
	    dout	: inout	std_logic_vector(7 downto 0);
	    enr		: in	std_logic;             
	    enw		: in	std_logic;             
	    ckr		: in	std_logic;
	    ckw		: in	std_logic;
	    mrb		: in	std_logic := '1';             
	    efb		: inout	std_logic;
	    hfb		: inout	std_logic;
	    pafeb	: out	std_logic);
    end component;

    -- Channel memory RAM
    component c39kcm
	generic (
	    cfgbits	: Bit_Vector(45 downto 0) := (others => '0');
	    memdata	: chmem	:= (others => "00000000");
	    xcmReadAddrWthHi		: time := 100 ps;
	    xcmWritAddrWthHi		: time := 100 ps;
	    xcmWriEnaWthHi		: time := 100 ps;
	    xcmAddrAtWriEnaFallSetup	: time := 100 ps;
	    xcmAddrAtWriEnaRiseSetup	: time := 100 ps;
	    xcmAddrAtWriEnaFallHold	: time := 100 ps;
	    xcmDinAtWriEnaFallSetup	: time := 100 ps;
	    xcmDinAtWriEnaFallHold	: time := 100 ps;
	    xcmAddr2DoutRegD		: time := 100 ps;
	    xcmWriEna2DoutRegD		: time := 100 ps;
	    xcmDin2DoutRegD		: time := 100 ps;
	    xcmDoutRegD2Dout		: time := 100 ps;
	    xcmClkInWthCy		: time := 100 ps;
	    xcmClkInWthHi		: time := 100 ps;
	    xcmClkInWthLo		: time := 100 ps;
	    xcmAddrAtClkInSetup		: time := 100 ps;
	    xcmAddrAtClkInHold		: time := 100 ps;
	    xcmWriEnaAtClkInSetup	: time := 100 ps;
	    xcmWriEnaAtClkInHold	: time := 100 ps;
	    xcmDinAtClkInSetup		: time := 100 ps;
	    xcmDinAtClkInHold		: time := 100 ps;
	    xcmClkIn2DoutRegD		: time := 100 ps;
	    xcmDoutRegCkWthCy		: time := 100 ps;
	    xcmDoutRegCkWthHi		: time := 100 ps;
	    xcmDoutRegCkWthLo		: time := 100 ps;
	    xcmDoutRegSetup		: time := 100 ps;
	    xcmDoutRegHold		: time := 100 ps;
	    xcmDoutRegReWthHi		: time := 100 ps;
	    xcmDoutRegReRcr		: time := 100 ps;
	    xcmReset2Dout		: time := 100 ps;
	    xcmClkOut2Dout		: time := 100 ps;
	    xcmAddrTransDetect		: time := 800 ps);
	port (
	    din_a	: in	std_logic_vector( 7 downto 0);
	    din_b	: in	std_logic_vector( 7 downto 0);
	    addr_a	: in	std_logic_vector(11 downto 0);
	    addr_b	: in	std_logic_vector(11 downto 0);
	    we_a	: in	std_logic;
	    we_b	: in	std_logic;
	    iclk_a	: in	std_logic := '0';
	    iclk_b	: in	std_logic := '0';
	    oclk_a	: in	std_logic := '0';
	    oclk_b	: in	std_logic := '0';
	    reset_a	: in	std_logic := '0';
	    reset_b	: in	std_logic := '0';
	    addr_matchb	: out	std_logic;
	    dout_a	: out	std_logic_vector( 7 downto 0);
	    dout_b	: out	std_logic_vector( 7 downto 0));
    end component;

    -- Cluster memory RAM
    component c39kcr
	generic (
	    cfgbits	: Bit_Vector(13 downto 0) := (others => '0');
	    memdata	: clmem	:= (others => "00000000");
	    xcrReadAddrWthHi		: time	:= 100 ps;
	    xcrWritAddrWthHi		: time	:= 100 ps;
	    xcrWriEnaWthHi		: time	:= 100 ps;
	    xcrAddrAtWriEnaFallSetup	: time	:= 100 ps;
	    xcrAddrAtWriEnaRiseSetup	: time	:= 100 ps;
	    xcrAddrAtWriEnaFallHold	: time	:= 100 ps;
	    xcrDinAtWriEnaFallSetup	: time	:= 100 ps;
	    xcrDinAtWriEnaFallHold	: time	:= 100 ps;
	    xcrAddr2DoutRegD		: time	:= 100 ps;
	    xcrWriEna2DoutRegD		: time	:= 100 ps;
	    xcrDin2DoutRegD		: time	:= 100 ps;
	    xcrDoutRegD2Dout		: time	:= 100 ps;
	    xcrClkInWthCy		: time	:= 100 ps;
	    xcrClkInWthHi		: time	:= 100 ps;
	    xcrClkInWthLo		: time	:= 100 ps;
	    xcrAddrAtClkInSetup		: time	:= 100 ps;
	    xcrAddrAtClkInHold		: time	:= 100 ps;
	    xcrWriEnaAtClkInSetup	: time	:= 100 ps;
	    xcrWriEnaAtClkInHold	: time	:= 100 ps;
	    xcrDinAtClkInSetup		: time	:= 100 ps;
	    xcrDinAtClkInHold		: time	:= 100 ps;
	    xcrClkIn2DoutRegD		: time	:= 100 ps;
	    xcrDoutRegCkWthHi		: time	:= 100 ps;
	    xcrDoutRegCkWthLo		: time	:= 100 ps;
	    xcrDoutRegCkWthCy		: time	:= 100 ps;
	    xcrDoutRegSetup		: time	:= 100 ps;
	    xcrDoutRegHold		: time	:= 100 ps;
	    xcrDoutRegReRcr		: time	:= 100 ps;
	    xcrDoutRegReWthHi		: time	:= 100 ps;
	    xcrClkOut2Dout		: time	:= 100 ps;
	    xcrReset2Dout		: time	:= 100 ps;
	    xcrAddrTransDetect		: time	:= 800 ps);
	port (
	    din		: in	std_logic_vector( 7 downto 0);
	    addr	: in	std_logic_vector(12 downto 0);
	    we		: in	std_logic;
	    iclk	: in	std_logic := '0';
	    oclk	: in	std_logic := '0';
	    reset	: in	std_logic := '0';
	    dout	: out	std_logic_vector( 7 downto 0));
    end component;

    -- Macro-cell Block
    component c39kmc
	generic (
	    cfgbits	: Bit_Vector(11 downto 0) := (others => '0');
	    xlbRegSetup			: time	:= 100 ps;
	    xlbRegHold			: time	:= 100 ps;
	    xlbRegCkWthHi		: time	:= 100 ps;
	    xlbRegCkWthLo		: time	:= 100 ps;
	    xlbRegCkWthCy		: time	:= 100 ps;
	    xlbRegPrRcr			: time	:= 100 ps;
	    xlbRegPrWthHi		: time	:= 100 ps;
	    xlbRegReRcr			: time	:= 100 ps;
	    xlbRegReWthHi		: time	:= 100 ps;
	    xlbSelin2Selout		: time	:= 100 ps;
	    xlbCpt2Selout		: time	:= 100 ps;
	    xlbCpt2RegD			: time	:= 100 ps;
	    xlbEqn2RegD			: time	:= 100 ps;
	    xlbSelin2RegD		: time	:= 100 ps;
	    xlbRegQ2RegD		: time	:= 100 ps;
	    xlbRegD2ToPIM		: time	:= 100 ps;
	    xlbRegCk2ToPIM		: time	:= 100 ps;
	    xlbRegPr2ToPIM		: time	:= 100 ps;
	    xlbRegRe2ToPIM		: time	:= 100 ps);
	port (
	    selin	: in	std_logic;
	    cpt		: in	std_logic_vector(1 downto 0);
	    set		: in	std_logic;
	    clr		: in	std_logic;
	    clk		: in	std_logic;
	    din		: in	std_logic;
	    selout	: out	std_logic;
	    qout	: out	std_logic);
    end component;

    -- I/O Block
    component c39kio
	generic (
	    cfgbits	: Bit_Vector(35 downto 0) := (others => '0');
	    xioClockWthHi		: time	:= 100 ps;
	    xioClockWthLo		: time	:= 100 ps;
	    xioClockWthCy		: time	:= 100 ps;
	    xioResetRcr			: time	:= 100 ps;
	    xioResetWthHi		: time	:= 100 ps;
	    xioIoRegSetup		: time	:= 100 ps;
	    xioIoRegHold		: time	:= 100 ps;
	    xioIoRegEnSup		: time	:= 100 ps;
	    xioIoRegEnHld		: time	:= 100 ps;
	    xioOeRegSetup		: time	:= 100 ps;
	    xioOeRegHold		: time	:= 100 ps;
	    xioFromChip2Pin		: time	:= 100 ps;
	    xioFromChip2IoRegD		: time	:= 100 ps;
	    xioIoRegCk2Pin		: time	:= 100 ps;
	    xioIoRegRe2Pin		: time	:= 100 ps;
	    xioIoRegRe2ToChip		: time	:= 100 ps;
	    xioOeRegCk2PinEA		: time	:= 100 ps;
	    xioOeRegCk2PinER		: time	:= 100 ps;
	    xioOeRegRe2PinER		: time	:= 100 ps;
	    xioOutEna2PinEA		: time	:= 100 ps;
	    xioOutEna2PinER		: time	:= 100 ps;
	    xioPin2IoRegD		: time	:= 100 ps;
	    xioIoRegCk2ToChip		: time	:= 100 ps;
	    xioPin2ToChip		: time	:= 100 ps;
	    xioAddOslow			: time	:= 100 ps;
	    xioAddEAslow		: time	:= 100 ps;
	    xioAddERslow		: time	:= 100 ps;
	    xioAdd			: time	:= 100 ps);
	port (
	    oe		: in	std_logic;
	    din		: in	std_logic;
	    en		: in	std_logic;
	    clk		: in	std_logic;
	    clr		: in	std_logic;
	    fb		: out	std_logic;
	    iop		: inout	std_logic);
    end component;

end c39kp;

package body c39kp is

    function to_integer (a	: std_logic_vector) return natural is
	variable tmp	: std_logic_vector(a'length-1 downto 0);
	variable result	: natural := 0;
    begin
	if (a'length < 1) then
	    return 0;
	end if;
	tmp := a;
	for i in tmp'reverse_range loop
	    if tmp(i) = '1' then
		result := result + 2**i;
	    end if;
	end loop;
	return result;
    end to_integer;

    function to_integer (a	: Bit_Vector) return natural is
	variable tmp	: Bit_Vector(a'length-1 downto 0);
	variable result	: natural := 0;
    begin
	if (a'length < 1) then
	    return 0;
	end if;
	tmp := a;
	for i in tmp'reverse_range loop
	    if tmp(i) = '1' then
		result := result + 2**i;
	    end if;
	end loop;
	return result;
    end to_integer;

    function timeAdjust	(time_constraint: time) return time is
    begin
    	if (time_constraint < 0 ns) then
	    return -(time_constraint);
	else
	    return 0 ns;
	end if;
    end timeAdjust;

end c39kp;
