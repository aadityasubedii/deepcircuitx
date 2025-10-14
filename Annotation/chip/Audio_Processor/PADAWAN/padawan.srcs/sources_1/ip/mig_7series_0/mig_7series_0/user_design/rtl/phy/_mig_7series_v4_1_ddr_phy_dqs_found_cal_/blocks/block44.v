  always @(posedge clk) begin
    if (rst  ||
       (init_dqsfound_done_r && (rnk_cnt_r == RANKS-1)))
      rank_done_r       <= #TCQ 1'b0;
    else if (&pi_dqs_found_all_bank && ~(&pi_dqs_found_all_bank_r))
      rank_done_r <= #TCQ 1'b1;
    else
      rank_done_r       <= #TCQ 1'b0;
  end