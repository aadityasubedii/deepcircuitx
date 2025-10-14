always @ (posedge clk_i)
    addr_counts_next_r <= #TCQ    addr_counts  + INC_COUNTS   ;
