  always @(posedge clk) begin
    if (rst)
      rnk_cnt_r <= #TCQ 2'b00;
    else if (init_dqsfound_done_r)
      rnk_cnt_r <= #TCQ rnk_cnt_r;
    else if (rank_done_r)
      rnk_cnt_r <= #TCQ rnk_cnt_r + 1;
  end