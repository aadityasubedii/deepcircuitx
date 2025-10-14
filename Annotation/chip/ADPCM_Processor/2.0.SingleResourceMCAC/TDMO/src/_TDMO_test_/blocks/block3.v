task wb_read_strobe;
	
	input [31:0] wb_address_test;				

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
	end
endtask