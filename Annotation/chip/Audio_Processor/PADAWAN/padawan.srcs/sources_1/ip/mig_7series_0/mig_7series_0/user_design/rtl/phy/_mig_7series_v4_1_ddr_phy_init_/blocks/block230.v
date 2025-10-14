  always @ (posedge clk)
    if (rst) 
      complex_oclkdelay_calib_done_r1 <= #TCQ 1'b0;
    else
      complex_oclkdelay_calib_done_r1 <= #TCQ complex_oclkdelay_calib_done;
