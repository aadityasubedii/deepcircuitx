		if (check_for_truth) begin
			sr = o_wb_dat;
			if (o_wb_dat !== truth_data_test) begin
				$display("%t TESTBENCHERROR: failure found when SR = %h. Is %h but should be %h",
			  	$time, truth_data_test, o_wb_dat, truth_data_test); 
				`ifdef ERRORSTOP
					$finish;
				`endif
			end