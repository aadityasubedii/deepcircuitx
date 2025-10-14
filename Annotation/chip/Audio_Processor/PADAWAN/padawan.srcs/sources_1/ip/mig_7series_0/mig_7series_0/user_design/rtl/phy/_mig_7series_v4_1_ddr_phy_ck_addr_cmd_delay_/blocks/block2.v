   always @(posedge clk) begin
     if (rst || ~cmd_delay_start)  begin
       delay_dec_done    <= #TCQ 1'b0;
     end else if (((TAP_CNT == 0) && (TAP_DEC == 0)) ||
                 ((delaydec_cnt_r == 6'd0) && (delay_cnt_r == 'd0) && (ctl_lane_cnt == N_CTL_LANES-1))) begin
       delay_dec_done    <= #TCQ 1'b1;
     end
   end