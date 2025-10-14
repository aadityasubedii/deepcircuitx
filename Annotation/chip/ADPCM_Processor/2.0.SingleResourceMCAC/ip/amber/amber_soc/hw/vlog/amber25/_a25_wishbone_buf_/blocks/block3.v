assign o_wdata = wbuf_used_r != 2'd0 ? wbuf_wdata_r[wbuf_rp_r] : i_wdata;
assign o_write = wbuf_used_r != 2'd0 ? wbuf_write_r[wbuf_rp_r] : i_write;
assign o_addr  = wbuf_used_r != 2'd0 ? wbuf_addr_r [wbuf_rp_r] : i_addr;
assign o_be    = wbuf_used_r != 2'd0 ? wbuf_be_r   [wbuf_rp_r] : i_write ? i_be : 16'hffff;

assign o_ack   = (in_wreq ? (wbuf_used_r == 2'd0) : i_rdata_valid) || (ack_owed_r && pop);
assign o_valid = (wbuf_used_r != 2'd0 || i_req) && !wait_rdata_valid_r;

assign o_rdata = i_rdata;