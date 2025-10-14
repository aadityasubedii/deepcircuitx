  always @(posedge clk)
    if (rst)
      rd_victim_sel    <= #TCQ 'd0;
    else if (num_samples_done_r)
      rd_victim_sel    <= #TCQ 'd0;
    else if (samples_cnt_r == NUM_SAMPLES_CNT) begin
      if (rd_victim_sel < 'd7)
        rd_victim_sel    <= #TCQ rd_victim_sel + 1;
    end