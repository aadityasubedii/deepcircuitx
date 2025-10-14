  always @(posedge clk)
    if(&sync_cntr)
      device_temp_r <= #TCQ device_temp_sync_r5;
