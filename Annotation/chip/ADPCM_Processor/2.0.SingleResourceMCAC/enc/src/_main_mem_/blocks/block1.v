	assign o_wb_dat = wb_rdata32 ;                  
	assign o_wb_ack = i_wb_stb && ( start_write || start_read_d2 );