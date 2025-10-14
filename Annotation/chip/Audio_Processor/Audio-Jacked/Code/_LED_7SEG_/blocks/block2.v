	always@(*)
	begin
		digit = 4'h0;
		enable = 4'hF; 
		
		if(ticks < 200000) 
		begin
			digit = data0; 
			enable[0] = 0;
		end
		else if((ticks > 200000) && (ticks < 400000)) 
		begin
			digit = data1; 
			enable[1] = 0;
		end
		else if((ticks > 400000) && (ticks < 600000)) 
		begin
			digit = data2; 
			enable[2] = 0;
		end
		else if((ticks > 600000) && (ticks < 800000)) 
		begin
			digit = data3; 
			enable[3] = 0;
		end
	end