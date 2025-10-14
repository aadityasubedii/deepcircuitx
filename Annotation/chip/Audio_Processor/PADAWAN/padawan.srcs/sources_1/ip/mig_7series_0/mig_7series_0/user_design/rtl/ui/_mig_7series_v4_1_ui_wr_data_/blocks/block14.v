`ifdef MC_SVA
  wr_req_mc_full: cover property (@(posedge clk) (~rst && wr_req_16));
  wr_req_mc_full_inc_dec_15: cover property (@(posedge clk)
       (~rst && wr_accepted && rd_data_upd_indx_r && (wr_req_cnt_r == 5'hf)));
  wr_req_underflow: assert property (@(posedge clk)
         (rst || !((wr_req_cnt_r == 5'b0) && (wr_req_cnt_ns == 5'h1f))));
  wr_req_overflow: assert property (@(posedge clk)
         (rst || !((wr_req_cnt_r == 5'h10) && (wr_req_cnt_ns == 5'h11))));
`endif