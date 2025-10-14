  always @(posedge clk) begin
    if (SKIP_CALIB == "FALSE")
    init_calib_complete <= calib_complete;
    else
      init_calib_complete <= tempmon_done_skip;
  end