  always @(posedge clk)
    if (rst)
      complex_victim_inc <= #TCQ 1'b0;
    else if (samples_cnt_r == NUM_SAMPLES_CNT)
      complex_victim_inc <= #TCQ 1'b1;
    else
      complex_victim_inc <= #TCQ 1'b0;