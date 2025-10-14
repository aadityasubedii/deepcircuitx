  always @(posedge clk) begin

    device_temp_sync_r1 <= #TCQ device_temp_lcl;
    device_temp_sync_r2 <= #TCQ device_temp_sync_r1;
    device_temp_sync_r3 <= #TCQ device_temp_sync_r2;
    device_temp_sync_r4 <= #TCQ device_temp_sync_r3;
    device_temp_sync_r5 <= #TCQ device_temp_sync_r4;

    device_temp_sync_r4_neq_r3 <= #TCQ (device_temp_sync_r4 != device_temp_sync_r3) ? 1'b1 : 1'b0;

  end