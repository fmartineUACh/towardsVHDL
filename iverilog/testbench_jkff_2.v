module test;

reg clk=0;
reg j=0;
reg k=0;
reg reset=1;
wire q, qb;

  jkff_2 dut(reset,q,qb,j,k,clk);

initial	
  begin
    $dumpfile("jkff_2.vcd");
    $dumpvars(1);
    j=1'b1;  // set your JK here
    k=1'b1; 
#5  reset=1'b0;
#25 $finish;
  end

always #1 clk=~clk;

endmodule