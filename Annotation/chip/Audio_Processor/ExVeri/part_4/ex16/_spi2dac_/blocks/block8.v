	always @ (posedge clk)   
	  if (ctr==0) begin
		  ctr <= TIME_CONSTANT;
		  clk_1MHz <= ~clk_1MHz; 
		end
	  else
		  ctr <= ctr - 1'b1;