  always @(posedge mem_init_done_r) begin 
    if (!rst)
      $display ("PHY_INIT: Memory Initialization completed at %t", $time);
  end
