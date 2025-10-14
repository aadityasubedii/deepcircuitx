task wb_read_strobe;
	
	input [31:0] wb_address_test;				
	input [31:0] truth_data_test;

	begin

		@(posedge new_data_int);

		@(posedge clk);

		@(posedge clk) begin
			i_wb_adr <= wb_address_test;	
			i_wb_cyc <= 1'b1;			
			i_wb_stb <= 1'b1;			
			i_wb_we  <= 1'b0;			
		end

		@(posedge o_wb_ack);

		
		@(posedge clk) begin
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
		end

		if (o_wb_dat !== truth_data_test) begin
			$display("%t ERROR: failure found when truth_data = %h, channel = %d. Is %h but should be %h",
		  	$time, truth_data_test, channel, o_wb_dat, truth_data_test); 
			`ifdef ERRORSTOP
				$stop;
			`endif
		end

	end
endtask