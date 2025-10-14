          prbs_tap_en_r  <= #TCQ 1'b0;
          prbs_tap_inc_r <= #TCQ 1'b0;
          if (cnt_wait_state) begin
            if (prbs_dec_tap_cnt > 'd0)
              prbs_state_r <= #TCQ PRBS_DEC_DQS;
            else begin 
              
              complex_pi_incdec_done <= #TCQ 1'b1;
              prbs_state_r <= #TCQ PRBS_PAT_COMPARE;
            end
          end
        end