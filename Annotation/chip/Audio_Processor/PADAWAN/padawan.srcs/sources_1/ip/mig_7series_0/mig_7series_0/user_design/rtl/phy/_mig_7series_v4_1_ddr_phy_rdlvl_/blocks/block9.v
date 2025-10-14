  always @(posedge clk)
    if (rst || new_cnt_cpt_r)
      idelay_tap_limit_r <= #TCQ 1'b0;
    else if (idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_r] == 'd31)
      idelay_tap_limit_r <= #TCQ 1'b1;
