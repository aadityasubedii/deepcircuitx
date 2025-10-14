   always @(posedge clk) begin
      cmd_delay_start_r1     <= #TCQ cmd_delay_start;
      cmd_delay_start_r2     <= #TCQ cmd_delay_start_r1;
      cmd_delay_start_r3     <= #TCQ cmd_delay_start_r2;
      cmd_delay_start_r4     <= #TCQ cmd_delay_start_r3;
      cmd_delay_start_r5     <= #TCQ cmd_delay_start_r4;
      cmd_delay_start_r6     <= #TCQ cmd_delay_start_r5;
      pi_fine_dly_dec_done_r <= #TCQ pi_fine_dly_dec_done;
    end