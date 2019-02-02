FUNCTION a8237 (clk, hlda, ncs, neopin, niorin, niowin, ready, reset,
		ain[3..0], dbin[7..0], dreq[3..0])
    RETURNS (adstb, aen, dben, dmaenable, hrq, neopout, niorout,
		niowout, nmemr, nmemw, aout[7..0], dack[3..0], dbout[7..0]);
