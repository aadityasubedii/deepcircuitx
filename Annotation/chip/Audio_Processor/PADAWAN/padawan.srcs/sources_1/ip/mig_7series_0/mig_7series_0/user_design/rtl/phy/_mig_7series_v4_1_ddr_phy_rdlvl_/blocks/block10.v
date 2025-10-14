  always @(posedge clk)
    if (rst || (SIM_CAL_OPTION == "SKIP_CAL")) begin 
      for (s = 0; s < RANKS; s = s + 1) begin
        for (t = 0; t < DQS_WIDTH; t = t + 1) begin
          idelay_tap_cnt_r[s][t] <= #TCQ idelaye2_init_val;
        end
      end
    end else if (SIM_CAL_OPTION == "FAST_CAL") begin
      for (u = 0; u < RANKS; u = u + 1) begin
        for (w = 0; w < DQS_WIDTH; w = w + 1) begin
          if (cal1_dq_idel_ce) begin
            if (cal1_dq_idel_inc)
              idelay_tap_cnt_r[u][w] <= #TCQ idelay_tap_cnt_r[u][w] + 1;
            else
              idelay_tap_cnt_r[u][w] <= #TCQ idelay_tap_cnt_r[u][w] - 1;
          end
        end
      end
    end else if ((rnk_cnt_r == RANKS-1) && (RANKS == 2) &&
                    rdlvl_rank_done_r && (cal1_state_r == CAL1_IDLE)) begin
      for (f = 0; f < DQS_WIDTH; f = f + 1) begin
        idelay_tap_cnt_r[rnk_cnt_r][f] <= #TCQ idelay_tap_cnt_r[(rnk_cnt_r-1)][f];
      end
    end else if (cal1_dq_idel_ce) begin
      if (cal1_dq_idel_inc)
        idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing] <= #TCQ idelay_tap_cnt_slice_r + 5'h1;
      else
        idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing] <= #TCQ idelay_tap_cnt_slice_r - 5'h1;
    end else if (idelay_ld)
      idelay_tap_cnt_r[0][wrcal_cnt] <= #TCQ 5'b00000;
