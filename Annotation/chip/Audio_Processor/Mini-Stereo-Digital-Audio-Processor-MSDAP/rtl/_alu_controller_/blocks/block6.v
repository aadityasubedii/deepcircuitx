	always @(Clear, next_stateL)
	begin
		if (Clear == 1'b1)
			present_stateL <= start_ini_state;
		else
			present_stateL <= next_stateL;
	end