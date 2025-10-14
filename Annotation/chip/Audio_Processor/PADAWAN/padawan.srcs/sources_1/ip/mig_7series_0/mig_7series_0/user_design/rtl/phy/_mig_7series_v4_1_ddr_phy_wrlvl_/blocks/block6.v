   always @(posedge clk)begin
     if (rst | flag_ck_negedge | flag_init | (wl_tap_count_r < 'd1) |
         inhibit_edge_detect_r)
       rd_data_edge_detect_r     <= #TCQ {DQS_WIDTH{1'b0}};
     else if (rd_data_edge_detect_r[dqs_count_r] == 1'b1) begin
       if ((wl_state_r == WL_FINE_DEC) || (wl_state_r == WL_FINE_DEC_WAIT) || (wl_state_r == WL_FINE_DEC_WAIT1) ||
           (wl_state_r == WL_CORSE_INC) || (wl_state_r == WL_CORSE_INC_WAIT) || (wl_state_r == WL_CORSE_INC_WAIT_TMP) ||
           (wl_state_r == WL_CORSE_INC_WAIT1) || (wl_state_r == WL_CORSE_INC_WAIT2))
         rd_data_edge_detect_r <= #TCQ {DQS_WIDTH{1'b0}};
       else
         rd_data_edge_detect_r <= #TCQ rd_data_edge_detect_r;
     end else if (rd_data_previous_r[dqs_count_r] && (stable_cnt < 'd14))
       rd_data_edge_detect_r     <= #TCQ {DQS_WIDTH{1'b0}};
     else
       rd_data_edge_detect_r <= #TCQ (~rd_data_previous_r & rd_data_rise_wl_r);
   end