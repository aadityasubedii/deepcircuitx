always @(posedge reset, posedge dec_i_clk) begin
	if (reset | ~program_start) begin
		ch_count_d <= 'd0;
		test_count_d <= 'd0;
		bit_count_d <= 'd7;
	end else begin
		if (test_count_d < loop_d)  begin
			if (ch_count_d == 5'd0) begin
				dec_i_fs <= 1'b1;
			end else begin
				dec_i_fs <= 1'b0;
			end
	`ifdef SINGLECHANNEL
			if (ch_count_d == 0) begin
				dec_i <= data_in_vec_d[test_count_d][bit_count_d];
			end else begin
				dec_i <= 1'b0;
			end
	`else
			dec_i <= data_in_vec_d[32*test_count_d + ch_count_d][bit_count_d];
	`endif
			bit_count_d <= bit_count_d - 1'b1;
			if (bit_count_d == 3'd0) begin
				ch_count_d <= ch_count_d + 1'b1;
				if (ch_count_d == 5'b11111) begin
					test_count_d <= test_count_d + 1'b1;
				end
			end
		end
	end
end