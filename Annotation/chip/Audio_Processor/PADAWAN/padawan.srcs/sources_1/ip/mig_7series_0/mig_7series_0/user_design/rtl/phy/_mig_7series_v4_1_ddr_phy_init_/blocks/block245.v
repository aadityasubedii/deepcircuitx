  always @(posedge pi_dqs_found_done) begin
    if (!rst) 
      $display ("PHY_INIT: Phaser_In DQSFOUND completed at %t", $time);
  end