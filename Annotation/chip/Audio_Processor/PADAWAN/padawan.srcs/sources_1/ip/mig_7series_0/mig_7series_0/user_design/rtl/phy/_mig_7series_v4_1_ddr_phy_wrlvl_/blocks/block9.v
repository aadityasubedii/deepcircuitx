   always @(posedge clk)begin
      if (rst | (wl_state_r == WL_DQS_CNT) |
         (wl_state_r == WL_2RANK_TAP_DEC) |
         (wl_state_r == WL_FINE_DEC) |
         (rd_data_previous_r[dqs_count_r] != rd_data_rise_wl_r[dqs_count_r]) |
         (wl_state_r1 == WL_INIT_FINE_DEC))
        stable_cnt <= #TCQ 'd0;
      else if ((wl_tap_count_r > 6'd0) & 
         (((wl_state_r == WL_EDGE_CHECK) & (wl_edge_detect_valid_r)) |
         ((wl_state_r1 == WL_INIT_FINE_INC_WAIT) & (wl_state_r == WL_INIT_FINE_INC)))) begin
        if ((rd_data_previous_r[dqs_count_r] == rd_data_rise_wl_r[dqs_count_r])
           & (stable_cnt < 'd14))
          stable_cnt <= #TCQ stable_cnt + 1;
      end
   end