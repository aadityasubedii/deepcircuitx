	always @(posedge Sclk or negedge Reset_n)		
	begin
		if (!Reset_n)
		begin
			if (state_present > 4'd4)
				state_present = Reset;
			else
				state_present = state_next;
		end
		else
		state_present = state_next;
	end