	for (i=0; i<`NUM_TESTS; i=i+1) begin 
		for (channel=0; channel<32; channel=channel+1) begin 
			data_in_vec = $random; 
			wb_write_strobe({16'h0000,4*channel[15:0]}, {24'h000000, data_in_vec}); 
			if ((channel==0)&&(i==0)) begin
				@(posedge ser_clk) begin frame_sync_in <= 1'b1; end 
			end else begin
				@(posedge ser_clk) begin frame_sync_in <= 1'b0; end 
			end
			for (bits=7; bits>=0; bits=bits-1) begin
				@(negedge ser_clk) begin data_out_reg[bits] = data_out; end 
			end
			if (data_out_reg !== data_in_vec) begin 
				$display("%t ERROR: failure found when truth_data = %h, channel = %d. Is %h but should be %h",
			  	$time, data_in_vec, channel, data_out_reg, data_in_vec); 
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
		end
	end