    always @ (posedge clk) begin
      if (rst || tempmon_done_skip || (samp_en_cnt == 'd0))
        samp_en_cnt <= #TCQ 'd267;
      else if (calib_complete && (samp_en_cnt > 'd0))
        samp_en_cnt <= #TCQ samp_en_cnt - 1;
    end