  always @(posedge wrlvl_done) begin
    if (!rst && (WRLVL == "ON"))
      $display ("PHY_INIT: Write Leveling completed at %t", $time);
  end