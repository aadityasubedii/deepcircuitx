    always @(posedge clk) begin
      calib_tap_req     <= #TCQ 1'b0;
      calib_device_temp <= #TCQ 'd0;
      skip_cal_tempmon_samp_en <= #TCQ 1'b0;
    end