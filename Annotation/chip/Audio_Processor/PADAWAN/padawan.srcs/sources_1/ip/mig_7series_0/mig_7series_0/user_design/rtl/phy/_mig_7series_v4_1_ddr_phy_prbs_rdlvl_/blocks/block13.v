          end
        end
        
        
        
        
        PRBS_NEW_DQS_WAIT: begin
          reset_rd_addr <= #TCQ 'b0;
          prbs_last_byte_done <= #TCQ 1'b0;
          prbs_prech_req_r    <= #TCQ 1'b0;
          stage_cnt           <= #TCQ 2'b0;
          match_flag_and        <= #TCQ MATCH_ALL_ONE;
          match_flag_or         <= #TCQ MATCH_ALL_ONE;
          no_err_win_detected   <= #TCQ 1'b0;
          no_err_win_detected_latch   <= #TCQ 1'b0;
          if (cnt_wait_state) begin
            new_cnt_dqs_r <= #TCQ 1'b0;
            prbs_state_r  <= #TCQ fine_calib? FINE_PI_DEC:PRBS_PAT_COMPARE;
            
            complex_pi_incdec_done <= #TCQ fine_calib? complex_pi_incdec_done: 1'b1;
          end
        end

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        PRBS_PAT_COMPARE: begin
          
          
          
          
          complex_pi_incdec_done <= #TCQ 1'b0;  
          if (num_samples_done_r) begin
            if (prbs_dqs_tap_limit_r)
              
              
              
              
              
              
              
              
              prbs_state_r <= #TCQ PRBS_CALC_TAPS_PRE;
            else if (compare_err_latch || (prbs_dqs_tap_cnt_r == 'd0)) begin 
              
              
              
              prbs_found_1st_edge_r <= #TCQ 1'b1;
              
              
              
              
              
              
              
              
              if (prbs_found_1st_edge_r) begin
                prbs_found_2nd_edge_r <= #TCQ 1'b1;
                prbs_2nd_edge_taps_r  <= #TCQ prbs_dqs_tap_cnt_r - 1;
                prbs_state_r          <= #TCQ PRBS_CALC_TAPS_PRE;
              end else begin
                
                
                
                
                if (compare_err_latch)
                  prbs_1st_edge_taps_r <= #TCQ prbs_dqs_tap_cnt_r + 1;
                else
                  prbs_1st_edge_taps_r <= #TCQ 'd0;
                
                prbs_inc_tap_cnt     <= #TCQ rdlvl_cpt_tap_cnt - prbs_dqs_tap_cnt_r;           
                prbs_state_r         <= #TCQ RD_DONE_WAIT_FOR_PI_INC_INC;
              end
            end else begin
              
              
              if (prbs_found_1st_edge_r)
                
                prbs_state_r  <= #TCQ RD_DONE_WAIT_FOR_PI_INC_INC;
              else
                
                prbs_state_r  <= #TCQ RD_DONE_WAIT_FOR_PI_INC_DEC;
            end
          end 
        end