   always @(posedge clk) begin
     
     if (rst || ~cmd_delay_start ||((delaydec_cnt_r == 6'd0) && (delay_cnt_r == 6'd0) && (ctl_lane_cnt != N_CTL_LANES-1)))
       delaydec_cnt_r  <= #TCQ TAP_DEC;
     else if (po_cnt_dec && (delaydec_cnt_r > 6'd0))
       delaydec_cnt_r  <= #TCQ delaydec_cnt_r - 1;
   end