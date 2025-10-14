  always @(posedge clk)
    if (rst)
      cal2_done_r1  <= #TCQ 1'b0;
    else
      cal2_done_r1  <= #TCQ cal2_done_r;
