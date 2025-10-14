  always @(posedge oclkdelay_calib_done) begin
    if (!rst) 
      $display ("PHY_INIT: OCLKDELAY calibration completed at %t", $time);
  end