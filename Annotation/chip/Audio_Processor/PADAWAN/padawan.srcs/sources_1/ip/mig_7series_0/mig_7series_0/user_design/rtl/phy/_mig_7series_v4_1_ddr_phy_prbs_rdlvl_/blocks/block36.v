   always @(posedge clk) begin
     if (rst) begin
       prbs_final_dqs_tap_cnt_r <= #TCQ 'b0;
     end else if ((prbs_state_r == PRBS_NEXT_DQS) && (prbs_state_r1 != PRBS_NEXT_DQS)) begin
        prbs_final_dqs_tap_cnt_r[(prbs_dqs_cnt_timing_r*6)+:6]
           <= #TCQ prbs_dqs_tap_cnt_r;
     end
   end