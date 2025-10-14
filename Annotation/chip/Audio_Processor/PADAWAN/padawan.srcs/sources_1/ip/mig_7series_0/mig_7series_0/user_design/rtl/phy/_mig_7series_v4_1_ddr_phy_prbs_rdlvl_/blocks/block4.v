        FINE_CALC_TAPS: begin
          if(num_samples_done_ind || num_samples_done_r) begin
            num_samples_done_ind <= #TCQ 'b0; 
            right_edge_found <= #TCQ 1'b0;  
            match_flag_and <= #TCQ MATCH_ALL_ONE;   
            match_flag_or  <= #TCQ MATCH_ALL_ONE;   
            no_err_win_detected <= #TCQ 1'b0;
            no_err_win_detected_latch <= #TCQ 1'b0;
            prbs_state_r <= #TCQ FINE_CALC_TAPS_WAIT;
            valid_window_cnt <= #TCQ 2'd0;          
          end
        end

        FINE_CALC_TAPS_WAIT: begin  
          if(stage_cnt == 'd2) begin  
            if(center_comp) begin
              fine_pi_dec_cnt <= #TCQ (dec_cnt[5]&dec_cnt[0])? 'd32: prbs_dqs_tap_cnt_r - smallest_right_edge + dec_cnt - 1 + pi_adj ;  
              fine_dly_error <= #TCQ (dec_cnt[5]&dec_cnt[0]) ? 1'b1: fine_dly_error;
            end else begin
              fine_pi_dec_cnt <= #TCQ prbs_dqs_tap_cnt_r - center_calc[6:1] - center_calc[0] + pi_adj;  
              fine_dly_error <= #TCQ 1'b0;
            end
          end else begin
            fine_pi_dec_cnt <= #TCQ prbs_dqs_tap_cnt_r; 
          end
          if (bit_cnt == DRAM_WIDTH) begin
            fine_delay_sel <= #TCQ 'b1;
            stage_cnt <= #TCQ stage_cnt + 1;
            prbs_state_r <= #TCQ RD_DONE_WAIT_FOR_PI_INC_DEC;
          end

        end