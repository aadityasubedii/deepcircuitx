always @( posedge reset, posedge clk ) begin
	if (reset) begin
		mem_read_data_r <= 'd0;          
		mem_read_data_valid_r <= 'd0;    
		mem_load_rd_r <= 'd0;            
	end else begin
		if ( !i_mem_stall ) begin                                                                                                             
			mem_read_data_r         <= i_mem_read_data;
			mem_read_data_valid_r   <= i_mem_read_data_valid;
			mem_load_rd_r           <= i_mem_load_rd;
		end
	end
end