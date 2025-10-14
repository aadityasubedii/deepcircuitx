assign wr_pointer_rd = ungray8(wr_pointer_d2);
assign rd_pointer_wr = ungray8(rd_pointer_d2);

assign o_data  = data[rd_pointer[1:0]];
assign o_full  = {~wr_pointer[2], wr_pointer[1:0]} == rd_pointer_wr;
assign o_empty = wr_pointer_rd == rd_pointer;