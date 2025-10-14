always @(posedge reset, negedge dec_o_clk) begin
	if (reset | ~program_start) begin
		tdmo_fs_prev <= 1'b0;
		captured_data <= 1'b0;
		tdmo_delay_start <= 'd0;
	end else begin
		if (tdmo_test_count <= loop) begin
			if (dec_o_fs & ~tdmo_fs_prev) begin
				data_out[0][7] <= dec_o;
				tdmo_bit_count <= 3'b110;
				tdmo_ch_count <= 5'b00000;
			end else begin
				data_out[tdmo_ch_count][tdmo_bit_count] <= dec_o;
				tdmo_bit_count <= tdmo_bit_count - 1'b1;
				if (tdmo_test_count == 'd0 && tdmo_ch_count == 5'b11111 && tdmo_bit_count == 3'b001) begin
					tdmo_bit_count <= 3'd7;
					tdmo_test_count <= tdmo_test_count + 1'b1;
					tdmo_ch_count <= 5'b00000;
				end else if (tdmo_bit_count == 3'd0) begin
						captured_data <= 1'b1;
						tdmo_bit_count <= 3'd7;
						tdmo_ch_count <= tdmo_ch_count + 1'b1;
						if (tdmo_ch_count == 5'b11111) begin
							tdmo_test_count <= tdmo_test_count + 1'b1;
							tdmo_ch_count <= 5'b00000;
						end
				end else begin
`ifdef ERRORCHECK
					if (captured_data && (tdmo_bit_count == 3'd7)) begin
`ifdef SINGLECHANNEL
					if ((tdmo_ch_count == 1) && (tdmo_test_count >= 1)) begin
						if (data_out[0] != data_out_vec[tdmo_test_count-1][7:0]) begin
							$display("%t TESTBENCHERROR: failure found for channel 0 and test number %d, when output data = %h but should be %h",$time,tdmo_test_count-1'b1,data_out[0],data_out_vec[tdmo_test_count-1][7:0]); 
							$finish;
						end
					end
`else
					if (tdmo_test_count >= 1) begin
						if (tdmo_ch_count == 0) begin
							if (data_out[31] != data_out_vec[32*tdmo_test_count-33][7:0]) begin
								$display("%t TESTBENCHERROR: failure found for channel %h and test number %d, when output data = %h but should be %h",$time,tdmo_ch_count-1'b1,tdmo_test_count,data_out[31],data_out_vec[32*tdmo_test_count-33][7:0]); 
								$finish;
							end
						end else begin
							if (data_out[tdmo_ch_count-1] != data_out_vec[32*tdmo_test_count+tdmo_ch_count-33][7:0]) begin
								$display("%t TESTBENCHERROR: failure found for channel %h and test number %d, when output data = %h but should be %h",$time,tdmo_ch_count-1'b1,tdmo_test_count,data_out[tdmo_ch_count-1],data_out_vec[32*tdmo_test_count+tdmo_ch_count-33][7:0]); 
								$finish;
							end
							else if ((tdmo_test_count % 100)==0 && tdmo_ch_count == 1) begin 
								$display("%t Passing tests so far. Currently on test number %d", $time, tdmo_test_count);
								
							end
						end
					end
`endif
					end
`endif
					captured_data <= 1'b0;
				end
			end
			tdmo_fs_prev <= dec_o_fs;
		end else begin
			$display("%t TESTBENCHFINISHED: simulation complete",$time);
			$finish;
		end
	end
end