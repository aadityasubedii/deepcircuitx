  always @(posedge clk) begin
    if(rst) begin
      tempmon_state           <= #TCQ 11'b000_0000_0001;
      pi_f_inc                <= #TCQ 1'b0;
      pi_f_dec                <= #TCQ 1'b0;
      four_inc_max_limit      <= #TCQ 12'b0;
      three_inc_max_limit     <= #TCQ 12'b0;
      two_inc_max_limit       <= #TCQ 12'b0;
      one_inc_max_limit       <= #TCQ 12'b0;
      neutral_max_limit       <= #TCQ 12'b0;
      one_dec_max_limit       <= #TCQ 12'b0;
      two_dec_max_limit       <= #TCQ 12'b0;
      three_dec_max_limit     <= #TCQ 12'b0;
      three_inc_min_limit     <= #TCQ 12'b0;
      two_inc_min_limit       <= #TCQ 12'b0;
      one_inc_min_limit       <= #TCQ 12'b0;
      neutral_min_limit       <= #TCQ 12'b0;
      one_dec_min_limit       <= #TCQ 12'b0;
      two_dec_min_limit       <= #TCQ 12'b0;
      three_dec_min_limit     <= #TCQ 12'b0;
      four_dec_min_limit      <= #TCQ 12'b0;
      device_temp_init        <= #TCQ 12'b0;
      tempmon_init_complete   <= #TCQ 1'b0;
      tempmon_sample_en_101   <= #TCQ 1'b0;
      tempmon_sample_en_102   <= #TCQ 1'b0;
      device_temp_101         <= #TCQ 12'b0;
      device_temp_capture_102 <= #TCQ 12'b0;
    end
    else begin
      tempmon_state           <= #TCQ tempmon_state_nxt;
      pi_f_inc                <= #TCQ pi_f_inc_nxt;
      pi_f_dec                <= #TCQ pi_f_dec_nxt;
      four_inc_max_limit      <= #TCQ four_inc_max_limit_nxt;
      three_inc_max_limit     <= #TCQ three_inc_max_limit_nxt;
      two_inc_max_limit       <= #TCQ two_inc_max_limit_nxt;
      one_inc_max_limit       <= #TCQ one_inc_max_limit_nxt;
      neutral_max_limit       <= #TCQ neutral_max_limit_nxt;
      one_dec_max_limit       <= #TCQ one_dec_max_limit_nxt;
      two_dec_max_limit       <= #TCQ two_dec_max_limit_nxt;
      three_dec_max_limit     <= #TCQ three_dec_max_limit_nxt;
      three_inc_min_limit     <= #TCQ three_inc_min_limit_nxt;
      two_inc_min_limit       <= #TCQ two_inc_min_limit_nxt;
      one_inc_min_limit       <= #TCQ one_inc_min_limit_nxt;
      neutral_min_limit       <= #TCQ neutral_min_limit_nxt;
      one_dec_min_limit       <= #TCQ one_dec_min_limit_nxt;
      two_dec_min_limit       <= #TCQ two_dec_min_limit_nxt;
      three_dec_min_limit     <= #TCQ three_dec_min_limit_nxt;
      four_dec_min_limit      <= #TCQ four_dec_min_limit_nxt;
      device_temp_init        <= #TCQ device_temp_init_nxt;
      tempmon_init_complete   <= #TCQ tempmon_init_complete_nxt;
      tempmon_sample_en_101   <= #TCQ tempmon_sample_en;
      tempmon_sample_en_102   <= #TCQ tempmon_sample_en_101;
      device_temp_101         <= #TCQ device_temp_100;
      device_temp_capture_102 <= #TCQ device_temp_capture_101;
    end
  end