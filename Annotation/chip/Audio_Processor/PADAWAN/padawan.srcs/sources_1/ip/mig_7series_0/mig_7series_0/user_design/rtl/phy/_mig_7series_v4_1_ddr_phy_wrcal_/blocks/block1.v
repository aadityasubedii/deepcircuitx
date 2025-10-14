  always @(posedge clk)
    if (rst || (wrcal_sanity_chk && ~wrcal_sanity_chk_r))
      wrcal_done <= #TCQ 1'b0;
    else if (cal2_done_r)
      wrcal_done <= #TCQ 1'b1;
