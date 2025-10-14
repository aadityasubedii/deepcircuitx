  always @(posedge clk) begin
    if (rst) periodic_rd_cntr_r <= #TCQ 1'b0;
    else if (periodic_rd_r && periodic_rd_ack_r_lcl)
       periodic_rd_cntr_r <= #TCQ ~periodic_rd_cntr_r;
  end