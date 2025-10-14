	initial begin
		
		Dclk = 0;
		Sclk = 0; 
		Start = 0;
		Reset = 1;
		Frame = 0;
		InputL = 0;
		InputR = 0;
		$readmemh("./data1.in", data);
		outfile = $fopen("data1.out", "wb");
		#1250
		Start = 1;
		#130
		Start = 0;
	end