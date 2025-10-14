always @(posedge clk)
begin
	count <= count + 32'd1;
	
	if(count>=(DIVISOR-1))
		count <= 32'h0000;
 
 div_clk <= (count<DIVISOR/2)?1'b1:1'b0;

 end