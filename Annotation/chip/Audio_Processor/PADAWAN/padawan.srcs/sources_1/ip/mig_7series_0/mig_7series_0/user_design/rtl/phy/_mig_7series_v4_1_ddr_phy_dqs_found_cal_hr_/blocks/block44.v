  always @(posedge clk) begin
    if (rst)
      dqs_found_done_r <= #TCQ 1'b0;
    else if (&pi_dqs_found_all_bank && (rnk_cnt_r == RANKS-1) && init_dqsfound_done_r1 &&
             (fine_adj_state_r == FINE_ADJ_DONE))
      dqs_found_done_r <= #TCQ 1'b1;
    else
      dqs_found_done_r <= #TCQ 1'b0;
  end