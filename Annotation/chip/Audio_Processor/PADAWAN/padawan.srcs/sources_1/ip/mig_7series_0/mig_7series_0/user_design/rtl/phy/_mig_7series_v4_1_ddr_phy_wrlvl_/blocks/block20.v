   always @(posedge clk) begin
     if (rst) begin
       for(x = 0; x < DQS_WIDTH; x = x +1) begin
         smallest[x] <= #TCQ 'b0;
         largest[x]  <= #TCQ 'b0;
       end
     end else if ((wl_state_r == WL_DQS_CNT) & wrlvl_byte_redo) begin
       smallest[dqs_count_r] <= #TCQ wl_dqs_tap_count_r[0][dqs_count_r];
       largest[dqs_count_r]  <= #TCQ wl_dqs_tap_count_r[0][dqs_count_r];
     end else if ((wl_state_r == WL_DQS_CNT) | 
                  (wl_state_r == WL_2RANK_TAP_DEC)) begin
       smallest[dqs_count_r] <= #TCQ wl_dqs_tap_count_r[0][dqs_count_r];
       largest[dqs_count_r]  <= #TCQ wl_dqs_tap_count_r[RANKS-1][dqs_count_r];
     end else if (((SIM_CAL_OPTION == "FAST_CAL") | 
                   (~oclkdelay_calib_done & ~wrlvl_byte_redo)) & 
                  wr_level_done_r1 & ~wr_level_done_r2) begin
       for(i = 0; i < DQS_WIDTH; i = i +1) begin: smallest_dqs
         smallest[i] <= #TCQ wl_dqs_tap_count_r[0][i];
         largest[i]  <= #TCQ wl_dqs_tap_count_r[0][i];
       end
     end
   end