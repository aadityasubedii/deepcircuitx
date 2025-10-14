always @(posedge reset, posedge clk) begin
	if (reset) begin
		program_start <= 1'b0;
		e_mail <= 1'b0;
		d_mail <= 1'b0;
	end else begin
		if(config_done == 1 && program_start == 0) begin
			addrs = 7'b1000000;
			@(posedge clk);
			rs = 1'b1;
			@(posedge clk);
			rs = 1'b0;
			if (r_data == 1) begin
				d_mail = 1'b1;
			end
			addrs = 7'b1100000;
			@(posedge clk);
			rs = 1'b1;
			@(posedge clk);
			rs = 1'b0;
			if (r_data == 1) begin
				e_mail = 1'b1;
			end
			if (e_mail & d_mail) begin
				program_start <= 1'b1;
			end
		end
	end
end