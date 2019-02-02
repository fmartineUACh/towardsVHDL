--
--	Copyright Cypress Semiconductor Corporation, 1993,1994,1995,1996
--	  as an unpublished work.
--

PACKAGE cypress IS

    TYPE rtl IS (
	DLTCH_type,
	DFF_type,
	XDFF_type,
	JKFF_type,
	BUF_type,
	BUFOE_type,
        SRL_type,
	SRFF_type,
	DSRFF_type,
	DPRFF_type,
	DPCFF_type,
	TFF_type,
	MC_C22V10_type,
	MC_C22VP10_type,
	MC_C610_type,
        MC_C330_type,
        IR_C330_type,
	MC_C333_type,
	MC_C335_type,
        IR_C335_type,
        MC_C340_type,
        MC_C340_B_type,
        FB_C340_type,
	IDFF_type,
	XBUF_type,
	TRIOUT_type,
        DSRLCH_type,
        TSRFF_type,
	IR_C331_type,
	PApbc_type,		-- unused
	PAincell_type,		-- unused
	PAbicell_type,		-- unused
	PAckcell_type,		-- unused
	PAfrag_a_type,		-- unused
	PAfrag_f_type,		-- unused
	PAfrag_m_type,		-- unused
	PAfrag_q_type,		-- unused
	PAlcell_type,		-- unused
        PAmacro_type,		-- unused
        PAclkbuf_type,		-- unused
	RTL_generic,		-- For special purposes, highly experimental
	NOT_RTL_type,
        NOT_ALLOWED_type
    );

-------------------------------------------------------------------------------
--  For internal Warp use:
-------------------------------------------------------------------------------
    ATTRIBUTE atomic_rtl	: RTL;		-- Used on RTL components.
    attribute replacement_rtl	: string;	-- Mark impending obsolesence.
    ATTRIBUTE no_op		: BOOLEAN;	-- used on type conversion
    --  Builtin FILE I/O routine attributes:
    TYPE fileio_types IS (
	FR_none,			-- Not one of ours.
	FR_read_file,			-- Read value into a file.
	FR_write_file,			-- Write value to a file.
	FR_end_file,			-- Function to test EOF.
	FR_read_line,			-- Read a line.
	FR_textio_read,			-- One of the formatted readers.
	FR_write_line,			-- Write a line.
	FR_textio_write			-- Formatted write.
    );
    ATTRIBUTE fileio_builtin	: fileio_types;
    CONSTANT  nd_auto	: NATURAL := 3201;	-- automaticly assigned node.
    CONSTANT  nd_delete	: NATURAL := 3202;	-- force node to be deleted.

    TYPE port_state_type IS (
        ps_tied_low,    -- Tied to '0'.
        ps_tied_high,   -- Tied to '1'.
        ps_open,        -- Unconnected.
        ps_connected    -- Connected to a signal.
    );
    ATTRIBUTE port_state_att : port_state_type;
    ATTRIBUTE ultragen : string;         --  Module to subst.
    ATTRIBUTE globally_static : boolean; --  Magic att. for testing ports.

---------------------------------------------------------------------------
--  Synthesis attributes: -- Will not be available in Warp 5.0
---------------------------------------------------------------------------
    ATTRIBUTE soft		: BOOLEAN;	-- force to expander
    ATTRIBUTE mcell		: BOOLEAN;	-- force to macrocell

---------------------------------------------------------------------------
--  Synthesis attributes: -- The following are Obsolete as of 4.2
---------------------------------------------------------------------------
    ATTRIBUTE dont_touch        : BOOLEAN;      -- Don't optimize. (Obsolete)
    ATTRIBUTE fixed_ff          : STRING;       -- Fixed Flip-Flop.
    ATTRIBUTE max_load          : INTEGER;      -- Max. load on a signal.
    TYPE pad_gen_type IS (
        pad_none,       -- pad generation off (really forces an IO)
        pad_auto,       -- software selects best one (the default)
	pad_clock,	-- force clock pad
	pad_hd1,	-- force input pad (hd1 pad)
	pad_hd2,	-- force hd2 pad
	pad_hd3,	-- force hd3 pad
	pad_hd4,	-- force hd4 pad
	pad_io		-- force a normal io pad
    );
    ATTRIBUTE pad_gen : pad_gen_type ;

    TYPE buffer_type IS (
	buf_none,	-- No buffer
	buf_auto,	-- Software selects buffer type (the default)
	buf_normal,	-- Force normal buffering
	buf_split,	-- UNSUPPORTED **DO NOT USE**
	buf_duplicate,	-- Force duplicate logic
	buf_register	-- Force register duplication
    );
    ATTRIBUTE buffer_gen : buffer_type ;

