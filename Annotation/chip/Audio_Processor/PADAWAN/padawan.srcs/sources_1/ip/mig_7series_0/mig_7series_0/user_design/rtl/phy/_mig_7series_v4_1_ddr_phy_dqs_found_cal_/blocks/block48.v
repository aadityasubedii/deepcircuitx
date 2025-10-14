   always @(posedge clk) begin
      if(rst)begin
        fine_adjust        <= #TCQ 1'b0;
        ctl_lane_cnt       <= #TCQ 'd0;
        fine_adj_state_r   <= #TCQ FINE_ADJ_IDLE;
        fine_adjust_done_r <= #TCQ 1'b0;
        ck_po_stg2_f_indec <= #TCQ 1'b0;
        ck_po_stg2_f_en    <= #TCQ 1'b0;
        rst_dqs_find       <= #TCQ 1'b0;
        init_dec_cnt       <= #TCQ 'd31;
        dec_cnt            <= #TCQ 'd0;
        inc_cnt            <= #TCQ 'd0;
        init_dec_done      <= #TCQ 1'b0;
        final_dec_done     <= #TCQ 1'b0;
        first_fail_detect  <= #TCQ 1'b0;
        second_fail_detect <= #TCQ 1'b0;
        first_fail_taps    <= #TCQ 'd0;
        second_fail_taps   <= #TCQ 'd0;
        stable_pass_cnt    <= #TCQ 'd0;
        dqs_found_prech_req<= #TCQ 1'b0;
      end else begin
        case (fine_adj_state_r)
           
           FINE_ADJ_IDLE: begin
             if (init_dqsfound_done_r5) begin
               if (SIM_CAL_OPTION == "FAST_CAL") begin
                 fine_adjust      <= #TCQ 1'b1;
                 fine_adj_state_r <= #TCQ FINE_ADJ_DONE;
                 rst_dqs_find     <= #TCQ 1'b0;
               end else begin
                 fine_adjust      <= #TCQ 1'b1;
                 fine_adj_state_r <= #TCQ RST_WAIT;
                 rst_dqs_find     <= #TCQ 1'b1;
               end
             end
           end
           
           RST_WAIT: begin
             if (~(|pi_dqs_found_any_bank) && rst_dqs_find_r2) begin
               rst_dqs_find     <= #TCQ 1'b0;
               if (|init_dec_cnt)
                 fine_adj_state_r <= #TCQ FINE_DEC_PREWAIT;
               else if (final_dec_done)
                 fine_adj_state_r <= #TCQ FINE_ADJ_DONE;
               else
                 fine_adj_state_r <= #TCQ RST_POSTWAIT;
             end
           end
           
           RST_POSTWAIT: begin
             fine_adj_state_r <= #TCQ RST_POSTWAIT1;
           end
           
           RST_POSTWAIT1: begin
             fine_adj_state_r <= #TCQ FINE_ADJ_INIT;
           end
           
           FINE_ADJ_INIT: begin
             
               fine_adj_state_r <= #TCQ FINE_INC;
           end
           
           FINE_INC: begin
             fine_adj_state_r   <= #TCQ FINE_INC_WAIT;
             ck_po_stg2_f_indec <= #TCQ 1'b1;
             ck_po_stg2_f_en    <= #TCQ 1'b1;
             if (ctl_lane_cnt == N_CTL_LANES-1)
               inc_cnt          <= #TCQ inc_cnt + 1;
           end
           
           FINE_INC_WAIT: begin
             ck_po_stg2_f_indec <= #TCQ 1'b0;
             ck_po_stg2_f_en    <= #TCQ 1'b0;
             if (ctl_lane_cnt != N_CTL_LANES-1) begin
               ctl_lane_cnt     <= #TCQ ctl_lane_cnt + 1;
               fine_adj_state_r <= #TCQ FINE_INC_PREWAIT;
             end else if (ctl_lane_cnt == N_CTL_LANES-1) begin
               ctl_lane_cnt     <= #TCQ 'd0;
               fine_adj_state_r <= #TCQ DETECT_PREWAIT;
             end
           end
           
           FINE_INC_PREWAIT: begin
             fine_adj_state_r <= #TCQ FINE_INC;
           end
           
           DETECT_PREWAIT: begin
             if (detect_pi_found_dqs && (detect_rd_cnt == 'd1))
               fine_adj_state_r <= #TCQ DETECT_DQSFOUND;
			 else
			   fine_adj_state_r <= #TCQ DETECT_PREWAIT;
           end
           
           DETECT_DQSFOUND: begin
             if (detect_pi_found_dqs && ~(&pi_dqs_found_all_bank)) begin
               stable_pass_cnt     <= #TCQ 'd0;
               if (~first_fail_detect && (inc_cnt == 'd63)) begin
                 
                 
                 first_fail_detect <= #TCQ 1'b1;
                 first_fail_taps   <= #TCQ inc_cnt;
                 fine_adj_state_r  <= #TCQ FINE_DEC;
                 dec_cnt           <= #TCQ 'd32;
               end else if (~first_fail_detect && (inc_cnt > 'd30) && (stable_pass_cnt > 'd29)) begin
                 
                 
                 first_fail_detect <= #TCQ 1'b1;
                 first_fail_taps   <= #TCQ inc_cnt;
                 fine_adj_state_r  <= #TCQ FINE_DEC;
                 dec_cnt           <= #TCQ (inc_cnt>>1) + 1;				 
			   end else if (~first_fail_detect || (first_fail_detect && (stable_pass_cnt < 'd30) && (inc_cnt <= 'd32))) begin
                 
                 
                 first_fail_detect <= #TCQ 1'b1;
                 first_fail_taps   <= #TCQ inc_cnt;
                 rst_dqs_find      <= #TCQ 1'b1;
                 if ((inc_cnt == 'd12) || (inc_cnt == 'd24)) begin
                   dqs_found_prech_req <= #TCQ 1'b1;
                   fine_adj_state_r    <= #TCQ PRECH_WAIT;
                 end else
                 fine_adj_state_r  <= #TCQ RST_WAIT;
               end else if (first_fail_detect && (inc_cnt > 'd32) && (inc_cnt < 'd63) && (stable_pass_cnt < 'd30)) begin
                 
                 
                 first_fail_detect <= #TCQ 1'b1;
                 first_fail_taps   <= #TCQ inc_cnt;
                 rst_dqs_find      <= #TCQ 1'b1;
                 if ((inc_cnt == 'd36) || (inc_cnt == 'd48) || (inc_cnt == 'd60)) begin
                   dqs_found_prech_req <= #TCQ 1'b1;
                   fine_adj_state_r    <= #TCQ PRECH_WAIT;
                 end else
                   fine_adj_state_r  <= #TCQ RST_WAIT;
               end else if (first_fail_detect && (inc_cnt == 'd63)) begin
                 if (stable_pass_cnt < 'd30) begin
                   
                   
                   first_fail_detect <= #TCQ 1'b1;
                   first_fail_taps   <= #TCQ inc_cnt;
                   fine_adj_state_r  <= #TCQ FINE_DEC;
                   dec_cnt           <= #TCQ 'd32;
                 end else begin
                   
                   
                   fine_adj_state_r  <= #TCQ FINE_DEC;
                   dec_cnt           <= #TCQ ((inc_cnt - first_fail_taps)>>1);
                 end
               end else begin
                 
                 
                 second_fail_detect <= #TCQ 1'b1;
                 second_fail_taps   <= #TCQ inc_cnt;
                 dec_cnt            <= #TCQ ((inc_cnt - first_fail_taps)>>1);
                 fine_adj_state_r   <= #TCQ FINE_DEC;
               end
             end else if (detect_pi_found_dqs && (&pi_dqs_found_all_bank)) begin
               stable_pass_cnt    <= #TCQ stable_pass_cnt + 1;
               if ((inc_cnt == 'd12) || (inc_cnt == 'd24) || (inc_cnt == 'd36) || 
                   (inc_cnt == 'd48) || (inc_cnt == 'd60)) begin
                 dqs_found_prech_req <= #TCQ 1'b1;
                 fine_adj_state_r    <= #TCQ PRECH_WAIT;
               end else if (inc_cnt < 'd63) begin
                 rst_dqs_find     <= #TCQ 1'b1;
                 fine_adj_state_r <= #TCQ RST_WAIT;
               end else begin
                 fine_adj_state_r <= #TCQ FINE_DEC;
                 if (~first_fail_detect || (first_fail_taps > 'd33))
                   
                   dec_cnt <= #TCQ 'd32;
                 
                 
                 
                 
                 else
                   
                   
                   dec_cnt <= #TCQ ((inc_cnt - first_fail_taps)>>1);
               end
             end
           end
           
           PRECH_WAIT: begin
             if (prech_done) begin
               dqs_found_prech_req <= #TCQ 1'b0;
               rst_dqs_find        <= #TCQ 1'b1;
               fine_adj_state_r    <= #TCQ RST_WAIT;
             end
           end
               
               
           FINE_DEC: begin
             fine_adj_state_r   <= #TCQ FINE_DEC_WAIT;
             ck_po_stg2_f_indec <= #TCQ 1'b0;
             ck_po_stg2_f_en    <= #TCQ 1'b1;
             if ((ctl_lane_cnt == N_CTL_LANES-1) && (init_dec_cnt > 'd0))
               init_dec_cnt     <= #TCQ init_dec_cnt - 1;
             else if ((ctl_lane_cnt == N_CTL_LANES-1) && (dec_cnt > 'd0))
               dec_cnt          <= #TCQ dec_cnt - 1;
           end
           
           FINE_DEC_WAIT: begin
             ck_po_stg2_f_indec <= #TCQ 1'b0;
             ck_po_stg2_f_en    <= #TCQ 1'b0;
             if (ctl_lane_cnt != N_CTL_LANES-1) begin
               ctl_lane_cnt     <= #TCQ ctl_lane_cnt + 1;
               fine_adj_state_r <= #TCQ FINE_DEC_PREWAIT;
             end else if (ctl_lane_cnt == N_CTL_LANES-1) begin
               ctl_lane_cnt     <= #TCQ 'd0;
               if ((dec_cnt > 'd0) || (init_dec_cnt > 'd0))
                 fine_adj_state_r <= #TCQ FINE_DEC_PREWAIT;
               else begin
                 fine_adj_state_r <= #TCQ FINAL_WAIT;
                 if ((init_dec_cnt == 'd0) && ~init_dec_done)
                   init_dec_done <= #TCQ 1'b1;
                 else
                   final_dec_done   <= #TCQ 1'b1;
               end
             end
           end
           
           FINE_DEC_PREWAIT: begin
             fine_adj_state_r <= #TCQ FINE_DEC;
           end
           
           FINAL_WAIT: begin
             rst_dqs_find     <= #TCQ 1'b1;
             fine_adj_state_r <= #TCQ RST_WAIT;
           end
           
           FINE_ADJ_DONE: begin
             if (&pi_dqs_found_all_bank) begin
               fine_adjust_done_r <= #TCQ 1'b1;
               rst_dqs_find       <= #TCQ 1'b0;
               fine_adj_state_r   <= #TCQ FINE_ADJ_DONE;
             end
           end
           
        endcase
      end
   end