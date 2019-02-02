FUNCTION csfifo (data[(lpm_width) - (1)..0],
		wreq, rreq, clock, clockx2, clr,
		threshlevel[CEIL(LOG2(LPM_NUMWORDS))-1..0])
    WITH (LPM_WIDTH, LPM_NUMWORDS)
    RETURNS (q[(lpm_width) - (1)..0], threshold, empty, full);
