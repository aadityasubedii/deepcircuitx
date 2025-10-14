  always @(posedge clk)
    if (rst || new_cnt_dqs_r)
      prbs_dqs_tap_limit_r <= #TCQ 1'b0;
    else if (prbs_dqs_tap_cnt_r == 6'd63)
      prbs_dqs_tap_limit_r <= #TCQ 1'b1;
    else
      prbs_dqs_tap_limit_r <= #TCQ 1'b0;