  always @(posedge clk)
    if (rst)
      samples_cnt_r <= #TCQ 'b0;
    else if (samples_cnt_r == NUM_SAMPLES_CNT) begin
      samples_cnt_r <= #TCQ 'b0;
    end else if (complex_sample_cnt_inc) begin
      samples_cnt_r <= #TCQ samples_cnt_r + 1;
      












    end