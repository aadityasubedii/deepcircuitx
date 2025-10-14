   always @(posedge clk)begin
      if (rst | (wl_state_r == WL_DQS_CNT) |
         (wl_state_r == WL_DQS_CHECK) | wr_level_done_r |
         (wl_state_r1 == WL_INIT_FINE_DEC))
        flag_ck_negedge <= #TCQ 1'd0;
      else if ((rd_data_previous_r[dqs_count_r] && ((stable_cnt > 'd0) |
              (wl_state_r == WL_FINE_DEC) | (wl_state_r == WL_FINE_DEC_WAIT) | (wl_state_r == WL_FINE_DEC_WAIT1))) |
			  (wl_state_r == WL_CORSE_INC)) 
        flag_ck_negedge <= #TCQ 1'd1;
      else if (~rd_data_previous_r[dqs_count_r] && (stable_cnt == 'd14))
               
        flag_ck_negedge <= #TCQ 1'd0;
   end