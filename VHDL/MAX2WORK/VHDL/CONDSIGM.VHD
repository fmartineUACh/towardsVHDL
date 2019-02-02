-- MAX+plus II VHDL Example
-- Conditional Signal Assignment with Multiple Alternatives
-- Copyright (c) 1994 Altera Corporation

ENTITY condsigm IS
	PORT
	(
		high, mid, low	: IN  BIT;
		q				: OUT INTEGER
	);
END condsigm;

ARCHITECTURE maxpld OF condsigm IS
BEGIN

q <=	3 WHEN high = '1' ELSE	-- when high
		2 WHEN mid  = '1' ELSE	-- when mid but not high
		1 WHEN low  = '1' ELSE	-- when low but not mid or high
		0;						-- when not low, mid, or high
		
END maxpld;

