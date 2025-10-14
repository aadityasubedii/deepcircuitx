   always @(posedge clk) begin
      if(rst)begin
         wrlvl_err              <= #TCQ 1'b0;
         wr_level_done_r        <= #TCQ 1'b0;
         wrlvl_rank_done_r      <= #TCQ 1'b0;
         dqs_count_r            <= #TCQ {DQS_CNT_WIDTH+1{1'b0}};
         dq_cnt_inc             <= #TCQ 1'b1;
         rank_cnt_r             <= #TCQ 2'b00;
         wl_state_r             <= #TCQ WL_IDLE;
         wl_state_r1            <= #TCQ WL_IDLE;
         inhibit_edge_detect_r  <= #TCQ 1'b1;
         wl_edge_detect_valid_r <= #TCQ 1'b0;
         wl_tap_count_r         <= #TCQ 6'd0;
         fine_dec_cnt           <= #TCQ 6'd0;
         for (r = 0; r < DQS_WIDTH; r = r + 1) begin
           fine_inc[r]          <= #TCQ 6'b0;
           corse_dec[r]         <= #TCQ 3'b0;
           corse_inc[r]         <= #TCQ 3'b0;
           corse_cnt[r]         <= #TCQ 3'b0;
         end
         dual_rnk_dec           <= #TCQ 1'b0;
         fast_cal_fine_cnt      <= #TCQ FAST_CAL_FINE;
         fast_cal_coarse_cnt    <= #TCQ FAST_CAL_COARSE;
         final_corse_dec        <= #TCQ 1'b0;
         
         wrlvl_redo_corse_inc   <= #TCQ 'd0;
      end else begin
         wl_state_r1            <= #TCQ wl_state_r;
         case (wl_state_r)
           
           WL_IDLE: begin
              wrlvl_rank_done_r      <= #TCQ 1'd0;
              inhibit_edge_detect_r  <= #TCQ 1'b1;
              if (wrlvl_byte_redo && ~wrlvl_byte_redo_r) begin
                wr_level_done_r      <= #TCQ 1'b0;
                dqs_count_r          <= #TCQ wrcal_cnt;
                corse_cnt[wrcal_cnt] <= #TCQ final_coarse_tap[wrcal_cnt];
                wl_tap_count_r       <= #TCQ smallest[wrcal_cnt];
                if (early1_data && 
                    (((final_coarse_tap[wrcal_cnt] < 'd6) && (CLK_PERIOD/nCK_PER_CLK <= 2500)) ||
                    ((final_coarse_tap[wrcal_cnt] < 'd3) && (CLK_PERIOD/nCK_PER_CLK > 2500))))
                  wrlvl_redo_corse_inc <= #TCQ REDO_COARSE;
                else if (early2_data && (final_coarse_tap[wrcal_cnt] < 'd2))
                  wrlvl_redo_corse_inc <= #TCQ 3'd6;
                else begin
                  wl_state_r   <= #TCQ WL_IDLE;
                  wrlvl_err    <= #TCQ 1'b1;
                end
              end else if (wrlvl_final && ~wrlvl_final_r) begin
                wr_level_done_r <= #TCQ 1'b0;
                dqs_count_r     <= #TCQ 'd0;
              end
							
              if(!wr_level_done_r & wr_level_start_r & wl_sm_start) begin
                if (SIM_CAL_OPTION == "FAST_CAL")
                  wl_state_r <= #TCQ WL_FINE_INC;
                else
                  wl_state_r <= #TCQ WL_INIT;
              end
           end
           
           WL_INIT: begin
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              inhibit_edge_detect_r  <= #TCQ 1'b1;
              wrlvl_rank_done_r      <= #TCQ 1'd0;
              
              if (wrlvl_final)
                corse_cnt[dqs_count_w ]  <= #TCQ final_coarse_tap[dqs_count_w ]; 
              if (wrlvl_byte_redo) begin
                if (|wl_tap_count_r) begin
                  wl_state_r   <= #TCQ WL_FINE_DEC;
                  fine_dec_cnt <= #TCQ wl_tap_count_r;
                end else if ((corse_cnt[dqs_count_w] + wrlvl_redo_corse_inc) <= 'd7)
                  wl_state_r   <= #TCQ WL_CORSE_INC;
                else begin
                  wl_state_r   <= #TCQ WL_IDLE;
                  wrlvl_err    <= #TCQ 1'b1;
                end
              end else if(wl_sm_start)
                wl_state_r <= #TCQ WL_INIT_FINE_INC;
           end
           
           
           
           
           
           
           
           WL_INIT_FINE_INC: begin
              wl_state_r   <= #TCQ WL_INIT_FINE_INC_WAIT1;
              wl_tap_count_r <= #TCQ wl_tap_count_r + 1'b1;
              final_corse_dec <= #TCQ 1'b0;
           end

           WL_INIT_FINE_INC_WAIT1: begin
              if (wl_sm_start)
                wl_state_r <= #TCQ WL_INIT_FINE_INC_WAIT;
           end

           
           
           
           
           
           
           
           WL_INIT_FINE_INC_WAIT: begin
              if (wl_sm_start) begin
                if (stable_cnt < 'd14)
                  wl_state_r   <= #TCQ WL_INIT_FINE_INC;
                else if (~rd_data_previous_r[dqs_count_r]) begin
                  wl_state_r             <= #TCQ WL_WAIT;
                  inhibit_edge_detect_r  <= #TCQ 1'b0;
                end else begin
                  wl_state_r   <= #TCQ WL_INIT_FINE_DEC;
                  fine_dec_cnt <= #TCQ wl_tap_count_r;
                end
              end
           end

           
           
           
           
           
           WL_INIT_FINE_DEC: begin
              wl_tap_count_r <= #TCQ 'd0;
              wl_state_r   <= #TCQ WL_INIT_FINE_DEC_WAIT1;
              if (fine_dec_cnt > 6'd0)
                fine_dec_cnt <= #TCQ fine_dec_cnt - 1;
              else
                fine_dec_cnt <= #TCQ fine_dec_cnt;
           end
           
           WL_INIT_FINE_DEC_WAIT1: begin
             if (incdec_wait_cnt == 'd8)
               wl_state_r   <= #TCQ WL_INIT_FINE_DEC_WAIT;
           end
           
           WL_INIT_FINE_DEC_WAIT: begin
              if (fine_dec_cnt > 6'd0) begin
                wl_state_r             <= #TCQ WL_INIT_FINE_DEC;
                inhibit_edge_detect_r  <= #TCQ 1'b1;
              end else begin
                wl_state_r             <= #TCQ WL_WAIT;
                inhibit_edge_detect_r  <= #TCQ 1'b0;
              end
           end
           
           
           WL_FINE_INC: begin
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              if (SIM_CAL_OPTION == "FAST_CAL") begin
                wl_state_r <= #TCQ WL_FINE_INC_WAIT;
                if (fast_cal_fine_cnt > 'd0)
                  fast_cal_fine_cnt <= #TCQ fast_cal_fine_cnt - 1;
                else
                  fast_cal_fine_cnt <= #TCQ fast_cal_fine_cnt;
              end else if (wr_level_done_r5) begin
                wl_tap_count_r <= #TCQ 'd0;
                wl_state_r <= #TCQ WL_FINE_INC_WAIT;
                if (|fine_inc[dqs_count_w])
                      fine_inc[dqs_count_w] <= #TCQ fine_inc[dqs_count_w] - 1;
              end else begin
                wl_state_r <= #TCQ WL_WAIT;
                wl_tap_count_r <= #TCQ wl_tap_count_r + 1'b1;
              end
           end
           
           WL_FINE_INC_WAIT: begin
              if (SIM_CAL_OPTION == "FAST_CAL") begin
                if (fast_cal_fine_cnt > 'd0)
                  wl_state_r <= #TCQ WL_FINE_INC;
                else if (fast_cal_coarse_cnt > 'd0)
                  wl_state_r <= #TCQ WL_CORSE_INC;
                else
                  wl_state_r <= #TCQ WL_DQS_CNT;
              end else if (|fine_inc[dqs_count_w])
                wl_state_r   <= #TCQ WL_FINE_INC;
              else if (dqs_count_r == (DQS_WIDTH-1))
                wl_state_r   <= #TCQ WL_IDLE;
              else begin
                wl_state_r   <= #TCQ WL_2RANK_FINAL_TAP;
                dqs_count_r  <= #TCQ dqs_count_r + 1;
              end
           end
           
           WL_FINE_DEC: begin
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              wl_tap_count_r <= #TCQ 'd0;
              wl_state_r   <= #TCQ WL_FINE_DEC_WAIT1;
              if (fine_dec_cnt > 6'd0)
                fine_dec_cnt <= #TCQ fine_dec_cnt - 1;
              else
                fine_dec_cnt <= #TCQ fine_dec_cnt;
           end
           
           WL_FINE_DEC_WAIT1: begin
             if (incdec_wait_cnt == 'd8)
               wl_state_r   <= #TCQ WL_FINE_DEC_WAIT;
           end
           
           WL_FINE_DEC_WAIT: begin
              if (fine_dec_cnt > 6'd0)
                wl_state_r   <= #TCQ WL_FINE_DEC;
              
              
              else if (dual_rnk_dec) begin 
                if (|corse_dec[dqs_count_r])
                  wl_state_r <= #TCQ WL_CORSE_DEC;
                else
                  wl_state_r <= #TCQ WL_2RANK_DQS_CNT;
              end else if (wrlvl_byte_redo) begin
                if ((corse_cnt[dqs_count_w] + wrlvl_redo_corse_inc) <= 'd7)
                  wl_state_r <= #TCQ WL_CORSE_INC;
                else begin
                  wl_state_r <= #TCQ WL_IDLE;
                  wrlvl_err  <= #TCQ 1'b1;
                end
              end else
                wl_state_r <= #TCQ WL_CORSE_INC;
           end
           
           WL_CORSE_DEC: begin
              wl_state_r   <= #TCQ WL_CORSE_DEC_WAIT;
              dual_rnk_dec <= #TCQ 1'b0;
              if (|corse_dec[dqs_count_r])
                corse_dec[dqs_count_r] <= #TCQ corse_dec[dqs_count_r] - 1;
              else
                corse_dec[dqs_count_r]  <= #TCQ corse_dec[dqs_count_r];
           end
           
           WL_CORSE_DEC_WAIT: begin
              if (wl_sm_start) begin
              
              
              if (|corse_dec[dqs_count_r])
                wl_state_r <= #TCQ WL_CORSE_DEC_WAIT1;
                else
                wl_state_r <= #TCQ WL_2RANK_DQS_CNT;
              end
           end
           
           WL_CORSE_DEC_WAIT1: begin
              if (wl_sm_start)
                wl_state_r <= #TCQ WL_CORSE_DEC;
           end
           
           WL_CORSE_INC: begin
              wl_state_r <= #TCQ WL_CORSE_INC_WAIT_TMP;
              if (SIM_CAL_OPTION == "FAST_CAL") begin
                if (fast_cal_coarse_cnt > 'd0)
                  fast_cal_coarse_cnt <= #TCQ fast_cal_coarse_cnt - 1;
                else
                  fast_cal_coarse_cnt <= #TCQ fast_cal_coarse_cnt;
              end else if (wrlvl_byte_redo) begin
                corse_cnt[dqs_count_w] <= #TCQ corse_cnt[dqs_count_w] + 1;
                if (|wrlvl_redo_corse_inc)                             
                  wrlvl_redo_corse_inc <= #TCQ wrlvl_redo_corse_inc - 1;
              end else if (~wr_level_done_r5)
                corse_cnt[dqs_count_r] <= #TCQ corse_cnt[dqs_count_r] + 1;
              else if (|corse_inc[dqs_count_w])                             
                corse_inc[dqs_count_w] <= #TCQ corse_inc[dqs_count_w] - 1;
           end

           WL_CORSE_INC_WAIT_TMP: begin
             if (incdec_wait_cnt == 'd8)
             wl_state_r <= #TCQ WL_CORSE_INC_WAIT;
           end
           
           WL_CORSE_INC_WAIT: begin
              if (SIM_CAL_OPTION == "FAST_CAL") begin
                if (fast_cal_coarse_cnt > 'd0)
                  wl_state_r   <= #TCQ WL_CORSE_INC;
                else
                  wl_state_r <= #TCQ WL_DQS_CNT;
              end else if (wrlvl_byte_redo) begin
                if (|wrlvl_redo_corse_inc)
                  wl_state_r   <= #TCQ WL_CORSE_INC;
                else begin
                  wl_state_r            <= #TCQ WL_INIT_FINE_INC;
                  inhibit_edge_detect_r <= #TCQ 1'b1;
                end
              end else if (~wr_level_done_r5 && wl_sm_start)
                wl_state_r <= #TCQ WL_CORSE_INC_WAIT1;
              else if (wr_level_done_r5) begin
                if (|corse_inc[dqs_count_r])
                  wl_state_r   <= #TCQ WL_CORSE_INC;
                else if (|fine_inc[dqs_count_w]) 
                  wl_state_r   <= #TCQ WL_FINE_INC;
                else if (dqs_count_r == (DQS_WIDTH-1))
                  wl_state_r   <= #TCQ WL_IDLE;
                else begin
                  wl_state_r   <= #TCQ WL_2RANK_FINAL_TAP;
                  dqs_count_r  <= #TCQ dqs_count_r + 1;
                end
              end
           end
           
           WL_CORSE_INC_WAIT1: begin
              if (wl_sm_start)
                wl_state_r <= #TCQ WL_CORSE_INC_WAIT2;
           end

           WL_CORSE_INC_WAIT2: begin
             if (wl_sm_start)
                wl_state_r <= #TCQ WL_WAIT;
           end
           
           WL_WAIT: begin
              if (wl_sm_start)
              wl_state_r <= #TCQ WL_EDGE_CHECK;
           end
           
           WL_EDGE_CHECK: begin 
              if (wl_edge_detect_valid_r == 1'b0) begin
                wl_state_r <= #TCQ WL_WAIT;
                wl_edge_detect_valid_r <= #TCQ 1'b1;
              end
              
              else if(rd_data_edge_detect_r[dqs_count_r] &&
                      wl_edge_detect_valid_r)
                begin
                  wl_tap_count_r <= #TCQ wl_tap_count_r;
                  if ((SIM_CAL_OPTION == "FAST_CAL") || (RANKS < 2) ||
                      ~oclkdelay_calib_done)
                    wl_state_r <= #TCQ WL_DQS_CNT;
                  else
                    wl_state_r <= #TCQ WL_2RANK_TAP_DEC;
                end
              
              
              else if((~wrlvl_tap_done_r) && (wl_tap_count_r > 6'd55)) begin
                if (corse_cnt[dqs_count_r] < COARSE_TAPS) begin
                  wl_state_r   <= #TCQ WL_FINE_DEC;
                  fine_dec_cnt <= #TCQ wl_tap_count_r;
                end  else begin
                  wrlvl_err <= #TCQ 1'b1;
                  wl_state_r   <= #TCQ WL_IDLE;
                end
	      end else begin
	          if (wl_tap_count_r < 6'd56)  
                    wl_state_r <= #TCQ WL_FINE_INC;
	          else if (corse_cnt[dqs_count_r] < COARSE_TAPS) begin
                    wl_state_r   <= #TCQ WL_FINE_DEC;
                    fine_dec_cnt <= #TCQ wl_tap_count_r;
                  end else begin
                   wrlvl_err <= #TCQ 1'b1;
                   wl_state_r   <= #TCQ WL_IDLE;
                  end
	      end
           end

           WL_2RANK_TAP_DEC: begin
              wl_state_r    <= #TCQ WL_FINE_DEC;
              fine_dec_cnt  <= #TCQ wl_tap_count_r;
              for (m = 0; m < DQS_WIDTH; m = m + 1)
                corse_dec[m] <= #TCQ corse_cnt[m];
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              dual_rnk_dec <= #TCQ 1'b1;
           end
           
           WL_DQS_CNT: begin
              if ((SIM_CAL_OPTION == "FAST_CAL") ||
                  (dqs_count_r == (DQS_WIDTH-1)) ||
                  wrlvl_byte_redo) begin
                dqs_count_r <= #TCQ dqs_count_r;
                dq_cnt_inc  <= #TCQ 1'b0;
              end else begin
                dqs_count_r <= #TCQ dqs_count_r + 1'b1;
                dq_cnt_inc  <= #TCQ 1'b1;
              end
              wl_state_r <= #TCQ WL_DQS_CHECK;
              wl_edge_detect_valid_r <= #TCQ 1'b0;
           end
           
           WL_2RANK_DQS_CNT: begin
              if ((SIM_CAL_OPTION == "FAST_CAL") ||
                 (dqs_count_r == (DQS_WIDTH-1))) begin
                dqs_count_r <= #TCQ dqs_count_r;
                dq_cnt_inc  <= #TCQ 1'b0;
              end else begin
                dqs_count_r <= #TCQ dqs_count_r + 1'b1;
                dq_cnt_inc  <= #TCQ 1'b1;
              end
              wl_state_r <= #TCQ WL_DQS_CHECK;
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              dual_rnk_dec <= #TCQ 1'b0;
           end   
           
           WL_DQS_CHECK: begin 
              wl_tap_count_r <= #TCQ 'd0;
              if (dq_cnt_inc == 1'b0)begin
                wrlvl_rank_done_r <= #TCQ 1'd1;
                for (t = 0; t < DQS_WIDTH; t = t + 1)
                  corse_cnt[t] <= #TCQ 3'b0;
                if ((SIM_CAL_OPTION == "FAST_CAL") || (RANKS < 2) || ~oclkdelay_calib_done) begin
                  wl_state_r  <= #TCQ WL_IDLE;
                  if (wrlvl_byte_redo)
                    dqs_count_r <= #TCQ dqs_count_r;
                  else 
                  dqs_count_r <= #TCQ 'd0;
                end else if (rank_cnt_r == RANKS-1) begin
                  dqs_count_r <= #TCQ dqs_count_r;
                  if (RANKS > 1)
                    wl_state_r  <= #TCQ WL_2RANK_FINAL_TAP;
                  else
                    wl_state_r  <= #TCQ WL_IDLE;
                end else begin
                  wl_state_r  <= #TCQ WL_INIT;
                  dqs_count_r <= #TCQ 'd0;
                end
                if ((SIM_CAL_OPTION == "FAST_CAL") ||
                    (rank_cnt_r == RANKS-1)) begin
                  wr_level_done_r <= #TCQ 1'd1;
                  rank_cnt_r      <= #TCQ 2'b00;
                end else begin
                  wr_level_done_r <= #TCQ 1'd0;
                  rank_cnt_r      <= #TCQ rank_cnt_r + 1'b1;
                end
              end else
                wl_state_r  <= #TCQ WL_INIT;
           end
           
           WL_2RANK_FINAL_TAP: begin
              if (wr_level_done_r4 && ~wr_level_done_r5) begin
                for(u = 0; u < DQS_WIDTH; u = u + 1) begin
                  corse_inc[u] <= #TCQ final_coarse_tap[u];
                  fine_inc[u]  <= #TCQ final_val[u];
                end
                dqs_count_r    <= #TCQ 'd0;
              end else if (wr_level_done_r5) begin
                if (|corse_inc[dqs_count_r])
                  wl_state_r   <= #TCQ WL_CORSE_INC;
                else if (|fine_inc[dqs_count_w])
                  wl_state_r   <= #TCQ WL_FINE_INC;
              end  
           end
        endcase
     end
   end 