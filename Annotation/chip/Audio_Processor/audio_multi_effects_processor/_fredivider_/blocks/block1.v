always @(posedge clk)
begin
	counter <= counter + 28'd1;
 if(counter>=DIVISOR)
		counter <= 28'd0;
	
	clk_out <= (counter<DIVISOR/2)? 1'b1 : 1'b0;
end