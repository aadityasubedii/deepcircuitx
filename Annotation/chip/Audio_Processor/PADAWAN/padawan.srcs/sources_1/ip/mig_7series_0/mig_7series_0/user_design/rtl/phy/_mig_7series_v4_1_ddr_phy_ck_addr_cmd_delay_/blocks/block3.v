   always @(posedge clk) begin
     if (rst || ~cmd_delay_start )
       ctl_lane_cnt <= #TCQ 6'b0;
     else if (~delay_dec_done && (ctl_lane_cnt == N_CTL_LANES-1) && (delaydec_cnt_r == 6'd1))
       ctl_lane_cnt <= #TCQ ctl_lane_cnt;
     else if ((ctl_lane_cnt != N_CTL_LANES-1) && (delaydec_cnt_r == 6'd0) && (delay_cnt_r == 'd0))
       ctl_lane_cnt <= #TCQ ctl_lane_cnt + 1;
   end