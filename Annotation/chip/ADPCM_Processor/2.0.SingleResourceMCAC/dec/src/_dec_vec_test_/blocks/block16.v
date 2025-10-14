always @(posedge reset, posedge clk) begin
	if (reset) begin
		program_start <= 1'b0;
	end else begin
		if((config_done == 1'b1) && (program_start == 0)) begin
			addrs = 7'b1000000;
			@(posedge clk);
			rs = 1'b1;
			@(posedge clk);
			rs = 1'b0;
			if (r_data == 1) begin
				program_start <= 1'b1;
			end
		end
	end
end