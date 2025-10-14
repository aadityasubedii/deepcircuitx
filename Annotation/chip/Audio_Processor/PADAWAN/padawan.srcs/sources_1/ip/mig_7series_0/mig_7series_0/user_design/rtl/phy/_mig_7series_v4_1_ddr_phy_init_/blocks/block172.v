  always @(posedge clk) begin
    if (rst || ~temp_wrcal_done)
      temp_lmr_done <= #TCQ 1'b0;
    else if (temp_wrcal_done && (init_state_r == INIT_LOAD_MR))
      temp_lmr_done <= #TCQ 1'b1;
  end