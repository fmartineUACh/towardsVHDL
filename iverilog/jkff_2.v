/* a different approach for the case
 2'b00: q<=q;
 2'b01: q<=1'b0;
 2'b10: q<=1'b1;
 2'b11: q<=~q;
*/	
module jkff_2(reset,q,qb,j,k,clk);
output q,qb;
input j,k,clk,reset;
//reg q,qb;
reg q;

assign qb = ~q;

initial 
	begin 
		q=1'b0; 
//		qb=1'b1; 
	end

always @ (posedge clk)
  begin
	case({j,k})
	/*
		 {1'b0,1'b0}:begin q=q; qb=qb; end
		 {1'b0,1'b1}: begin q=1'b0; qb=1'b1; end
		 {1'b1,1'b0}:begin q=1'b1; qb=1'b0; end
		 {1'b1,1'b1}: begin q=~q; qb=~qb; end		 
	*/
	{1'b0,1'b0}: q<=q;
 2'b01: q<=1'b0;
 2'b10: q<=1'b1;
 2'b11: q<=~q;
	endcase
   end
endmodule