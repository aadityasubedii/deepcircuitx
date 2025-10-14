assign o_wb_err = 1'd0;

assign write_data  = i_wb_dat;
assign byte_enable = i_wb_sel;
assign o_wb_dat    = read_data;
assign address     = i_wb_adr[MADDR_WIDTH+1:2];