  always @(posedge clk)
    if (rst || ~pi_fine_dly_dec_done_r)
      delay_done    <= #TCQ 1'b0;
    else if ((delay_cnt_r == 6'd1) && (lane_cnt_dqs_c_r == 1'b0))
      delay_done    <= #TCQ 1'b1;
