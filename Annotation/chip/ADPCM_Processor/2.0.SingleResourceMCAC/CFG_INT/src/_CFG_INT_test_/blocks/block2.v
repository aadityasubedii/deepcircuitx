		if (o_wb_dat_d !== truth_data_test_d) begin
			$display("%t DECODER ERROR: failure found when truth_data_d = %h, and wishbone has %h", $time, truth_data_test_d, o_wb_dat_d); 
			`ifdef ERRORSTOP
				$stop;
			`endif
		end