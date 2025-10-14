    always @ (posedge clk) begin
      if (rst || tempmon_done_skip)
        skip_cal_tempmon_samp_en <= #TCQ 1'b0;
      else if (samp_en_cnt == 'd260)
        skip_cal_tempmon_samp_en <= #TCQ 1'b1;
      else
        skip_cal_tempmon_samp_en <= #TCQ 1'b0;
    end