FUNCTION lpm_counter (data[LPM_WIDTH-1..0], clock, clk_en, cnt_en, updown,
		aclr, aset, aconst, aload,
		sclr, sset, sconst, sload)
	WITH (LPM_WIDTH, LPM_DIRECTION, LPM_MODULUS, LPM_AVALUE, LPM_SVALUE)
	RETURNS(q[LPM_WIDTH-1..0], eq[15..0]);
