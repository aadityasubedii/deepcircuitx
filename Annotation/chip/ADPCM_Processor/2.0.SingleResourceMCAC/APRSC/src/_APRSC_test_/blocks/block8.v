task wb_read_a2p;
	
	input [31:0] wb_address_test;				
	input		 check_for_truth;
	input [31:0] truth_data_test;

	begin
		@(posedge clk) begin
			i_wb_adr <= wb_address_test;	
			i_wb_cyc <= 1'b1;			
			i_wb_stb <= 1'b1;			
			i_wb_we  <= 1'b0;			
		end

		@(posedge clk);

		@(posedge clk) begin
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
		end

		if (check_for_truth) begin
			a2p = o_wb_dat;
			if (o_wb_dat !== truth_data_test) begin
				$display("%t TESTBENCHERROR: failure found when A2P = %h. Is %h but should be %h",
			  	$time, truth_data_test, o_wb_dat, truth_data_test); 
				`ifdef ERRORSTOP
					$finish;
				`endif
			end
		end
	end
endtask