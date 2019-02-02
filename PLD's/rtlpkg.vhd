--
--  Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--  as an unpublished work.
--

library ieee;
use ieee.std_logic_1164.all;

PACKAGE rtlpkg IS

attribute atomic_rtl of rtlpkg:PACKAGE is NOT_RTL_type;

component cy_bufoe
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: inout std_logic;
	    yfb	: out std_logic);
end component;

component bufoe
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: inout std_logic;
	    yfb	: out std_logic);
end component;

    attribute replacement_rtl of bufoe	: component is "cy_bufoe";

component cy_dltch
    port   (d	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end component;

component dltch
    port   (d	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of dltch    : component is "cy_dltch";

component cy_dff
    port   (d	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component dff
    port   (d	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of dff    : component is "cy_dff";

component cy_xdff
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component xdff
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of xdff    : component is "cy_xdff";

component cy_jkff
    port   (j	: in std_logic;
	    k	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component jkff
    port   (j	: in std_logic;
	    k	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of jkff    : component is "cy_jkff";

component cy_buf
    port   (x	: in std_logic;
	    y	: out std_logic);
end component;

component buf
    port   (x	: in std_logic;
	    y	: out std_logic);
end component;

    attribute replacement_rtl of buf	: component is "cy_buf";

component cy_srlch
    port   (s	: in std_logic;
	    r	: in std_logic;
	    q	: out std_logic);
end component;

component srlch
    port   (s	: in std_logic;
	    r	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of srlch    : component is "cy_srlch";

component cy_srff
    port   (s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component srff
    port   (s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of srff    : component is "cy_srff";

component cy_dsrff
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component dsrff
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of dsrff    : component is "cy_dsrff";

component cy_tsrff
    port   (t	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component tsrff
    port   (t	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of tsrff    : component is "cy_tsrff";

component cy_tff
    port   (t	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component tff
    port   (t	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of tff    : component is "cy_tff";

component cy_xbuf
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    q	: out std_logic);
end component;

component xbuf
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of xbuf    : component is "cy_xbuf";

component cy_triout
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: out std_logic);
end component;

component triout
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: out std_logic);
end component;

    attribute replacement_rtl of triout    : component is "cy_triout";

component cy_dsrlch
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end component;

component dsrlch
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end component;

    attribute replacement_rtl of dsrlch    : component is "cy_dsrlch";

component cy_dsrffe
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    e	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end component;

component cy_c39kcarry
    port   (SelIn	: in std_logic;
	    Cpt0	: in std_logic;
	    Cpt1	: in std_logic;
	    SelOut	: out std_logic);
end component;

component cy_c39kxor
    port   (SIn 	: in std_logic;
	    PtmPts	: in std_logic;
	    XorOut	: out std_logic);
end component;

component cy_c39kmultiply
    generic(IsSigned	: BOOLEAN := FALSE;
	DataWidthA	: positive;
	DataWidthB	: positive;
	DataWidthP	: positive;

	Hint		: goal_type := memory);

    port   (Data_A	: in  std_logic_vector(DataWidthA-1 downto 0);
	    Data_B	: in  std_logic_vector(DataWidthB-1 downto 0);
	    Product	: out std_logic_vector(DataWidthP-1 downto 0));
end component;

TYPE fdbk_source IS (DIRECT, CLOCK_TREE, EXTERNAL);

component cy_c39kpll
    generic(feedback	: fdbk_source	:= DIRECT;
	    multiply	: positive	:= 1;
	    gclk0_phase	: natural	:= 0;
	    gclk0_divide: positive	:= 1;
	    gclk1_phase	: natural	:= 0;
	    gclk1_divide: positive	:= 1;
	    gclk2_phase	: natural	:= 0;
	    gclk2_divide: positive	:= 1;
	    gclk3_phase	: natural	:= 0;
	    gclk3_divide: positive	:= 1);
    port   (pll_in	: in  std_logic;
	    ext_fdbk	: in  std_logic	:= '0';
	    lock_detect	: out std_logic;
	    gclk0	: out std_logic;
	    gclk1	: out std_logic;
	    gclk2	: out std_logic;
	    gclk3	: out std_logic);
end component;

component cy_25g01serdes

    port   (txd		: in  std_logic_vector (15 downto 0) ;
	    fifo_rstb	: in  std_logic ;
	    loop_time	: in  std_logic ;
	    diagloop	: in  std_logic ;
	    loopa	: in  std_logic ;
	    lineloop	: in  std_logic ;
	    resetb	: in  std_logic ;
	    pwrdnb	: in  std_logic ;
	    lockrefb	: in  std_logic ;
	    refclk_n	: in  std_logic ;
	    refclk_p	: in  std_logic ;
	    serial_in_n : in  std_logic ;
	    serial_in_p	: in  std_logic ;
	    sd		: in  std_logic ;
	    serial_out_n: out std_logic ;
	    serial_out_p: out std_logic ;
	    fifo_err	: out std_logic ;

	    txclk	: out std_logic ;

	    rxd		: out std_logic_vector (15 downto 0) ;
	    rxclk	: out std_logic ;
	    lfib	: out std_logic );

end component;

component cy_25g01serdes_slave

    port   (txd		: in  std_logic_vector (15 downto 0) ;
	    fifo_rstb	: in  std_logic ;
	    loop_time	: in  std_logic ;
	    diagloop	: in  std_logic ;
	    loopa	: in  std_logic ;
	    lineloop	: in  std_logic ;
	    resetb	: in  std_logic ;
	    pwrdnb	: in  std_logic ;
	    lockrefb	: in  std_logic ;
	    refclk_n	: in  std_logic ;
	    refclk_p	: in  std_logic ;
	    serial_in_n : in  std_logic ;
	    serial_in_p	: in  std_logic ;
	    sd		: in  std_logic ;
	    serial_out_n: out std_logic ;
	    serial_out_p: out std_logic ;
	    fifo_err	: out std_logic ;

	    txclk	: in  std_logic ;

	    rxd		: out std_logic_vector (15 downto 0) ;
	    rxclk	: out std_logic ;
	    lfib	: out std_logic );

end component;

component cy_2gserdes

    port   (txd		: in  std_logic_vector (15 downto 0) ;
	    fifo_rstb	: in  std_logic ;
	    loop_time	: in  std_logic ;
	    diagloop	: in  std_logic ;
	    loopa	: in  std_logic ;
	    lineloop	: in  std_logic ;
	    resetb	: in  std_logic ;
	    pwrdnb	: in  std_logic ;
	    lockrefb	: in  std_logic ;
	    refclk_n	: in  std_logic ;
	    refclk_p	: in  std_logic ;
	    serial_in_n : in  std_logic ;
	    serial_in_p	: in  std_logic ;
	    sd		: in  std_logic ;
	    serial_out_n: out std_logic ;
	    serial_out_p: out std_logic ;
	    fifo_err	: out std_logic ;

	    txclk	: out std_logic ;

	    rxd		: out std_logic_vector (15 downto 0) ;
	    rxclk	: out std_logic ;
	    lfib	: out std_logic );

end component;

    attribute replacement_rtl of cy_2gserdes : component is "cy_25g01serdes";

component cy_25g02serdes
    port   (txd_a		: in  std_logic_vector (15 downto 0);
	    txd_b		: in  std_logic_vector (15 downto 0);
	    fifo_rstb_a		: in  std_logic;
	    fifo_rstb_b		: in  std_logic;
	    loop_time		: in  std_logic;
	    diagloop_a		: in  std_logic;
	    diagloop_b		: in  std_logic;
	    loopa_a		: in  std_logic;
	    loopa_b		: in  std_logic;
	    lineloop_a		: in  std_logic;
	    lineloop_b		: in  std_logic;
	    resetb_a		: in  std_logic;
	    resetb_b		: in  std_logic;
	    pwrdnb_a		: in  std_logic;
	    pwrdnb_b		: in  std_logic;
	    lockrefb_a		: in  std_logic;
	    lockrefb_b		: in  std_logic;
	    refclk_n		: in  std_logic;
	    refclk_p		: in  std_logic;
	    serial_in_n_a	: in  std_logic;
	    serial_in_p_a	: in  std_logic;
	    serial_in_n_b	: in  std_logic;
	    serial_in_p_b	: in  std_logic;
	    sd_a		: in  std_logic;
	    sd_b		: in  std_logic;
	    serial_out_n_a	: out std_logic;
	    serial_out_p_a	: out std_logic;
	    serial_out_n_b	: out std_logic;
	    serial_out_p_b	: out std_logic;
	    fifo_err_a		: out std_logic;
	    fifo_err_b		: out std_logic;
	    txclk		: out std_logic;
	    rxd_a		: out std_logic_vector (15 downto 0);
	    rxd_b		: out std_logic_vector (15 downto 0);
	    rxclk_a		: out std_logic;
	    rxclk_b		: out std_logic;
	    lfib_a		: out std_logic;
	    lfib_b		: out std_logic);
end component;

component cy_15g04serdes

    port (  txda		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txdb		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txdc		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txdd		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txpera		: out	std_logic;
	    txperb		: out	std_logic;
	    txperc		: out	std_logic;
	    txperd		: out	std_logic;
	    txcta		: in	std_logic_vector(1 downto 0) := (others => '0');
	    txctb		: in	std_logic_vector(1 downto 0) := (others => '0');
	    txctc		: in	std_logic_vector(1 downto 0) := (others => '0');
	    txctd		: in	std_logic_vector(1 downto 0) := (others => '0');

	    txclka		: in	std_logic;

	    txclko_p		: out	std_logic;

	    txrate		: in	std_logic;
	    txmode		: in	std_logic_vector(1 downto 0);
	    txcksel		: in	std_logic;
	    txrstb		: in	std_logic;

	    rxda		: out	std_logic_vector(7 downto 0);
	    rxdb		: out	std_logic_vector(7 downto 0);
	    rxdc		: out	std_logic_vector(7 downto 0);
	    rxdd		: out	std_logic_vector(7 downto 0);
	    rxsta		: out	std_logic_vector(2 downto 0);
	    rxstb		: out	std_logic_vector(2 downto 0);
	    rxstc		: out	std_logic_vector(2 downto 0);
	    rxstd		: out	std_logic_vector(2 downto 0);

	    rxrate		: in	std_logic;
	    rfen		: in	std_logic;
	    rxmode		: in	std_logic_vector(1 downto 0);
	    rxcksel		: in	std_logic;
	    framchar		: in	std_logic;
	    rfmode		: in	std_logic;
	    decmode		: in	std_logic;

	    spdsel		: in	std_logic;
	    rxclka_p		: out	std_logic;
	    rxclkb_p		: inout	std_logic;
	    rxclkc_p		: out	std_logic;
	    rxclkd_p		: inout	std_logic;

	    refclk_p		: in	std_logic;
	    refclk_n		: in	std_logic;
	    serial_outa1_p	: out	std_logic;
	    serial_outb1_p	: out	std_logic;
	    serial_outc1_p	: out	std_logic;
	    serial_outd1_p	: out	std_logic;
	    serial_outa2_p	: out	std_logic;
	    serial_outb2_p	: out	std_logic;
	    serial_outc2_p	: out	std_logic;
	    serial_outd2_p	: out	std_logic;
	    serial_ina1_p	: in	std_logic;
	    serial_inb1_p	: in	std_logic;
	    serial_inc1_p	: in	std_logic;
	    serial_ind1_p	: in	std_logic;
	    serial_ina2_p	: in	std_logic;
	    serial_inb2_p	: in	std_logic;
	    serial_inc2_p	: in	std_logic;
	    serial_ind2_p	: in	std_logic;
	    serial_outa1_n	: out	std_logic;
	    serial_outb1_n	: out	std_logic;
	    serial_outc1_n	: out	std_logic;
	    serial_outd1_n	: out	std_logic;
	    serial_outa2_n	: out	std_logic;
	    serial_outb2_n	: out	std_logic;
	    serial_outc2_n	: out	std_logic;
	    serial_outd2_n	: out	std_logic;
	    serial_ina1_n	: in	std_logic;
	    serial_inb1_n	: in	std_logic;
	    serial_inc1_n	: in	std_logic;
	    serial_ind1_n	: in	std_logic;
	    serial_ina2_n	: in	std_logic;
	    serial_inb2_n	: in	std_logic;
	    serial_inc2_n	: in	std_logic;
	    serial_ind2_n	: in	std_logic;
	    insela		: in	std_logic;
	    inselb		: in	std_logic;
	    inselc		: in	std_logic;
	    inseld		: in	std_logic;
	    sdasel		: in	std_logic;
	    lpen		: in	std_logic;
	    oele		: in	std_logic;
	    bistle		: in	std_logic;
	    rxle		: in	std_logic;
	    boe			: in	std_logic_vector(7 downto 0);
	    bondst		: inout	std_logic_vector(1 downto 0);
	    masterb		: in	std_logic;
	    bond_all		: inout	std_logic;
	    bond_inhb		: in	std_logic;
	    lfiab		: out	std_logic;
	    lfibb		: out	std_logic;
	    lficb		: out	std_logic;
	    lfidb		: out	std_logic;
	    trstzb		: in	std_logic);

end component;

component cy_c39kdualport
    generic(DataWidth	: positive := 8;
	AddressWidth	: positive := 11;
	indata_reg	: BOOLEAN  := TRUE;
	addr_ctrl_reg	: BOOLEAN  := TRUE;
	outdataA_reg	: BOOLEAN  := FALSE;
	outdataB_reg	: BOOLEAN  := FALSE;
	FileName	: string   := "");
    port   (DIn_A	: in std_logic_vector(DataWidth-1 downto 0) :=(others => '0');
	    DIn_B	: in std_logic_vector(DataWidth-1 downto 0) :=(others => '0');
	    Addr_A	: in std_logic_vector(AddressWidth-1 downto 0):=(others=>'0');
	    Addr_B	: in std_logic_vector(AddressWidth-1 downto 0):=(others=>'0');
	    WEA	        : in  std_logic := '0';
	    WEB	        : in  std_logic := '0';
	    InClk_A	: in  std_logic := '0';
	    OutClk_A	: in  std_logic := '0';
	    OutRegA_AR  : in  std_logic := '0';
	    InClk_B	: in  std_logic := '0';
	    OutClk_B	: in  std_logic := '0';
	    OutRegB_AR  : in  std_logic := '0';
	    Addr_matchb	: out std_logic;
	    DOut_A	: out std_logic_vector(DataWidth-1 downto 0); 
	    DOut_B	: out std_logic_vector(DataWidth-1 downto 0));
end component;

component cy_c39kfifo
    generic(DataWidth	: positive := 8;
	NumWords	: positive := 512;
	PAFE_Distance	: natural  := 0);
    port   (DIn	        : in  std_logic_vector(DataWidth-1 downto 0);
	    DOut	: out std_logic_vector(DataWidth-1 downto 0);
	    ENR	        : in std_logic := '0';
	    ENW   	: in std_logic := '0';
	    CKR         : in std_logic := '0';
	    CKW         : in std_logic := '0';
	    MRb	        : in std_logic := '0';
	    EFb	        : out std_logic;
	    HFb	        : out std_logic;
	    PAFEb	: out std_logic);
end component;

component cy_c39ksingleport
    generic(DataWidth  	: positive := 8;
	AddressWidth	: positive := 13;
	indata_reg	: BOOLEAN  := TRUE;
	addr_ctrl_reg	: BOOLEAN  := TRUE;
	outdata_reg	: BOOLEAN  := FALSE;
	FileName	: string   := "");
    port   (Din		: in std_logic_vector(DataWidth-1 downto 0):=(others => '0');
	    Addr	: in std_logic_vector(AddressWidth-1 downto 0);
	    WE		: in std_logic := '0';
	    InClk	: in std_logic := '0';
	    OutClk	: in std_logic := '0';
	    OutReg_AR	: in std_logic := '0';
	    DOut	: out std_logic_vector(DataWidth-1 downto 0));
end component;

end rtlpkg;

--------------------------------------------------------------------------
--		Enties/Architectures for Generic RTL.			--
--------------------------------------------------------------------------

--
--	BUFOE
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_bufoe is
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: inout std_logic;
	    yfb	: out std_logic);
end cy_bufoe;

library ieee;
use ieee.std_logic_1164.all;

entity bufoe is
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: inout std_logic;
	    yfb	: out std_logic);
end bufoe;

ARCHITECTURE archRTL OF CY_BUFOE IS
BEGIN
    PROCESS (x, oe)
    BEGIN
	IF (oe = '1') THEN
	    if		(x = '0') then	y <= '0';
	    elsif	(x = '1') then	y <= '1';

	    else			y <= 'X';

	    end if;
	ELSE

	    y <= 'Z';

	END IF;

    END PROCESS;

    PROCESS (y)
    BEGIN
	if	(y = '1') then	yfb <= '1';

	elsif	(y = '0') then	yfb <= '0';
	else			yfb <= 'X';

	end if;

    END PROCESS;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF BUFOE IS
BEGIN
    U0: cy_bufoe port map (x, oe, y, yfb);
END archRTL;

--
--	DLTCH
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_dltch is
    port   (d	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end cy_dltch;

library ieee;
use ieee.std_logic_1164.all;

entity dltch is
    port   (d	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end dltch;

ARCHITECTURE archRTL OF CY_DLTCH IS
    SIGNAL qx : std_logic;
BEGIN
    qx	<= (d and e) or (d and qx) or (not(e) and qx);
    q	<= qx;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF dltch IS
BEGIN
    U0: cy_dltch port map (d, e, q);
END archRTL;

--
--	CY_DFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_dff is
    port   (d	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_dff;

library ieee;
use ieee.std_logic_1164.all;

entity dff is
    port   (d	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end dff;

ARCHITECTURE archRTL OF CY_DFF IS
BEGIN
      PROCESS
      BEGIN
	  WAIT UNTIL clk = '1';
	      q <= d;
      END PROCESS;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF dff IS
BEGIN
    U0: cy_dff port map (d, clk, q);
END archRTL;

--
--	XDFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_xdff is
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_xdff;

library ieee;
use ieee.std_logic_1164.all;

entity xdff is
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end xdff;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF CY_XDFF IS
    SIGNAL dx : std_logic;
BEGIN
    dx	<= x1 xor x2;
    u1 : CY_DFF port map(dx,clk,q);
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF xdff IS
BEGIN
    U0: cy_xdff port map (x1, x2, clk, q);
END archRTL;

--
--	JKFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_jkff is
    port   (j	: in std_logic;
	    k	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_jkff;

library ieee;
use ieee.std_logic_1164.all;

entity jkff is
    port   (j	: in std_logic;
	    k	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end jkff;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF CY_JKFF IS
    SIGNAL qx, dx : std_logic;
BEGIN
    dx	<= (j and not(qx)) or (not(k) and qx);
    q	<= qx;
    d1: CY_DFF port map(dx,clk,qx);
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF jkff IS
BEGIN
    U0: cy_jkff port map (j, k, clk, q);
END archRTL;

--
--	BUF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_buf is
    port   (x	: in std_logic;
	    y	: out std_logic);
end cy_buf;

library ieee;
use ieee.std_logic_1164.all;

entity buf is
    port   (x	: in std_logic;
	    y	: out std_logic);
end buf;

ARCHITECTURE archRTL OF CY_BUF IS
BEGIN
    y	<= x;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF buf IS
BEGIN
    U0: cy_buf port map (x, y);
END archRTL;

--
--	SRLCH
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_srlch is
    port   (s	: in std_logic;
	    r	: in std_logic;
	    q	: out std_logic);
end cy_srlch;

library ieee;
use ieee.std_logic_1164.all;

entity srlch is
    port   (s	: in std_logic;
	    r	: in std_logic;
	    q	: out std_logic);
end srlch;

ARCHITECTURE archRTL OF CY_SRLCH IS
    SIGNAL qx : std_logic;
BEGIN
    qx	<= (s and not(r)) or (qx and not(r));
    q	<= qx;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF srlch IS
BEGIN
    U0: cy_srlch port map (s, r, q);
END archRTL;

--
--	SRFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_srff is
    port   (s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_srff;

library ieee;
use ieee.std_logic_1164.all;

entity srff is
    port   (s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end srff;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF CY_SRFF IS
    SIGNAL qx, dx : std_logic;
BEGIN
    dx  <= not ((not(s) or r) and (not (qx) or r));
    q	<= qx;
    d: CY_DFF port map(dx,clk,qx);
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF srff IS
BEGIN
    U0: cy_srff port map (s, r, clk, q);
END archRTL;

--
--	DSRFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_dsrff is
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_dsrff;

library ieee;
use ieee.std_logic_1164.all;

entity dsrff is
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end dsrff;

ARCHITECTURE archRTL OF CY_DSRFF IS
BEGIN
    PROCESS (r, s, clk)
    BEGIN
	IF (r = '1') THEN
	    q <= '0';
	ELSIF (s = '1') THEN
	    q <= '1';
	ELSIF (clk = '1' AND clk'event) THEN
	    q <= d;
	END IF;
    END PROCESS;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF dsrff IS
BEGIN
    U0: cy_dsrff port map (d, s, r, clk, q);
END archRTL;

--
--	TSRFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_tsrff is
    port   (t	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_tsrff;

library ieee;
use ieee.std_logic_1164.all;

entity tsrff is
    port   (t	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end tsrff;

ARCHITECTURE archRTL of CY_TSRFF IS
   signal dtmp,qtmp : std_logic := '0';
BEGIN
    dtmp <= qtmp xor t;
    PROCESS (r, s, clk)
    BEGIN
	IF (r = '1') THEN
	    qtmp <= '0';
	ELSIF (s = '1') THEN
	    qtmp <= '1';
	ELSIF (clk = '1' AND clk'event) THEN
	    qtmp <= dtmp;
	END IF;
    END PROCESS;
    q <= qtmp;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF tsrff IS
BEGIN
    U0: cy_tsrff port map (t, s, r, clk, q);
END archRTL;

--
--	TFF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_tff is
    port   (t	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_tff;

library ieee;
use ieee.std_logic_1164.all;

entity tff is
    port   (t	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end tff;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF CY_TFF IS
    SIGNAL qx, dx : std_logic;
BEGIN
    dx	<= t xor qx;
    q	<= qx;
    d: CY_DFF port map(dx,clk,qx);
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF tff IS
BEGIN
    U0: cy_tff port map (t, clk, q);
END archRTL;

--
--	XBUF
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_xbuf is
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    q	: out std_logic);
end cy_xbuf;

library ieee;
use ieee.std_logic_1164.all;

entity xbuf is
    port   (x1	: in std_logic;
	    x2	: in std_logic;
	    q	: out std_logic);
end xbuf;

ARCHITECTURE archRTL OF CY_XBUF IS
BEGIN
    q	<= x1 xor x2;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF xbuf IS
BEGIN
    U0: cy_xbuf port map (x1, x2, q);
END archRTL;

--
--	TRIOUT
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_triout is
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: out std_logic);
end cy_triout;

library ieee;
use ieee.std_logic_1164.all;

entity triout is
    port   (x	: in std_logic;
	    oe	: in std_logic;
	    y	: out std_logic);
end triout;

ARCHITECTURE archRTL OF CY_TRIOUT IS
BEGIN
    PROCESS (x, oe)
    BEGIN
	IF (oe = '1') THEN
	    if		(x = '0') then	y <= '0';
	    elsif	(x = '1') then	y <= '1';

	    else			y <= 'X';

	    end if;
	ELSE

	    y <= 'Z';

	END IF;
    END PROCESS;
END archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF triout IS
BEGIN
    U0: cy_triout port map (x, oe, y);
END archRTL;

--
--	DSRLCH
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_dsrlch is
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end cy_dsrlch;

library ieee;
use ieee.std_logic_1164.all;

entity dsrlch is
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    e	: in std_logic;
	    q	: out std_logic);
end dsrlch;

ARCHITECTURE archRTL of CY_DSRLCH IS
    signal qi: std_logic;
BEGIN
    qi	<= (NOT(R) AND (S OR (D AND E) OR (qi AND NOT(E))));
    Q	<= qi;
end archRTL;

use work.rtlpkg.all;
ARCHITECTURE archRTL OF dsrlch IS
BEGIN
    U0: cy_dsrlch port map (d, s, r, e, q);
END archRTL;

--
--	DSRFFE
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_dsrffe is
    port   (d	: in std_logic;
	    s	: in std_logic;
	    r	: in std_logic;
	    e	: in std_logic;
	    clk	: in std_logic;
	    q	: out std_logic);
end cy_dsrffe;

architecture archRTL of CY_DSRFFE is
begin
    PROCESS (r, s, clk)
    BEGIN
	IF (r = '1') THEN
	    q <= '0';
	ELSIF (s = '1') THEN
	    q <= '1';
	ELSIF (clk = '1' AND clk'event) THEN
	    IF (e = '1') THEN
	        q <= d;
	    END IF;
	END IF;
    END PROCESS;
end archRTL;

--
--	CY_C39KCARRY
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_c39kcarry is
    port   (SelIn	: in std_logic;
	    Cpt0	: in std_logic;
	    Cpt1	: in std_logic;
	    SelOut	: out std_logic);
end cy_c39kcarry;

architecture archRTL of CY_C39KCARRY is
begin
    SelOut <= ((NOT SelIn) AND Cpt0) OR (SelIn AND (NOT Cpt1));
end archRTL;

--
--	CY_C39KXOR
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_c39kxor is
    port   (SIn 	: in std_logic;
	    PtmPts	: in std_logic;
	    XorOut	: out std_logic);
end cy_c39kxor;

architecture archRTL of CY_C39KXOR is
begin
    XorOut <= SIn XOR PtmPts;
end archRTL;

--
--	CY_C39KPLL
--

library ieee;
use ieee.std_logic_1164.all;

use work.rtlpkg.all;

entity cy_c39kpll is
    generic(feedback	: fdbk_source	:= DIRECT;
	    multiply	: positive	:= 1;
	    gclk0_phase	: natural	:= 0;
	    gclk0_divide: positive	:= 1;
	    gclk1_phase	: natural	:= 0;
	    gclk1_divide: positive	:= 1;
	    gclk2_phase	: natural	:= 0;
	    gclk2_divide: positive	:= 1;
	    gclk3_phase	: natural	:= 0;
	    gclk3_divide: positive	:= 1);
    port   (pll_in	: in  std_logic;
	    ext_fdbk	: in  std_logic	:= '0';
	    lock_detect	: out std_logic;
	    gclk0	: out std_logic;
	    gclk1	: out std_logic;
	    gclk2	: out std_logic;
	    gclk3	: out std_logic);
end cy_c39kpll;

architecture archRTL of CY_C39KPLL is
begin
end archRTL;

--
--	CY_25G01SERDES
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_25g01serdes is

    port   (txd		: in  std_logic_vector (15 downto 0) ;
	    fifo_rstb	: in  std_logic ;
	    loop_time	: in  std_logic ;
	    diagloop	: in  std_logic ;
	    loopa	: in  std_logic ;
	    lineloop	: in  std_logic ;
	    resetb	: in  std_logic ;
	    pwrdnb	: in  std_logic ;
	    lockrefb	: in  std_logic ;
	    refclk_n	: in  std_logic ;
	    refclk_p	: in  std_logic ;
	    serial_in_n : in  std_logic ;
	    serial_in_p	: in  std_logic ;
	    sd		: in  std_logic ;
	    serial_out_n: out std_logic ;
	    serial_out_p: out std_logic ;
	    fifo_err	: out std_logic ;

	    txclk	: out std_logic ;

	    rxd		: out std_logic_vector (15 downto 0) ;
	    rxclk	: out std_logic ;
	    lfib	: out std_logic );

end cy_25g01serdes;

architecture archRTL of cy_25g01serdes is
begin
    -- These are dummy assignments
    serial_out_n	<= '0';
    serial_out_p	<= '0';
    fifo_err		<= '0';
    txclk		<= '0';
    rxd			<= (others => '0');
    rxclk		<= '0';
    lfib		<= '0';
end archRTL;

--
--	CY_25G01SERDES_SLAVE
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_25g01serdes_slave is

    port   (txd		: in  std_logic_vector (15 downto 0) ;
	    fifo_rstb	: in  std_logic ;
	    loop_time	: in  std_logic ;
	    diagloop	: in  std_logic ;
	    loopa	: in  std_logic ;
	    lineloop	: in  std_logic ;
	    resetb	: in  std_logic ;
	    pwrdnb	: in  std_logic ;
	    lockrefb	: in  std_logic ;
	    refclk_n	: in  std_logic ;
	    refclk_p	: in  std_logic ;
	    serial_in_n : in  std_logic ;
	    serial_in_p	: in  std_logic ;
	    sd		: in  std_logic ;
	    serial_out_n: out std_logic ;
	    serial_out_p: out std_logic ;
	    fifo_err	: out std_logic ;

	    txclk	: in  std_logic ;

	    rxd		: out std_logic_vector (15 downto 0) ;
	    rxclk	: out std_logic ;
	    lfib	: out std_logic );

end cy_25g01serdes_slave;

architecture archRTL of cy_25g01serdes_slave is
begin
    -- These are dummy assignments
    serial_out_n	<= '0';
    serial_out_p	<= '0';
    fifo_err		<= '0';
    rxd			<= (others => '0');
    rxclk		<= '0';
    lfib		<= '0';
end archRTL;

--
--	CY_2GSERDES
--

library ieee;
use ieee.std_logic_1164.all;

use work.rtlpkg.cy_25g01serdes;

entity cy_2gserdes is

    port   (txd		: in  std_logic_vector (15 downto 0) ;
	    fifo_rstb	: in  std_logic ;
	    loop_time	: in  std_logic ;
	    diagloop	: in  std_logic ;
	    loopa	: in  std_logic ;
	    lineloop	: in  std_logic ;
	    resetb	: in  std_logic ;
	    pwrdnb	: in  std_logic ;
	    lockrefb	: in  std_logic ;
	    refclk_n	: in  std_logic ;
	    refclk_p	: in  std_logic ;
	    serial_in_n : in  std_logic ;
	    serial_in_p	: in  std_logic ;
	    sd		: in  std_logic ;
	    serial_out_n: out std_logic ;
	    serial_out_p: out std_logic ;
	    fifo_err	: out std_logic ;

	    txclk	: out std_logic ;

	    rxd		: out std_logic_vector (15 downto 0) ;
	    rxclk	: out std_logic ;
	    lfib	: out std_logic );

end cy_2gserdes;

architecture archRTL of cy_2gserdes is
begin

    UA: cy_25g01serdes port map (
	    txd		=>	txd,
            fifo_rstb	=>	fifo_rstb,
            loop_time	=>	loop_time,
            diagloop	=>	diagloop,
            loopa	=>	loopa,
            lineloop	=>	lineloop,
            resetb	=>	resetb,
            pwrdnb	=>	pwrdnb,
            lockrefb	=>	lockrefb,
            refclk_n	=>	refclk_n,
            refclk_p	=>	refclk_p,
            serial_in_n	=>	serial_in_n,
            serial_in_p	=>	serial_in_p,
            sd		=>	sd,
            serial_out_n=>	serial_out_n,
            serial_out_p=>	serial_out_p,
            fifo_err	=>	fifo_err,
            txclk	=>	txclk,
            rxd		=>	rxd,
            rxclk	=>	rxclk,
            lfib	=>	lfib);

end archRTL;

--
--	CY_25G02SERDES
--

library ieee;
use ieee.std_logic_1164.all;

use work.rtlpkg.cy_25g01serdes;
use work.rtlpkg.cy_25g01serdes_slave;

entity cy_25g02serdes is
    port   (txd_a		: in  std_logic_vector (15 downto 0);
	    txd_b		: in  std_logic_vector (15 downto 0);
	    fifo_rstb_a		: in  std_logic;
	    fifo_rstb_b		: in  std_logic;
	    loop_time		: in  std_logic;
	    diagloop_a		: in  std_logic;
	    diagloop_b		: in  std_logic;
	    loopa_a		: in  std_logic;
	    loopa_b		: in  std_logic;
	    lineloop_a		: in  std_logic;
	    lineloop_b		: in  std_logic;
	    resetb_a		: in  std_logic;
	    resetb_b		: in  std_logic;
	    pwrdnb_a		: in  std_logic;
	    pwrdnb_b		: in  std_logic;
	    lockrefb_a		: in  std_logic;
	    lockrefb_b		: in  std_logic;
	    refclk_n		: in  std_logic;
	    refclk_p		: in  std_logic;
	    serial_in_n_a	: in  std_logic;
	    serial_in_p_a	: in  std_logic;
	    serial_in_n_b	: in  std_logic;
	    serial_in_p_b	: in  std_logic;
	    sd_a		: in  std_logic;
	    sd_b		: in  std_logic;
	    serial_out_n_a	: out std_logic;
	    serial_out_p_a	: out std_logic;
	    serial_out_n_b	: out std_logic;
	    serial_out_p_b	: out std_logic;
	    fifo_err_a		: out std_logic;
	    fifo_err_b		: out std_logic;
	    txclk		: out std_logic;
	    rxd_a		: out std_logic_vector (15 downto 0);
	    rxd_b		: out std_logic_vector (15 downto 0);
	    rxclk_a		: out std_logic;
	    rxclk_b		: out std_logic;
	    lfib_a		: out std_logic;
	    lfib_b		: out std_logic);
end cy_25g02serdes;

architecture archRTL of cy_25G02serdes is
    signal internal_txclk : std_logic;
    signal Zero		  : std_logic := '0';
begin

    txclk <= internal_txclk;

    UA: cy_25g01serdes port map (
	    txd		=>	txd_a,
            fifo_rstb	=>	fifo_rstb_a,
            loop_time	=>	loop_time,
            diagloop	=>	diagloop_a,
            loopa	=>	loopa_a,
            lineloop	=>	lineloop_a,
            resetb	=>	resetb_a,
            pwrdnb	=>	pwrdnb_a,
            lockrefb	=>	lockrefb_a,
            refclk_n	=>	refclk_n,
            refclk_p	=>	refclk_p,
            serial_in_n	=>	serial_in_n_a,
            serial_in_p	=>	serial_in_p_a,
            sd		=>	sd_a,
            serial_out_n=>	serial_out_n_a,
            serial_out_p=>	serial_out_p_a,
            fifo_err	=>	fifo_err_a,
            txclk	=>	internal_txclk,
            rxd		=>	rxd_a,
            rxclk	=>	rxclk_a,
            lfib	=>	lfib_a);

    UB: cy_25g01serdes_slave port map (
	    txd		=>	txd_b,
            fifo_rstb	=>	fifo_rstb_b,
            loop_time	=>	Zero,
            diagloop	=>	diagloop_b,
            loopa	=>	loopa_b,
            lineloop	=>	lineloop_b,
            resetb	=>	resetb_b,
            pwrdnb	=>	pwrdnb_b,
            lockrefb	=>	lockrefb_b,
            refclk_n	=>	refclk_n,
            refclk_p	=>	refclk_p,
            serial_in_n	=>	serial_in_n_b,
            serial_in_p	=>	serial_in_p_b,
            sd		=>	sd_b,
            serial_out_n=>	serial_out_n_b,
            serial_out_p=>	serial_out_p_b,
            fifo_err	=>	fifo_err_b,
            txclk	=>	internal_txclk,
            rxd		=>	rxd_b,
            rxclk	=>	rxclk_b,
            lfib	=>	lfib_b);

end archRTL;

--
--	CY_15G04SERDES
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_15g04serdes is

    port (  txda		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txdb		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txdc		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txdd		: in	std_logic_vector(7 downto 0) := (others => '0');
	    txpera		: out	std_logic;
	    txperb		: out	std_logic;
	    txperc		: out	std_logic;
	    txperd		: out	std_logic;
	    txcta		: in	std_logic_vector(1 downto 0) := (others => '0');
	    txctb		: in	std_logic_vector(1 downto 0) := (others => '0');
	    txctc		: in	std_logic_vector(1 downto 0) := (others => '0');
	    txctd		: in	std_logic_vector(1 downto 0) := (others => '0');

	    txclka		: in	std_logic;

	    txclko_p		: out	std_logic;

	    txrate		: in	std_logic;
	    txmode		: in	std_logic_vector(1 downto 0);
	    txcksel		: in	std_logic;
	    txrstb		: in	std_logic;

	    rxda		: out	std_logic_vector(7 downto 0);
	    rxdb		: out	std_logic_vector(7 downto 0);
	    rxdc		: out	std_logic_vector(7 downto 0);
	    rxdd		: out	std_logic_vector(7 downto 0);
	    rxsta		: out	std_logic_vector(2 downto 0);
	    rxstb		: out	std_logic_vector(2 downto 0);
	    rxstc		: out	std_logic_vector(2 downto 0);
	    rxstd		: out	std_logic_vector(2 downto 0);

	    rxrate		: in	std_logic;
	    rfen		: in	std_logic;
	    rxmode		: in	std_logic_vector(1 downto 0);
	    rxcksel		: in	std_logic;
	    framchar		: in	std_logic;
	    rfmode		: in	std_logic;
	    decmode		: in	std_logic;

	    spdsel		: in	std_logic;
	    rxclka_p		: out	std_logic;
	    rxclkb_p		: inout	std_logic;
	    rxclkc_p		: out	std_logic;
	    rxclkd_p		: inout	std_logic;

	    refclk_p		: in	std_logic;
	    refclk_n		: in	std_logic;
	    serial_outa1_p	: out	std_logic;
	    serial_outb1_p	: out	std_logic;
	    serial_outc1_p	: out	std_logic;
	    serial_outd1_p	: out	std_logic;
	    serial_outa2_p	: out	std_logic;
	    serial_outb2_p	: out	std_logic;
	    serial_outc2_p	: out	std_logic;
	    serial_outd2_p	: out	std_logic;
	    serial_ina1_p	: in	std_logic;
	    serial_inb1_p	: in	std_logic;
	    serial_inc1_p	: in	std_logic;
	    serial_ind1_p	: in	std_logic;
	    serial_ina2_p	: in	std_logic;
	    serial_inb2_p	: in	std_logic;
	    serial_inc2_p	: in	std_logic;
	    serial_ind2_p	: in	std_logic;
	    serial_outa1_n	: out	std_logic;
	    serial_outb1_n	: out	std_logic;
	    serial_outc1_n	: out	std_logic;
	    serial_outd1_n	: out	std_logic;
	    serial_outa2_n	: out	std_logic;
	    serial_outb2_n	: out	std_logic;
	    serial_outc2_n	: out	std_logic;
	    serial_outd2_n	: out	std_logic;
	    serial_ina1_n	: in	std_logic;
	    serial_inb1_n	: in	std_logic;
	    serial_inc1_n	: in	std_logic;
	    serial_ind1_n	: in	std_logic;
	    serial_ina2_n	: in	std_logic;
	    serial_inb2_n	: in	std_logic;
	    serial_inc2_n	: in	std_logic;
	    serial_ind2_n	: in	std_logic;
	    insela		: in	std_logic;
	    inselb		: in	std_logic;
	    inselc		: in	std_logic;
	    inseld		: in	std_logic;
	    sdasel		: in	std_logic;
	    lpen		: in	std_logic;
	    oele		: in	std_logic;
	    bistle		: in	std_logic;
	    rxle		: in	std_logic;
	    boe			: in	std_logic_vector(7 downto 0);
	    bondst		: inout	std_logic_vector(1 downto 0);
	    masterb		: in	std_logic;
	    bond_all		: inout	std_logic;
	    bond_inhb		: in	std_logic;
	    lfiab		: out	std_logic;
	    lfibb		: out	std_logic;
	    lficb		: out	std_logic;
	    lfidb		: out	std_logic;
	    trstzb		: in	std_logic);

end cy_15g04serdes;

architecture archRTL of cy_15g04serdes is
begin
    -- These are dummy assignments
    txpera		<= '0';
    txperb		<= '0';
    txperc		<= '0';
    txperd		<= '0';
    txclko_p		<= '0';
--    txclko_n		<= '0';
    rxda		<= (others => '0');
    rxdb		<= (others => '0');
    rxdc		<= (others => '0');
    rxdd		<= (others => '0');
    rxsta		<= (others => '0');
    rxstb		<= (others => '0');
    rxstc		<= (others => '0');
    rxstd		<= (others => '0');
--    rxopa		<= '0';
--    rxopb		<= '0';
--    rxopc		<= '0';
--    rxopd		<= '0';
    rxclka_p		<= '0';
    rxclkb_p		<= '0';
    rxclkc_p		<= '0';
    rxclkd_p		<= '0';
    serial_outa1_p	<= '0';
    serial_outb1_p	<= '0';
    serial_outc1_p	<= '0';
    serial_outd1_p	<= '0';
    serial_outa2_p	<= '0';
    serial_outb2_p	<= '0';
    serial_outc2_p	<= '0';
    serial_outd2_p	<= '0';
    serial_outa1_n	<= '0';
    serial_outb1_n	<= '0';
    serial_outc1_n	<= '0';
    serial_outd1_n	<= '0';
    serial_outa2_n	<= '0';
    serial_outb2_n	<= '0';
    serial_outc2_n	<= '0';
    serial_outd2_n	<= '0';
    bondst		<= (others => '0');
    bond_all		<= '0';
    lfiab		<= '0';
    lfibb		<= '0';
    lficb		<= '0';
    lfidb		<= '0';
end archRTL;

--
--	CY_C39KMULTIPLY
--

library ieee;
use ieee.std_logic_1164.all;

library cypress;
use cypress.cypress.all;

entity cy_c39kmultiply is
    generic(IsSigned	: BOOLEAN := FALSE;
	DataWidthA	: positive;
	DataWidthB	: positive;
	DataWidthP	: positive;

	Hint		: goal_type := memory);

    port   (Data_A	: in  std_logic_vector(DataWidthA-1 downto 0);
	    Data_B	: in  std_logic_vector(DataWidthB-1 downto 0);
	    Product	: out std_logic_vector(DataWidthP-1 downto 0));
end cy_c39kmultiply;

architecture archRTL of cy_c39kmultiply is
begin
end archRTL;

--
--	Entities for Memory RTLs.
--

library ieee;
use ieee.std_logic_1164.all;

entity cy_c39kdualport is
    generic(DataWidth	: positive := 8;
	AddressWidth	: positive := 11;
	indata_reg	: BOOLEAN  := TRUE;
	addr_ctrl_reg	: BOOLEAN  := TRUE;
	outdataA_reg	: BOOLEAN  := FALSE;
	outdataB_reg	: BOOLEAN  := FALSE;
	FileName	: string   := "");
    port   (DIn_A	: in std_logic_vector(DataWidth-1 downto 0) :=(others => '0');
	    DIn_B	: in std_logic_vector(DataWidth-1 downto 0) :=(others => '0');
	    Addr_A	: in std_logic_vector(AddressWidth-1 downto 0):=(others=>'0');
	    Addr_B	: in std_logic_vector(AddressWidth-1 downto 0):=(others=>'0');
	    WEA	        : in  std_logic := '0';
	    WEB	        : in  std_logic := '0';
	    InClk_A	: in  std_logic := '0';
	    OutClk_A	: in  std_logic := '0';
	    OutRegA_AR  : in  std_logic := '0';
	    InClk_B	: in  std_logic := '0';
	    OutClk_B	: in  std_logic := '0';
	    OutRegB_AR  : in  std_logic := '0';
	    Addr_matchb	: out std_logic;
	    DOut_A	: out std_logic_vector(DataWidth-1 downto 0); 
	    DOut_B	: out std_logic_vector(DataWidth-1 downto 0));
end cy_c39kdualport;

library ieee;
use ieee.std_logic_1164.all;

entity cy_c39kfifo is
    generic(DataWidth	: positive := 8;
	NumWords	: positive := 512;
	PAFE_Distance	: natural  := 0);
    port   (DIn	        : in  std_logic_vector(DataWidth-1 downto 0);
	    DOut	: out std_logic_vector(DataWidth-1 downto 0);
	    ENR	        : in std_logic := '0';
	    ENW   	: in std_logic := '0';
	    CKR         : in std_logic := '0';
	    CKW         : in std_logic := '0';
	    MRb	        : in std_logic := '0';
	    EFb	        : out std_logic;
	    HFb	        : out std_logic;
	    PAFEb	: out std_logic);
end cy_c39kfifo;

library ieee;
use ieee.std_logic_1164.all;

entity cy_c39ksingleport is
    generic(DataWidth  	: positive := 8;
	AddressWidth	: positive := 13;
	indata_reg	: BOOLEAN  := TRUE;
	addr_ctrl_reg	: BOOLEAN  := TRUE;
	outdata_reg	: BOOLEAN  := FALSE;
	FileName	: string   := "");
    port   (Din		: in std_logic_vector(DataWidth-1 downto 0):=(others => '0');
	    Addr	: in std_logic_vector(AddressWidth-1 downto 0);
	    WE		: in std_logic := '0';
	    InClk	: in std_logic := '0';
	    OutClk	: in std_logic := '0';
	    OutReg_AR	: in std_logic := '0';
	    DOut	: out std_logic_vector(DataWidth-1 downto 0));
end cy_c39ksingleport;

architecture archRTL of cy_c39kdualport is
begin
end archRTL;

architecture archRTL of cy_c39kfifo is
begin
end archRTL;

architecture archRTL of cy_c39ksingleport is
begin
end archRTL;

