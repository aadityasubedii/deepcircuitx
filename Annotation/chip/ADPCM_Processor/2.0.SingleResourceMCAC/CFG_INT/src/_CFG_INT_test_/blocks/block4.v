task wb_read_strobe_d;
	
	input [31:0] wb_address_test_d;				
	input [31:0] truth_data_test_d;

	begin

		i_wb_adr_d <= wb_address_test_d;	
		i_wb_cyc_d <= 1'b1;			
		i_wb_stb_d <= 1'b1;			
		i_wb_we_d  <= 1'b0;			

		@(posedge o_wb_ack_d); 
		@(posedge clk) begin
			i_wb_cyc_d <= 1'b0;
			i_wb_stb_d <= 1'b0;
		end

		if (o_wb_dat_d !== truth_data_test_d) begin
			$display("%t DECODER ERROR: failure found when truth_data_d = %h, and wishbone has %h", $time, truth_data_test_d, o_wb_dat_d); 
			`ifdef ERRORSTOP
				$stop;
			`endif
		end

	end
endtask