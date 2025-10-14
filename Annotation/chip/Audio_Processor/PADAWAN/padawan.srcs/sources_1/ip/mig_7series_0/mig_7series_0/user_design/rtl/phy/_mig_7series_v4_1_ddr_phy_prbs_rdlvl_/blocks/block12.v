          prbs_state_r        <= #TCQ PRBS_INC_DQS_WAIT;
          if (prbs_inc_tap_cnt > 'd0)
            prbs_inc_tap_cnt <= #TCQ prbs_inc_tap_cnt - 1;
          if (~prbs_dqs_tap_limit_r) begin
            prbs_tap_en_r    <= #TCQ 1'b1;
            prbs_tap_inc_r   <= #TCQ 1'b1;
          end
        end

        
        
        PRBS_INC_DQS_WAIT: begin
          prbs_tap_en_r    <= #TCQ 1'b0;
          prbs_tap_inc_r   <= #TCQ 1'b0; 
          if (cnt_wait_state) begin
            if (prbs_inc_tap_cnt > 'd0)
              prbs_state_r <= #TCQ PRBS_INC_DQS;  
            else begin
              prbs_state_r <= #TCQ PRBS_PAT_COMPARE;
              complex_pi_incdec_done <= #TCQ 1'b1;
            end
          end
        end
          
        
        
        
        
        
        
        
        PRBS_CALC_TAPS: begin
          if (center_comp) begin
            prbs_dec_tap_cnt <= #TCQ (dec_cnt[5] & dec_cnt[0])? 'd32: dec_cnt + pi_adj;
            fine_dly_error <= #TCQ (dec_cnt[5] & dec_cnt[0])? 1'b1: fine_dly_error; 
            prbs_state_r <= #TCQ RD_DONE_WAIT_FOR_PI_INC_DEC;
          end else begin  
            if (prbs_found_2nd_edge_r && prbs_found_1st_edge_r) begin
            
              prbs_dec_tap_cnt 
                <=  #TCQ ((prbs_2nd_edge_taps_r -
                         prbs_1st_edge_taps_r)>>1) + 1 + pi_adj;  
              edge_det_error <= #TCQ edge_det_error? 1'b1: 
                                (prbs_1st_edge_taps_r >= prbs_2nd_edge_taps_r);
            end else if (~prbs_found_2nd_edge_r && prbs_found_1st_edge_r) begin
            
              prbs_dec_tap_cnt 
                <=  #TCQ ((prbs_dqs_tap_cnt_r - prbs_1st_edge_taps_r)>>1) + pi_adj;  
            end else begin
            
              edge_det_error <= #TCQ 1'b1;
              prbs_dec_tap_cnt 
                <=  #TCQ (prbs_dqs_tap_cnt_r>>1) + pi_adj;  
            end
            
            
            
            prbs_state_r <= #TCQ RD_DONE_WAIT_FOR_PI_INC_DEC;
          end
        end
        
        
        
        
        
        
        PRBS_DEC_DQS: begin
          prbs_tap_en_r  <= #TCQ 1'b1;
          prbs_tap_inc_r <= #TCQ 1'b0;
          
          
          if (prbs_dec_tap_cnt > 'd0)
            prbs_dec_tap_cnt <= #TCQ prbs_dec_tap_cnt - 1;
          if (prbs_dec_tap_cnt == 6'b000001) begin
            prbs_state_r <= #TCQ PRBS_NEXT_DQS;
            
            complex_pi_incdec_done <= #TCQ 1'b1;   
          end else
            prbs_state_r <= #TCQ PRBS_DEC_DQS_WAIT;
        end
