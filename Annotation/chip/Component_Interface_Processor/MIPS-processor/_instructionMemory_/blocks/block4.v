	initial
	begin
		
		#5 instructionAdd = 16'd170;
		#1 $display("Test1: instruction=%b",instruction);
		
		#9 instructionAdd = 16'd231;
		#1 $display("Test2: instruction=%b",instruction);
	end