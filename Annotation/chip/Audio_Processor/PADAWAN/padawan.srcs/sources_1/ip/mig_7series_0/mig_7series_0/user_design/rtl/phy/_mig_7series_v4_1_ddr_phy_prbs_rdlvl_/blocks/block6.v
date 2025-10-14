        RD_DONE_WAIT_FOR_PI_INC_INC: begin
          if(complex_act_start)
            prbs_state_r <= #TCQ fine_calib? FINE_PI_INC: PRBS_INC_DQS;
        end
          
        FINE_PI_INC: begin
          
          if(|left_edge_updated && ~no_err_win_detected_latch) largest_left_edge <= #TCQ prbs_dqs_tap_cnt_r- (MIN_WIN-1); 
          
          if (no_err_win_detected) begin
          
            right_edge_found <= #TCQ 'b0; 
          end else if(|right_edge_found_pb && ~right_edge_found) begin
            smallest_right_edge <= #TCQ prbs_dqs_tap_cnt_r -1 ;
            right_edge_found <= #TCQ 'b1;
          end 
          
          
          if(no_err_win_detected) no_err_win_detected_latch <= #TCQ 1'b1;
          prbs_state_r <= #TCQ FINE_PI_INC_WAIT;
          if(~prbs_dqs_tap_limit_r) begin
            prbs_tap_en_r    <= #TCQ 1'b1;
            prbs_tap_inc_r   <= #TCQ 1'b1;
          end
        end
       
        
        
        FINE_PI_INC_WAIT: begin
          prbs_tap_en_r    <= #TCQ 1'b0;
          prbs_tap_inc_r   <= #TCQ 1'b0; 
          if (cnt_wait_state) begin
              prbs_state_r <= #TCQ FINE_PAT_COMPARE_PER_BIT;