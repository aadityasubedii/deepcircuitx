always @(posedge reset, negedge enc_i_clk) begin
	if (reset | ~program_start) begin
		tdmo_fs_prev_e <= 1'b0;
		captured_data_e <= 1'b0;
		tdmo_test_count_e <= 'd0;
		tdmo_ch_count_e <= 'd0;
		tdmo_bit_count_e <= 'd7;
	end else begin
		if (tdmo_test_count_e <= loop_e) begin
			if (enc_i_fs & ~tdmo_fs_prev_e) begin
				data_out_e[0][7] <= enc_i;
				tdmo_bit_count_e <= 3'b110;
				tdmo_ch_count_e <= 5'b00000;
			end else begin
				data_out_e[tdmo_ch_count_e][tdmo_bit_count_e] <= enc_i;
				tdmo_bit_count_e <= tdmo_bit_count_e - 1'b1;
				if (tdmo_test_count_e == 'd0 && tdmo_ch_count_e == 5'b11111 && tdmo_bit_count_e == 3'b001) begin
					tdmo_bit_count_e <= 3'd7;
					tdmo_test_count_e <= tdmo_test_count_e + 1'b1;
					tdmo_ch_count_e <= 5'b00000;
				end else if (tdmo_bit_count_e == 3'd0) begin
						captured_data_e <= 1'b1;
						tdmo_bit_count_e <= 3'd7;
						tdmo_ch_count_e <= tdmo_ch_count_e + 1'b1;
						if (tdmo_ch_count_e == 5'b11111) begin
							tdmo_test_count_e <= tdmo_test_count_e + 1'b1;
							tdmo_ch_count_e <= 5'b00000;
						end
				end else begin
`ifdef ERRORCHECK
					if (captured_data_e && (tdmo_bit_count_e == 3'd7)) begin
`ifdef SINGLECHANNEL
					if ((tdmo_ch_count_e == 1) && (tdmo_test_count_e >= 1)) begin
						if (data_out_e[0] != data_out_vec_e[tdmo_test_count_e-1][7:0]) begin
							$display("%t TESTBENCHERROR: failure found for channel 0 and test number %d, when output data = %h but should be %h",$time,tdmo_test_count_e,data_out_e[0],data_out_vec_e[tdmo_test_count_e-1][7:0]); 
							$finish;
						end
					end
`else
					if (tdmo_test_count_e >= 1) begin
						if (tdmo_ch_count_e == 0) begin
							if (data_out_e[31] != data_out_vec_e[32*tdmo_test_count_e-33][7:0]) begin
								$display("%t TESTBENCHERROR: failure found for channel %h and test number %d, when output data = %h but should be %h",$time,tdmo_ch_count_e,tdmo_test_count_e,data_out_e[31],data_out_vec_e[32*tdmo_test_count_e-33][7:0]); 
								$finish;
							end
						end else begin
							if (data_out_e[tdmo_ch_count_e-1] != data_out_vec_e[32*tdmo_test_count_e+tdmo_ch_count_e-33][7:0]) begin
								$display		("%t TESTBENCHERROR: failure found for channel %h and test number %d, when output data = %h but should be %h",$time,tdmo_ch_count_e,tdmo_test_count_e,data_out_e[tdmo_ch_count_e-1],data_out_vec_e[32*tdmo_test_count_e+tdmo_ch_count_e-33][7:0]); 
								$finish;
							end
							else if ((tdmo_test_count_e % 100)==0 && tdmo_ch_count_e == 1) begin 
								$display("%t Passing tests so far. Currently on test number %d", $time, tdmo_test_count_e);
							end
						end
					end
`endif
					end
`endif
					captured_data_e <= 1'b0;
				end
			end
			tdmo_fs_prev_e <= enc_i_fs;
		end else begin
			$display("%t TESTBENCHFINISHED: simulation complete",$time);
			$finish;
		end
	end
end