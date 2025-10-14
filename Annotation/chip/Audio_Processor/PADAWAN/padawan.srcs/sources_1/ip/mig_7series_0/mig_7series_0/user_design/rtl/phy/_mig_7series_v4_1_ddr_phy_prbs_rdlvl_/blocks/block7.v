        FINE_PI_DEC: begin
          fine_delay_sel <= #TCQ 'b0; 
          if(fine_pi_dec_cnt > 0) begin
            prbs_tap_en_r  <= #TCQ 1'b1;
            prbs_tap_inc_r <= #TCQ 1'b0;
            fine_pi_dec_cnt <= #TCQ fine_pi_dec_cnt - 'd1;
          end
          prbs_state_r <= #TCQ FINE_PI_DEC_WAIT;
        end
        
        
        
        
        FINE_PI_DEC_WAIT: begin
          prbs_tap_en_r  <= #TCQ 1'b0;
          prbs_tap_inc_r <= #TCQ 1'b0;
          if(cnt_wait_state) begin
            if(fine_pi_dec_cnt >0)
              prbs_state_r <= #TCQ FINE_PI_DEC;
            else begin 
              complex_pi_incdec_done <= #TCQ 1'b1;
              if(fine_inc_stage)
                prbs_state_r <= #TCQ FINE_PAT_COMPARE_PER_BIT;   
              else 
                prbs_state_r <= #TCQ PRBS_CALC_TAPS_PRE;  
            end
          end
        end
           
        