  always @(posedge clk)
    if (rst)
      oclkdelay_calib_start_int <= #TCQ 1'b0;
    else if (oclkdelay_start_dly_r[5])
      oclkdelay_calib_start_int <= #TCQ 1'b1;
  