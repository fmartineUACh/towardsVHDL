DEFINE CALC_PADD_WIDTHR(w, z, s) = w + (z-1)*s + CEIL(LOG2(z));

FUNCTION parallel_add (data[(size) - (1)..0][(width) - (1)..0], clock, aclr)
    WITH (width, size, WIDTHR, SHIFT, REPRESENTATION, PIPELINE, DEVICE_FAMILY, CARRY_CHAIN)
    RETURNS (result[(widthr) - (1)..0]);
