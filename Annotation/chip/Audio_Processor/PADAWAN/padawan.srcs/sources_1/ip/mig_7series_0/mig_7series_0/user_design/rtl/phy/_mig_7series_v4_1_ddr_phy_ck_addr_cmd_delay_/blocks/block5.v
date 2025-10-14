   always @(posedge clk) begin
     
     if (rst || (tCK >= 2500) || (SIM_CAL_OPTION == "FAST_CAL"))
       delay_cnt_r  <= #TCQ 'd0;
     else if ((delaydec_cnt_r > 6'd0) ||((delay_cnt_r == 6'd0) && (ctl_lane_cnt != N_CTL_LANES-1)))
       delay_cnt_r  <= #TCQ 'd1;
     else if (po_cnt_inc && (delay_cnt_r > 6'd0))
       delay_cnt_r  <= #TCQ delay_cnt_r - 1;
   end