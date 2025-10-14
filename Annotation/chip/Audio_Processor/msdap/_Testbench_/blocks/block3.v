	initial begin
		Dclk = 1;
		Sclk = 1;
		Frame = 0;
		InputL = 0;
		InputR = 0;
		Reset_n = 1;
		mismatches = 0;
		$readmemh ("data1.in", data);
		$display ("Read data: ");
    	Start = 1'b1;
		#2; Start = 1'b0;
	end