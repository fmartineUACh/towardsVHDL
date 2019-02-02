module micro ( 
	clk,
	reset,
	ro,
	rt,
	acc
	) ;

input  clk;
input  reset;
inout [3:0] ro;
inout [3:0] rt;
inout [3:0] acc;
