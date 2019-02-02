FUNCTION multcore (dataa[(lpm_widtha) - (1)..0], datab[(lpm_widthb) - (1)..0], clock, aclr)
    WITH (LPM_WIDTHA, LPM_WIDTHB, LPM_REPRESENTATION, LATENCY, ONE_INPUT_IS_CONSTANT, USE_EAB)
    RETURNS (result[((lpm_widtha) + (lpm_widthb)) - (1)..0]);
