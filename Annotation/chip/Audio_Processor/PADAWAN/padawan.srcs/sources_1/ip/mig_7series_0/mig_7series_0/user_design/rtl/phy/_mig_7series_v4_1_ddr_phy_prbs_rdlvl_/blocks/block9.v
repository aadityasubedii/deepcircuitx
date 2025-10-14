        PRBS_CALC_TAPS_PRE:
        begin
          
          complex_pi_incdec_done <= #TCQ 1'b0;
          prbs_state_r <= #TCQ fine_calib? PRBS_NEXT_DQS:PRBS_CALC_TAPS_WAIT;
          if(center_comp && ~fine_calib) begin
            if(prbs_found_1st_edge_r) largest_left_edge <= #TCQ prbs_1st_edge_taps_r;
            else largest_left_edge <= #TCQ 6'd0;
            if(prbs_found_2nd_edge_r) smallest_right_edge <= #TCQ prbs_2nd_edge_taps_r;
            else smallest_right_edge <= #TCQ 6'd63;
          end
        end