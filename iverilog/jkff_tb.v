module test;

reg clk=0;
reg j=0;
reg k=0;
reg reset=1;
wire q, qb;

  jkff_2 dut(reset,q,qb,j,k,clk);

initial	
  begin
    $dumpfile("jkff.vcd");
    $dumpvars(1);
	
	//Generate input signal d
	 j=1; k=1; #9 j=0; k=1; #1 j=1; k=0; #1 j=1; k=1; #2 j=1; k=0; #1 j=0; k=1; #12 j=1; k=1;
		#1 j=1; k=1; #2 j=1; k=1; #1 j=1; k=1; #1 j=1; k=0; #1 j=1; k=1; #1 j=1; k=1; # 7 j=0; k=0;
	
#5	
    j=1'b1;  // set your JK here
    k=1'b1; 
#5  reset=1'b0;
#25 $finish;
  end

always #1 clk=~clk;

endmodule