---------------------------------------------------------------------------
--  Synthesis attributes:
---------------------------------------------------------------------------
    ATTRIBUTE part_name		: STRING;	-- Specifies Cypress part.
    ATTRIBUTE order_code	: STRING;	-- Specifies Cyp. order code.
    ATTRIBUTE pin_numbers	: STRING;	-- Assign pin numbers.
    ATTRIBUTE pin_avoid		: STRING;	-- Avoid these pins
    ATTRIBUTE no_factor		: BOOLEAN;	-- do not factor expression
    ATTRIBUTE no_latch		: BOOLEAN;	-- do not synth. latch
    ATTRIBUTE lab_force		: STRING;	-- force a lab assignment
						-- (C340 family)
						--  functions
    ATTRIBUTE synthesis_off     : BOOLEAN;      -- Don't make virtual.
    ATTRIBUTE opt_level         : INTEGER;      -- Same as -On switch.
    TYPE goal_type IS (                         -- Synthesis goal.
        speed,
        area,
        combinatorial,
	memory
    );

    ATTRIBUTE goal              : goal_type;
    TYPE flipflop_type IS (
	ff_d,		-- Forces flip flop selection to D type.
	ff_t,		-- Forces flip flop selection to T type.
	ff_opt,		-- Allows software to select optimum flip flop.
	ff_default	-- Flip Flop is assigned based on default.
			--  The default is base on command line switches.
    );
    ATTRIBUTE ff_type		: flipflop_type;

    TYPE polarity_select IS (
	pl_keep,	-- Keep polarity of signal as specified.
	pl_opt,		-- Optimize polarity of signal.
	pl_default	-- Allowance of software to optomize polarity 
			--  on default set up by command line swithches.
    );
    ATTRIBUTE polarity		: polarity_select;

    --  Attribute node_num.
    ATTRIBUTE node_num	: NATURAL;		-- "node number" kludge.

    --  Attribute node_num.
    ATTRIBUTE node_cost	: NATURAL;		-- node cost for virt. sub. (0
                                                -- to 11 is valid range)

    --  Default Unit Delay for simulation.
    CONSTANT unit_delay	: TIME	:= 1 ns;

    --  Enumerated-type synthesis:
    TYPE FSM_synth_type IS (
	sequential,
	one_hot_zero,
        one_hot_one,
	gray,
	user_codes
    );
    ATTRIBUTE State_encoding	: FSM_synth_type;
    ATTRIBUTE Enum_encoding	: String;

    -- Sum splitting; whether to use balanced or cascaded macrocells.
    TYPE Sum_split_type IS (
	balanced,
	cascaded
    );

    ATTRIBUTE Sum_split : Sum_split_type;

---------------------------------------------------------------------------
--  Synthesis attributes: -- Specific to the 37000,39000 family
---------------------------------------------------------------------------
    TYPE Slew_rate_type IS (
	fast,
	slow
    ) ;
    ATTRIBUTE Slew_rate : Slew_rate_type ;
    ATTRIBUTE Low_power : STRING;

