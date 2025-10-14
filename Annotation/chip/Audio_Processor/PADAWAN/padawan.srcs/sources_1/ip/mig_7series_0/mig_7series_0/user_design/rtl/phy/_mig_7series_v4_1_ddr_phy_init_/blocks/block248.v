  always @(posedge mpr_rdlvl_done) begin
    if (!rst) 
      $display ("PHY_INIT: MPR Read Leveling completed at %t", $time);
  end
  