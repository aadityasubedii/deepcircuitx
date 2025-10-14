   always @(posedge clk) begin
     if (rst) begin
       for (k = 0; k < RANKS; k = k + 1) begin: rst_wl_dqs_tap_count_loop
         for (n = 0; n < DQS_WIDTH; n = n + 1) begin
           wl_corse_cnt[k][n]       <= #TCQ 'b0;
           wl_dqs_tap_count_r[k][n] <= #TCQ 'b0;
         end
       end
     end else if ((wl_state_r == WL_DQS_CNT) | (wl_state_r == WL_WAIT) | 
                  (wl_state_r == WL_FINE_DEC_WAIT1) |
                  (wl_state_r == WL_2RANK_TAP_DEC)) begin
         wl_dqs_tap_count_r[rank_cnt_r][dqs_count_r] <= #TCQ wl_tap_count_r;
         wl_corse_cnt[rank_cnt_r][dqs_count_r]       <= #TCQ corse_cnt[dqs_count_r];
     end else if ((SIM_CAL_OPTION == "FAST_CAL") & (wl_state_r == WL_DQS_CHECK)) begin
       for (p = 0; p < RANKS; p = p +1) begin: dqs_tap_rank_cnt   
         for(q = 0; q < DQS_WIDTH; q = q +1) begin: dqs_tap_dqs_cnt
           wl_dqs_tap_count_r[p][q] <= #TCQ wl_tap_count_r;
           wl_corse_cnt[p][q]       <= #TCQ corse_cnt[0];
         end
       end
     end
   end