	always @(posedge input_rdy_flag)
	begin
		if (data_in == 16'd0)
		begin
			zero_cnt = zero_cnt + 1'b1;
			if (zero_cnt == 12'd800)
				zero_flag = 1'b1;
			else if (zero_cnt > 12'd800)
			begin
				zero_cnt = 12'd800;
				zero_flag = 1'b1;
			end
		end		
		else if (data_in != 16'd0)
		begin
			zero_cnt = 12'd0;
			zero_flag = 1'b0;
		end
	end