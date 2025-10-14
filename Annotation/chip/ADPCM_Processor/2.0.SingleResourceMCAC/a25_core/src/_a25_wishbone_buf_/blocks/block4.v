assign o_ack   = (in_wreq ? (wbuf_used_r == 2'd0) : i_rdata_valid) || (ack_owed_r && pop);
assign o_valid = (wbuf_used_r != 2'd0 || i_req) && !wait_rdata_valid_r;