FUNCTION a8251 (clk, cnd, din[7..0], extsyncd, ncs, ncts, ndsr, nrd,
	nrxc, ntxc, nwr, nreset, rxd)
RETURNS (dout[7..0], ndtr, nen, nrts, rxrdy, syn_brk, txd, txempty, txrdy);
