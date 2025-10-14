	always@(posedge CLK_I_BUFG)
		if (reset || cnt_rst)
			begin
			count_bt <= 0;
			state_time <= 0;
			end
		else if (count < 40)
			begin
			count_bt <= count_bt + 1;
			state_time <= 0;
			end
		else
			begin
			count_bt <= 40;
			state_time <= 1;
			end