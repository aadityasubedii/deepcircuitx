  always @(posedge clk)
    if(rst || (device_temp_sync_r4_neq_r3))
      sync_cntr <= #TCQ 4'b0000;
    else if(~&sync_cntr)
      sync_cntr <= #TCQ sync_cntr + 4'b0001;
