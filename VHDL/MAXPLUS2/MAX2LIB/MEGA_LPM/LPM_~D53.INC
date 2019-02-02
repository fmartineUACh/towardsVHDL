FUNCTION lpm_clshift(data[LPM_WIDTH-1..0],
		distance[LPM_WIDTHDIST-1..0], direction)
	WITH (LPM_WIDTH, LPM_WIDTHDIST, LPM_SHIFTTYPE)
	RETURNS (result[LPM_WIDTH-1..0], underflow, overflow);
