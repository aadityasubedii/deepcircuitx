assign data_rdy_o = data_rdy;
assign data_rdy = cmp_valid & data_valid_i;