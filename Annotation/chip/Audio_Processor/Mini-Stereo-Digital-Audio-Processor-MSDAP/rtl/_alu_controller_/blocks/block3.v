	always @(Clear, next_stateR)
	begin
		if (Clear == 1'b1)
			present_stateR <= start_ini_state;
		else
			present_stateR <= next_stateR;
	end