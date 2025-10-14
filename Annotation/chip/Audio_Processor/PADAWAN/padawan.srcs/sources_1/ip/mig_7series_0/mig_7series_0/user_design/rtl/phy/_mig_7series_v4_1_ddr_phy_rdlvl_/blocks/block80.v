  always @(posedge clk)
    if (rst)
      dlyinc_dq_r <= #TCQ 1'b0;
    else
      dlyinc_dq_r <= #TCQ cal1_dlyinc_dq_r;