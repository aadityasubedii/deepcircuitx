always@( posedge reset, posedge clk ) begin
	if (reset) begin
		  read_data_filtered_r <= 'd0;
		  load_rd_r            <= 'd0;
	end else begin
		if ( i_wb_read_data_valid ) begin
		  read_data_filtered_r <= read_data_filtered;
		  load_rd_r            <= {i_wb_load_rd[6:5], i_wb_load_rd[3:0]};
		end
	end
end