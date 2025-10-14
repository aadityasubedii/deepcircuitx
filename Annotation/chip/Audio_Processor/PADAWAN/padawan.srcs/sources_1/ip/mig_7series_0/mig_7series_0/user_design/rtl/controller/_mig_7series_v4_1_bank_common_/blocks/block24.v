  always @(posedge clk) was_wr <= #TCQ
             cmd[0] && ~(periodic_rd_r && ~periodic_rd_ack_r_lcl);