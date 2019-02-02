-- MAX+plus II VHDL Example
-- LPM RAM Instantiation
-- Copyright (c) 1996 Altera Corporation


-- This part is optional if placing constants
-- in one location is desired.
PACKAGE ram_constants IS
	constant ADDR_WIDTH: INTEGER := 8;
	constant DATA_WIDTH: INTEGER := 8;
END ram_constants;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;
LIBRARY work;
USE work.ram_constants.all;

ENTITY ram256x8 IS
PORT(
	data	:	IN STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
	address :	IN STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
	we		:	IN STD_LOGIC;
	inclock	:	IN STD_LOGIC;
	outclock:	IN STD_LOGIC;
	q		:	OUT STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0)
);
END ram256x8;

ARCHITECTURE example OF ram256x8 IS

BEGIN

inst_1	: LPM_RAM_DQ
			GENERIC MAP (lpm_widthad => ADDR_WIDTH,
						 lpm_width => DATA_WIDTH)
			PORT MAP (data => data, address => address, we => we,
					  inclock => inclock, outclock => outclock,
					  q => q);

END example;

