	always @( posedge reset, posedge clk ) begin
		if (reset) begin
			wr_en <= 'd0;
			wr_mask <= 'd0;
			wr_data <= 'd0;
			addr_d1 <= 'd0;
			for (k=0; k<(2**(MAIN_MSB-2)); k=k+1) begin
				ram[k] <= 'd0;
			end
		end else begin
			wr_en          <= start_write;
			wr_mask        <= ~ i_wb_sel; 
			wr_data        <= i_wb_dat;

			
			addr_d1        <= i_mem_ctrl ? {5'd0, i_wb_adr[24:2]} : i_wb_adr[29:2];

			if ( wr_en ) begin
				ram [addr_d1[27:2]]  <= masked_wdata;
			end
		end
	end