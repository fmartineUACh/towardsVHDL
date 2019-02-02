FUNCTION lpm_latch (data[LPM_WIDTH-1..0], gate, aclr, aset, aconst)
	WITH (LPM_WIDTH, LPM_AVALUE)
	RETURNS(q[LPM_WIDTH-1..0]);

