always @(posedge clock)
	if(reset) begin
		delay_counter <= 0;
		x <= 0;
	end else if(streg == st_done)
		if(delay_counter == sweep_delay) begin
			delay_counter <= 0;
			x <= (x == xmax) ? 0 : x + 1;
		end else delay_counter <= delay_counter + 1;