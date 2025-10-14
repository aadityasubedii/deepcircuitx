	always @ (posedge sysclk)    
	  if (ctr==0) begin
		  ctr <= TC;
		  if (clk_1MHz==1'b0) 
				tick <= 1'b1;
		  clk_1MHz <= ~clk_1MHz; 
		end
	  else begin
		  ctr <= ctr - 1'b1;
		  tick <= 1'b0;
		end