always @(posedge reset, posedge enc_s_clk) begin
	if (reset | ~program_start) begin
		ch_count_e <= 'd0;
		test_count_e <= 'd0;
		bit_count_e <= 'd7;
	end else begin
		if (test_count_e < loop_e)  begin
			if (ch_count_e == 5'd0) begin
				enc_s_fs <= 1'b1;
			end else begin
				enc_s_fs <= 1'b0;
			end
	`ifdef SINGLECHANNEL
			if (ch_count_e == 0) begin
				enc_s <= data_in_vec_e[test_count_e][bit_count_e];
			end else begin
				enc_s <= 1'b0;
			end
	`else
			enc_s <= data_in_vec_e[32*test_count_e + ch_count_e][bit_count_e];
	`endif
			bit_count_e <= bit_count_e - 1'b1;
			if (bit_count_e == 3'd0) begin
				ch_count_e <= ch_count_e + 1'b1;
				if (ch_count_e == 5'b11111) begin
					test_count_e <= test_count_e + 1'b1;
				end
			end
		end
	end
end