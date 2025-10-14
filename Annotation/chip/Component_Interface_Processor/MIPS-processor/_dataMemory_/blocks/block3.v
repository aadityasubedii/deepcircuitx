	initial
	begin
		
		#5 regWrite=1; regRead=0; dataInAdd = 16'd370; dataIn = 16'd170;
		#10 regRead=1; regWrite=0;  dataInAdd = 16'd370;
		#1 $display("Test1: dataOut=%b",dataOut);
		
		
		#9 regWrite=1; regRead=0; dataInAdd = 16'd590; dataIn = 16'd54896;
		#10 regRead=1; regWrite=0;  dataInAdd = 16'd590;
		#1 $display("Test2: dataOut=%b",dataOut); 
		
	end