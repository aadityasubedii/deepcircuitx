  always @(posedge wrcal_done) begin
    if (!rst && (WRLVL == "ON"))
      $display ("PHY_INIT: Write Calibration completed at %t", $time);
  end    