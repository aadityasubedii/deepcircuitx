	initial
	begin
		
		IN0 = 1; IN1 = 0;
		#1 $display("IN0= %b, IN1= %b \n",IN0,IN1);
		
		S0 = 0;
		#1 $display("S0 = %b, OUTPUT = %b \n", S0, OUTPUT);
		
		S0 = 1;
		#1 $display("S0 = %b, OUTPUT = %b \n", S0, OUTPUT);
		
	end