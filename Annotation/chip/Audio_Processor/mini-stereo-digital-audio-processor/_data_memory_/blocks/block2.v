	always @(posedge in_flag)
	begin
		if (in_data == 16'd0)
		begin
			count_zero = count_zero + 1'b1;
			if (count_zero == 12'd800)
				flag_zero = 1'b1;
			else if (count_zero > 12'd800)
			begin
				count_zero = 12'd800;
				flag_zero = 1'b1;
			end
		end		
		else if (in_data != 16'd0)
		begin
			count_zero = 12'd0;
			flag_zero = 1'b0;
		end
	end