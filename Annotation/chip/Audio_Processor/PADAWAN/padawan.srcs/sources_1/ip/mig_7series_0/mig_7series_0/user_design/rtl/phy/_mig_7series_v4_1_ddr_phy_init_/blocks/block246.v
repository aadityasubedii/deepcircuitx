  always @(posedge pi_calib_done_r1) begin
    if (!rst) 
      $display ("PHY_INIT: Phaser_In Phase Locked at %t", $time);
  end