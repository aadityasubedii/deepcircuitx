assign wea_b0       = {16{i_write_enable & ~i_address[9]}} & i_byte_enable;
assign wea_b1       = {16{i_write_enable &  i_address[9]}} & i_byte_enable;
assign o_read_data  = address_9_r ? read_data_b1 : read_data_b0;