	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe6a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe6a <= 1'b0;
		else if  (ena == 1'b1)   dffe6a <= (dffe5a & (~ sclr));
	assign
		ena = 1'b1,
		prn = 1'b1,
		q = dffe6a,
		sclr = 1'b0;
endmodule 