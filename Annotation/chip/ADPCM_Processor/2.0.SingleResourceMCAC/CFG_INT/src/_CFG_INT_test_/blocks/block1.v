task wb_write_strobe_d;
	
	input [31:0] wb_waddress_test_d;	
	input [31:0] wb_data_test_d;		

	begin
		@(posedge clk) begin			
			i_wb_adr_d <= wb_waddress_test_d;	
			i_wb_cyc_d <= 1'b1;			
			i_wb_stb_d <= 1'b1;			
			i_wb_we_d  <= 1'b1;			
			i_wb_dat_d <= wb_data_test_d;	
		end


		@(posedge clk) begin
			i_wb_we_d  <= 1'b0;			
			i_wb_cyc_d <= 1'b0;			
			i_wb_stb_d <= 1'b0;			
		end
	end
endtask