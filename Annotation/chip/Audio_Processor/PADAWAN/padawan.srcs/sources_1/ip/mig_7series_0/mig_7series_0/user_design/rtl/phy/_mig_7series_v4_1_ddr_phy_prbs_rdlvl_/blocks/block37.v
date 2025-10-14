  always @(posedge clk)
    prbs_dqs_cnt_timing_r <= #TCQ prbs_dqs_cnt_timing;
    