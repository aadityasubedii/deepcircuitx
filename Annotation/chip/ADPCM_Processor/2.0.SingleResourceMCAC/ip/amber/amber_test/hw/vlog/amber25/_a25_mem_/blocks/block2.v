always @( posedge reset, posedge clk ) begin
	if (reset) begin
		mem_read_data_r <= 'd0;
		mem_read_data_valid_r <= 'd0;
		mem_load_rd_r <= 'd0;
	end else if ( !wb_stop || o_mem_stall ) begin
		mem_read_data_r         <= mem_read_data_c;
		mem_load_rd_r           <= mem_load_rd_c;
		mem_read_data_valid_r   <= mem_read_data_valid_c;
	end
end