   always @(posedge clk)begin
     if ((wl_state_r == WL_INIT) || 
         
		 ((wl_state_r1 == WL_INIT_FINE_INC_WAIT) & (wl_state_r == WL_INIT_FINE_INC)) ||
         (wl_state_r == WL_FINE_DEC) || (wl_state_r == WL_FINE_DEC_WAIT1) || (wl_state_r == WL_FINE_DEC_WAIT) ||
         (wl_state_r == WL_CORSE_INC) || (wl_state_r == WL_CORSE_INC_WAIT) || (wl_state_r == WL_CORSE_INC_WAIT_TMP) || 
         (wl_state_r == WL_CORSE_INC_WAIT1) || (wl_state_r == WL_CORSE_INC_WAIT2) ||
         ((wl_state_r == WL_EDGE_CHECK) & (wl_edge_detect_valid_r)))
       rd_data_previous_r         <= #TCQ rd_data_rise_wl_r;
   end