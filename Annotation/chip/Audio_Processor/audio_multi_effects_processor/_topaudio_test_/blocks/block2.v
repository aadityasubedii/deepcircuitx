	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(2500*10**3) begin
			clock=~clock;
			#50;
		end
	end