---------------------------------------------------------------------------
--  Synthesis attributes: -- Specific to the 39000 family
---------------------------------------------------------------------------
    TYPE IO_reg_type IS (
	ioreg_auto,		-- Software determines the proper mapping
	ioreg_iocell,		-- Force reg. to an IO cell when legal
	ioreg_macrocell,	-- Force reg. to a macro-cell
	ioreg_duplicate		-- Reserved for future use
    ) ;
    ATTRIBUTE Input_reg		: IO_reg_type ;
    ATTRIBUTE Output_reg	: IO_reg_type ;
    ATTRIBUTE Oe_reg		: IO_reg_type ;

    ATTRIBUTE Bus_hold  	: Boolean ;
    ATTRIBUTE Macrocell_loc	: String ;
    ATTRIBUTE Lab_group		: String ;
    ATTRIBUTE Cluster_group	: String ;

    TYPE Map_to_memory_type IS (
	mmap_auto,		-- Software follows the global default
	mmap_none,		-- Do not map logic to memory
	mmap_area,		-- Map for area even at the expense of speed
	mmap_speed		-- Map for area without sacrificing speed
    ) ;
    ATTRIBUTE map_to_memory	: Map_to_memory_type ;

    ATTRIBUTE IO_Type		: String ;

    -- Bank settings for all banks (in one string) that overrides the
    -- entity setting each bank setting is of the form
    -- "<Bank#,VCC_VALUE,VREF_VALUE>" where bank numbers go from (0-7)
    -- Following is an example
    --     attribute IO_Bank of mydesign:entity is "<0,3.3,1.25><3,2.5, 1.5>" ;
    -- You can use NA for the VREF_VALUE
    ATTRIBUTE IO_Bank		: String ;

    -- The cy_memory_type directive can be used to control the type of memory that is allocated
    -- for memories that are allocated for user instantiated memories.  This attribute only
    -- applies to mram_d and mram_io (single port rams).  For dual-port rams and FIFOs, the only
    -- choice is "channel" memory and hence this attribute is not even consulted for those rams.
    TYPE cy_mem_types IS (
	cy_mem_auto,		-- Allocate either an available cluster or channel memory
	cy_mem_channel,		-- Force implementation in channel memory
	cy_mem_cluster		-- Force implementation in cluster memory
    );
    ATTRIBUTE cy_memory_type 	: cy_mem_types;

    -- The channel_mem_loc directive can be used to specify the exact location of the target channel
    -- memory.  This directive applies to the dual-port and FIFO memories.  It can also apply to
    -- single-port memories that get implemented as a channel memory.

    ATTRIBUTE channel_mem_loc 	: String;

    -- The cluster_mem_loc directive can be used to specify the exact location of the target cluster
    -- memory.  This directive applies to the single-port memories that are in fact implemented
    -- as a cluster memory.

    ATTRIBUTE cluster_mem_loc 	: String;


---------------------------------------------------------------------------
--  General utils:
---------------------------------------------------------------------------
    --  Cypress types:
    --  This is provided only for compatibility with V3.5. Starting
    --  with V4.0, the std_logic type should be used instead and it is
    --  defined in the ieee.std_logic_1164 package
    TYPE x01z IS (
	'x',
	'0',
	'1',
	'z'
    );
    TYPE x01z_vector	IS ARRAY (INTEGER RANGE <>) OF x01z;

    -- Resolution function for simulation:
    FUNCTION wired_or	(source : x01z_vector) RETURN x01z;

    -- functions for type conversions in port maps:
    FUNCTION fbx (in1 : BIT)	RETURN x01z;
    FUNCTION fxb (in1 : x01z)	RETURN BIT;
    FUNCTION bit2bool (in1 : BIT)	RETURN boolean;
    FUNCTION bool2bit (in1 : boolean)	RETURN BIT;

    -- global signals for constants
    -- these belong in here with the RTL types
    SIGNAL one	: BIT	:= '1';
    SIGNAL zero	: BIT	:= '0';

END cypress;

PACKAGE BODY cypress IS

    FUNCTION fbx (in1 : BIT)	RETURN x01z IS
    BEGIN
	IF (in1='1')
	    THEN RETURN '1';
	    ELSE RETURN '0';
	END IF;
    END fbx;

    FUNCTION fxb (in1 : x01z)	RETURN BIT IS
    BEGIN
	IF (in1='0')
	    THEN RETURN '0';
	    ELSE RETURN '1';
	END IF; 
    END fxb;

    FUNCTION bit2bool (in1 : BIT)	RETURN boolean IS
    BEGIN
        RETURN (in1='1');
    END bit2bool;

    FUNCTION bool2bit (in1 : boolean)	RETURN BIT IS
    BEGIN
	IF (in1)
	    THEN RETURN '1';
	    ELSE RETURN '0';
	END IF; 
    END bool2bit;

    -- Resolution Fucntion wired_or:
    -- Assumes 1 wins conflict.  Passes x, does not generate x.
    -- Any drive 1, bus is 1.
    -- Else any drive X, bus is X.
    -- Else any drive 0, bus is 0.
    -- Else, Z.
    FUNCTION wired_or (source : x01z_vector) RETURN x01z IS
	VARIABLE bus_level : x01z := 'z';
    BEGIN
	FOR i IN source'RANGE LOOP
	    CASE bus_level IS
		WHEN 'x' =>
		    IF source(i) = '1' THEN	bus_level := '1';
		    ELSE			NULL;
		    END IF;
		WHEN '0' =>
		    IF source(i) = 'z' THEN	NULL;
		    ELSE			bus_level := source(i);
		    END IF;
		WHEN '1' =>			NULL;
		WHEN 'z' =>			bus_level := source(i);
	    END CASE;
	END LOOP;
	RETURN bus_level;
    END wired_or;

END cypress; 
