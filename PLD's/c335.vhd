--
--	Copyright Cypress Semiconductor Corporation, 1994,1995,1996
--	  as an unpublished work.
--
--------------------------------------------------------------------------
--		Components for Generic RTL.				--
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

PACKAGE rtlpkg IS

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

    attribute atomic_rtl of cy_bufoe : component is bufoe_type;
    attribute atomic_rtl of bufoe : component is bufoe_type;

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

    attribute atomic_rtl of cy_dff : component is dff_type;
    attribute atomic_rtl of dff : component is dff_type;

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

    attribute atomic_rtl of cy_xdff : component is xdff_type;
    attribute atomic_rtl of xdff : component is xdff_type;

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

    attribute atomic_rtl of cy_buf : component is buf_type;
    attribute atomic_rtl of buf : component is buf_type;

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

    attribute atomic_rtl of cy_dsrff : component is dsrff_type;
    attribute atomic_rtl of dsrff : component is dsrff_type;

    component cy_dpcff		-- D type flip flop with async. set and reset.
	port (
	    d	: IN std_logic;		-- D input to register.
	    s	: IN std_logic;		-- Set input Async.
	    r	: IN std_logic;		-- Reset input Async.
	    clk	: IN std_logic;		-- Positive edge Clock.
	    q	: OUT std_logic		-- Output from register.
	);
    end component;
    attribute atomic_rtl of cy_dpcff : component is dpcff_type;

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

    attribute atomic_rtl of cy_xbuf : component is xbuf_type;
    attribute atomic_rtl of xbuf : component is xbuf_type;

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

    attribute atomic_rtl of cy_triout : component is triout_type;
    attribute atomic_rtl of triout : component is triout_type;

-- c335 specials

    signal gsr	: std_logic;				-- Global sync. reset
    attribute node_num	of gsr : signal is 29;	-- is node 29.

    signal gss	: std_logic;				-- Global sync. set
    attribute node_num	of gss : signal is 30;	-- is node 30.

    component MC_C335
	generic(
	    has_output_register:boolean:= true
	);
	port(
	    x1	: in std_logic;		-- Exor Macro Input (Single).
	    x2	: in std_logic;		-- Exor Macro Input (Multiple).
	    clk	: in std_logic;		-- Positive edge, output reg, clock.
	    clk_i	: in std_logic;	-- Positive edge, input reg, clock.
	    oe	: in std_logic;		-- Output Enable.
	    q_bar	: out std_logic;	-- Output from output register.
	    q_i	: out std_logic;		-- Output from input register.
	    y	: inout std_logic;	-- Macro cell In/Out Pin.
	    yfb	: out std_logic		-- Feedback std_logic from Pin.
	);
    end component;
    attribute atomic_rtl of MC_C335 : component is MC_C335_type;

--  Schematic versions of macrocell.

    component MC335NR                   --  Non-registered.
	port(
	    x1	: in std_logic;		-- Exor Macro Input (Single).
	    x2	: in std_logic;		-- Exor Macro Input (Multiple).
	    clk	: in std_logic;		-- Positive edge, output reg, clock.
	    clk_i	: in std_logic;	-- Positive edge, input reg, clock.
	    oe	: in std_logic;		-- Output Enable.
	    q_bar	: out std_logic;	-- Output from output register.
	    q_i	: out std_logic;		-- Output from input register.
	    y	: inout std_logic;	-- Macro cell In/Out Pin.
	    yfb	: out std_logic		-- Feedback std_logic from Pin.
	);
    end component;

    component MC335RG                   --  Registered.
	port(
	    x1	: in std_logic;		-- Exor Macro Input (Single).
	    x2	: in std_logic;		-- Exor Macro Input (Multiple).
	    clk	: in std_logic;		-- Positive edge, output reg, clock.
	    clk_i	: in std_logic;	-- Positive edge, input reg, clock.
	    oe	: in std_logic;		-- Output Enable.
	    q_bar	: out std_logic;	-- Output from output register.
	    q_i	: out std_logic;		-- Output from input register.
	    y	: inout std_logic;	-- Macro cell In/Out Pin.
	    yfb	: out std_logic		-- Feedback std_logic from Pin.
	);
    end component;

    component ir_C335
	port(
	    d_i	: in std_logic;		-- D input to input register.
	    clk_i	: in std_logic;	-- Positive edge, input reg, clock.
	    q_i	: out std_logic		-- Output from input register.
	);
    end component;
    attribute atomic_rtl of ir_C335 : component is ir_C335_type;

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

    attribute atomic_rtl of cy_c39kmultiply : component is not_allowed_type;

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

    attribute atomic_rtl of cy_c39kpll : component is not_allowed_type;

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

    attribute atomic_rtl of cy_25g01serdes : component is not_allowed_type;

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

    attribute atomic_rtl of cy_25g02serdes : component is not_allowed_type;

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

    attribute atomic_rtl of cy_15g04serdes : component is not_allowed_type;

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

    attribute atomic_rtl of cy_c39kdualport : component is not_allowed_type;

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

    attribute atomic_rtl of cy_c39kfifo : component is not_allowed_type;

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

    attribute atomic_rtl of cy_c39ksingleport : component is not_allowed_type;

