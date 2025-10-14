always @(posedge enc_s_clk) begin
	if (reset | ~program_start) begin
		delay_start <= 'd5;
	end else begin
		if (test_count < loop)  begin
			if (delay_start < 3) begin 
				delay_start <= delay_start + 1'b1;
			end else begin
				if ((ch_count == 5'd0) ) begin
					enc_s_fs <= 1'b1;
				end else begin
					enc_s_fs <= 1'b0;
				end
		`ifdef SINGLECHANNEL
				if (ch_count == 0) begin
					enc_s <= data_in_vec[test_count][bit_count];
				end else begin
					enc_s <= 1'b0;
				end
		`else
				enc_s <= data_in_vec[32*test_count + ch_count][bit_count];
		`endif
				bit_count <= bit_count - 1'b1;
				if (bit_count == 3'd0) begin
					ch_count <= ch_count + 1'b1;
					if (ch_count == 5'b11111) begin
						test_count <= test_count + 1'b1;
					end
				end
			end
		end
	end
end