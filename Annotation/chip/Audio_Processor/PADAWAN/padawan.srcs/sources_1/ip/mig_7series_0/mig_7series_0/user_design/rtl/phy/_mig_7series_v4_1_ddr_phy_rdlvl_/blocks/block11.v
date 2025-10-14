  always @(posedge clk)
    if (rst)
      idelay_tap_cnt_slice_r <= 5'h0;
    else
      idelay_tap_cnt_slice_r <= idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing];
