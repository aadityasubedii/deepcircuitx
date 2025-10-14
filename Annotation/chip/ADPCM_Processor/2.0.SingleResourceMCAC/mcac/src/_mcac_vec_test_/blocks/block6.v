always @(posedge reset, negedge dec_s_clk) begin
	if (reset | ~program_start) begin
		tdmo_fs_prev_d <= 1'b0;
		captured_data_d <= 1'b0;
		tdmo_test_count_d <= 'd0;
		tdmo_ch_count_d <= 'd0;
		tdmo_bit_count_d <= 'd7;
	end else begin
		if (tdmo_test_count_d <= loop_d) begin
			if (dec_s_fs & ~tdmo_fs_prev_d) begin
				data_out_d[0][7] <= dec_s;
				tdmo_bit_count_d <= 3'b110;
				tdmo_ch_count_d <= 5'b00000;
			end else begin
				data_out_d[tdmo_ch_count_d][tdmo_bit_count_d] <= dec_s;
				tdmo_bit_count_d <= tdmo_bit_count_d - 1'b1;
				if (tdmo_test_count_d == 'd0 && tdmo_ch_count_d == 5'b11111 && tdmo_bit_count_d == 3'b001) begin
					tdmo_bit_count_d <= 3'd7;
					tdmo_test_count_d <= tdmo_test_count_d + 1'b1;
					tdmo_ch_count_d <= 5'b00000;
				end else if (tdmo_bit_count_d == 3'd0) begin
						captured_data_d <= 1'b1;
						tdmo_bit_count_d <= 3'd7;
						tdmo_ch_count_d <= tdmo_ch_count_d + 1'b1;
						if (tdmo_ch_count_d == 5'b11111) begin
							tdmo_test_count_d <= tdmo_test_count_d + 1'b1;
							tdmo_ch_count_d <= 5'b00000;
						end
				end else begin
`ifdef ERRORCHECK
					if (captured_data_d && (tdmo_bit_count_d == 3'd7)) begin
`ifdef SINGLECHANNEL
					if ((tdmo_ch_count_d == 1) && (tdmo_test_count_d >= 2)) begin
						if (data_out_d[0] != data_out_vec_d[tdmo_test_count_d-2][7:0]) begin
							$display("%t TESTBENCHERROR: failure found for channel 0 and test number %d, when output data = %h but should be %h",$time,tdmo_test_count_d,data_out_d[0],data_out_vec_d[tdmo_test_count_d-1][7:0]); 
							$finish;
						end
					end
`else
					if (tdmo_test_count_d >= 2) begin
						if (tdmo_ch_count_d == 0) begin
							if (data_out_d[31] != data_out_vec_d[32*tdmo_test_count_d-65][7:0]) begin
								$display("%t TESTBENCHERROR: failure found for channel %h and test number %d, when output data = %h but should be %h",$time,tdmo_ch_count_d,tdmo_test_count_d,data_out_d[31],data_out_vec_d[32*tdmo_test_count_d-33][7:0]); 
								$finish;
							end
						end else begin
							if (data_out_d[tdmo_ch_count_d-1] != data_out_vec_d[32*tdmo_test_count_d+tdmo_ch_count_d-65][7:0]) begin
								$display		("%t TESTBENCHERROR: failure found for channel %h and test number %d, when output data = %h but should be %h",$time,tdmo_ch_count_d,tdmo_test_count_d,data_out_d[tdmo_ch_count_d-1],data_out_vec_d[32*tdmo_test_count_d+tdmo_ch_count_d-33][7:0]); 
								$finish;
							end
							else if ((tdmo_test_count_d % 100)==0 && tdmo_ch_count_d == 1) begin 
								$display("%t Passing tests so far. Currently on test number %d", $time, tdmo_test_count_d);
							end
						end
					end
`endif
					end
`endif
					captured_data_d <= 1'b0;
				end
			end
			tdmo_fs_prev_d <= dec_s_fs;
		end else begin
			$display("%t TESTBENCHFINISHED: simulation complete",$time);
			$finish;
		end
	end
end