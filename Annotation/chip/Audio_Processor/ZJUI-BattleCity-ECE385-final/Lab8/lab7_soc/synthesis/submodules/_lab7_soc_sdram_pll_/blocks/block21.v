	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe5a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe5a <= 1'b0;
		else if  (ena == 1'b1)   dffe5a <= (dffe4a & (~ sclr));
	