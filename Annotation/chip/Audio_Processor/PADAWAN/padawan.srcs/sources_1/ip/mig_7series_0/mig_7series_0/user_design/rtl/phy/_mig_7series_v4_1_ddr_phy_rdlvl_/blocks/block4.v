   always @(posedge clk) begin
     if (rst) begin
       for (a = 0; a < RANKS; a = a + 1) begin: rst_rdlvl_dqs_tap_count_loop
         for (b = 0; b < DQS_WIDTH; b = b + 1)
           rdlvl_dqs_tap_cnt_r[a][b] <= #TCQ 'b0;
       end
     end else if ((SIM_CAL_OPTION == "FAST_CAL") & (cal1_state_r1 == CAL1_NEXT_DQS)) begin
       for (p = 0; p < RANKS; p = p +1) begin: rdlvl_dqs_tap_rank_cnt
         for(q = 0; q < DQS_WIDTH; q = q +1) begin: rdlvl_dqs_tap_cnt
           rdlvl_dqs_tap_cnt_r[p][q] <= #TCQ tap_cnt_cpt_r;
         end
       end
     end else if (SIM_CAL_OPTION == "SKIP_CAL") begin
       for (j = 0; j < RANKS; j = j +1) begin: rdlvl_dqs_tap_rnk_cnt
         for(i = 0; i < DQS_WIDTH; i = i +1) begin: rdlvl_dqs_cnt
           rdlvl_dqs_tap_cnt_r[j][i] <= #TCQ 6'd31;
         end
       end
     end else if (cal1_state_r1 == CAL1_NEXT_DQS) begin
       rdlvl_dqs_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing_r] <= #TCQ tap_cnt_cpt_r;
     end
   end