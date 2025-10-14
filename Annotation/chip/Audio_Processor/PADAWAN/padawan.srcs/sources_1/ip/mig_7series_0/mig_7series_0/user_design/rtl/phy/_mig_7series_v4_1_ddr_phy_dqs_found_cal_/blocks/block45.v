    always @(posedge clk) begin
    if (rst || (|pi_rst_stg1_cal_r))
      init_dqsfound_done_r  <= #TCQ 1'b0;
    else if (&pi_dqs_found_all_bank) begin
      if (rnk_cnt_r == RANKS-1)
        init_dqsfound_done_r  <= #TCQ 1'b1;
      else
        init_dqsfound_done_r  <= #TCQ 1'b0;
    end
  end