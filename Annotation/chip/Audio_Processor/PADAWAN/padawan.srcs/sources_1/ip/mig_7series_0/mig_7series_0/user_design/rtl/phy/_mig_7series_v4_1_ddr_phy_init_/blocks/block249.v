  always @(posedge rdlvl_stg1_done) begin
    if (!rst) 
      $display ("PHY_INIT: Read Leveling Stage 1 completed at %t", $time);
  end