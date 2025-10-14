task wb_write_strobe_e;
	
	input [31:0] wb_waddress_test_e;	
	input [31:0] wb_data_test_e;		

	begin
		@(posedge clk) begin			
			i_wb_adr_e <= wb_waddress_test_e;	
			i_wb_cyc_e <= 1'b1;			
			i_wb_stb_e <= 1'b1;			
			i_wb_we_e  <= 1'b1;			
			i_wb_dat_e <= wb_data_test_e;	
		end


		@(posedge clk) begin
			i_wb_we_e  <= 1'b0;			
			i_wb_cyc_e <= 1'b0;			
			i_wb_stb_e <= 1'b0;			
		end
	end
endtask