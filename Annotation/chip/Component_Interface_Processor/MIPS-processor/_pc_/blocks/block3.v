	initial
	begin
		#5 inaddr=16'b0000000000000001;
		#1 $display("Test1: out address=%b",outaddr);
		
		#9 inaddr=16'b000000000001000;
		#1 $display("Test2: out address=%b",outaddr);
	end