	initial 
	begin
		Dclk=1'b0;
		Sclk=1'b0;
		Reset_n=1'b1;
		
		Start = 1;
		$readmemh("midin.in", input_data) ;
		data_out=$fopen("data_out.out","w");
		
	
		#1302; Start = 0;
		Frame = 0;
		ib = 0;
		jb = 15;
		k = -1;
		l = 40;
	
	end