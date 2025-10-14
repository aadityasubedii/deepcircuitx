task wb_write_strobe;
	
	input [31:0] wb_waddress_test;	
	input [127:0] wb_data_test;		

	begin
		@(posedge clk) begin			
			i_wb_adr <= wb_waddress_test;	
			i_wb_cyc <= 1'b1;			
			i_wb_stb <= 1'b1;			
			i_wb_we  <= 1'b1;			
			i_wb_dat <= wb_data_test;	
		end


		@(posedge clk) begin
			i_wb_we  <= 1'b0;			
			i_wb_cyc <= 1'b0;			
			i_wb_stb <= 1'b0;			
		end
	end
endtask