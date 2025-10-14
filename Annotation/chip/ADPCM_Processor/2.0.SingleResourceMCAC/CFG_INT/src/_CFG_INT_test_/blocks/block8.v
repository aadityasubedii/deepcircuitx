task wb_read_strobe_e;
	
	input [31:0] wb_address_test_e;				
	input [31:0] truth_data_test_e;

	begin

		i_wb_adr_e <= wb_address_test_e;	
		i_wb_cyc_e <= 1'b1;			
		i_wb_stb_e <= 1'b1;			
		i_wb_we_e  <= 1'b0;			

		@(posedge o_wb_ack_e); 
		@(posedge clk) begin
			i_wb_cyc_e <= 1'b0;
			i_wb_stb_e <= 1'b0;
		end

		if (o_wb_dat_e !== truth_data_test_e) begin
			$display("%t ENCODER ERROR: failure found when truth_data_e = %h", $time, truth_data_test_e, o_wb_dat_e, truth_data_test_e); 
			`ifdef ERRORSTOP
				$stop;
			`endif
		end

	end
endtask