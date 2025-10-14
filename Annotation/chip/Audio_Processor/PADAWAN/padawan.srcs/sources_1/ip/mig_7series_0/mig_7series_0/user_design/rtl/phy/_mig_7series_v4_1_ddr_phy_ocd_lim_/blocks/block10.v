  always @(posedge clk) begin
    if (rst)
      oclkdelay_calib_done_r <= #TCQ 1'b0;
    else
      oclkdelay_calib_done_r <= #TCQ oclkdelay_calib_done;
  end