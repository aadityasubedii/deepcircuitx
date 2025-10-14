 always @ (posedge clk_i)
     buf_avail_r <= #TCQ  (rd_data_received_counts + 64) - rd_data_counts_asked;
