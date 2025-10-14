        always @(posedge clk) occ_cnt_r <= #TCQ occ_cnt_ns;
        assign rd_buf_full = occ_cnt_ns[DATA_BUF_ADDR_WIDTH];

`ifdef MC_SVA
  rd_data_buffer_full: cover property (@(posedge clk) (~rst && rd_buf_full));
  rd_data_buffer_inc_dec_15: cover property (@(posedge clk)
         (~rst && rd_accepted && free_rd_buf && (occ_cnt_r == 'hf)));
  rd_data_underflow: assert property (@(posedge clk)
         (rst || !((occ_cnt_r == 'b0) && (occ_cnt_ns == 'h1f))));
  rd_data_overflow: assert property (@(posedge clk)
         (rst || !((occ_cnt_r == 'h10) && (occ_cnt_ns == 'h11))));
`endif
    end 