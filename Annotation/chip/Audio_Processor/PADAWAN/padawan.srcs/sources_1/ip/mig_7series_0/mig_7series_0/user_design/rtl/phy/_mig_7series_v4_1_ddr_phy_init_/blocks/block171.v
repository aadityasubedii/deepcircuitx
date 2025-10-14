  always @(posedge clk)
    temp_wrcal_done_r <= #TCQ temp_wrcal_done;
    