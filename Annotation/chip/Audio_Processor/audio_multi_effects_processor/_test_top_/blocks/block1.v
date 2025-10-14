	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(1250*10**2) begin
			miso=~miso;
			#1000;
		end
	end