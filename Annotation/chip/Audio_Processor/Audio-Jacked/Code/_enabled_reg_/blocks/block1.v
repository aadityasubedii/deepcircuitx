always @(posedge clk)
	if (reset)	b <= 0;
	else if (enable) b <= a;
	



endmodule