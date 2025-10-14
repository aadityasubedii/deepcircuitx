	initial
	begin
		
		
		
		#1 dataIn = 8'b00111101;
		#1 $display("Test1: dataOut=%b",dataOut);
	
		
		#1 dataIn = 8'b10111101;
		#1 $display("Test2: dataOut=%b",dataOut);
	end