END rtlpkg;

--------------------------------------------------------------------------
--	Special Macro-cell definitions
--	Entities and  Architectrues
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library cypress;
use work.rtlpkg.all;

entity MC335NR is                       --  Non-registered.
    port(
	x1	: in std_logic;		-- Exor Macro Input (Single).
	x2	: in std_logic;		-- Exor Macro Input (Multiple).
	clk	: in std_logic;		-- Positive edge, output reg, clock.
	clk_i	: in std_logic;		-- Positive edge, input reg, clock.
	oe	: in std_logic;		-- Output Enable.
	q_bar	: out std_logic;		-- Output from output register.
	q_i	: out std_logic;		-- Output from input register.
	y	: inout std_logic;	-- Macro cell In/Out Pin.
	yfb	: out std_logic		-- Feedback std_logic from Pin.
    );
end MC335NR;

ARCHITECTURE archMC335NR OF MC335NR IS

	signal d,d_bar,q,yin : std_logic;

BEGIN

	U0: cy_xbuf port map (x1,x2,d);
	d_bar <= not d;
	U1: cy_bufoe port map (d_bar,oe,y,yin);
	yfb <= yin;
	U2: cy_dff port map (d,clk,q);
	q_bar <= not q;
	U3: cy_dff port map (yin,clk_i,q_i);

END archMC335NR;

library ieee;
use ieee.std_logic_1164.all;

library cypress;
use work.rtlpkg.all;

entity MC335RG is                       --  Registered.
    port(
	x1	: in std_logic;		-- Exor Macro Input (Single).
	x2	: in std_logic;		-- Exor Macro Input (Multiple).
	clk	: in std_logic;		-- Positive edge, output reg, clock.
	clk_i	: in std_logic;		-- Positive edge, input reg, clock.
	oe	: in std_logic;		-- Output Enable.
	q_bar	: out std_logic;		-- Output from output register.
	q_i	: out std_logic;		-- Output from input register.
	y	: inout std_logic;		-- Macro cell In/Out Pin.
	yfb	: out std_logic		-- Feedback std_logic from Pin.
    );
end MC335RG;

ARCHITECTURE archMC335RG OF MC335RG IS

	signal q,qb,yin : std_logic;

BEGIN

	U1: cy_xdff port map (x1,x2,clk,q);
	qb <= not q;
	q_bar <= not q;
	U2: cy_bufoe port map (qb,oe,y,yin);
	yfb <= yin;
	U3: cy_dff port map (yin,clk_i,q_i);

END archMC335RG;

--------------------------------------------------------------------------
--      Here is the device entity.
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

ENTITY C335 IS
PORT(	pin1  :IN	std_logic;
	pin2  :IN	std_logic;
	pin3  :IN	std_logic;
	pin4  :in	std_logic;
	pin5  :in	std_logic;
	pin6  :in	std_logic;
	pin7  :in	std_logic;
	pin9  :in	std_logic;
	pin10 :in	std_logic;
	pin11 :IN	std_logic;
	pin13 :IN	std_logic;
	pin12 :IN	std_logic;
	pin14 :in	std_logic;
	pin15 :INOUT	std_logic;
	pin16 :INOUT	std_logic;
	pin17 :INOUT	std_logic;
	pin18 :INOUT	std_logic;
	pin19 :INOUT	std_logic;
	pin20 :INOUT	std_logic;
	pin23 :INOUT	std_logic;
	pin24 :INOUT	std_logic;
	pin25 :INOUT	std_logic;
	pin26 :INOUT	std_logic;
	pin27 :INOUT	std_logic;
	pin28 :INOUT	std_logic);
END C335;
