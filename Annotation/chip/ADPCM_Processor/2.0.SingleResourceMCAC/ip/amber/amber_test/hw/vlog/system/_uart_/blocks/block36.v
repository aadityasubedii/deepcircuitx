assign o_wb_err = 1'd0;
assign o_wb_ack = i_wb_stb && ( wb_start_write || wb_start_read_d1 );
