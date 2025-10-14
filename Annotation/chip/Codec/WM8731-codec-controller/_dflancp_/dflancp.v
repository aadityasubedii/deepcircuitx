module dflancp (clk, reset, in, flanc);

	input clk, in, reset;
	output flanc;
	
	reg anterior;
	
	always @ (posedge clk or posedge reset)
	if (reset) anterior <= 0;
	else anterior <= in;
	
	assign flanc = !anterior && in;
	
endmodule
