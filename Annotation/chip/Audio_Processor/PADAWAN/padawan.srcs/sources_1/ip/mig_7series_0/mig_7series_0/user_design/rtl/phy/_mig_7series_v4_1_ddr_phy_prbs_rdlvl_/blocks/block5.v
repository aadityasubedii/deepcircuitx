        FINE_PAT_COMPARE_PER_BIT: begin
          
          complex_init_pi_dec_done_r <= #TCQ 1'b1;
          complex_pi_incdec_done <= #TCQ 1'b0;
          if(num_samples_done_r) begin  
            
            match_flag_and <= #TCQ {match_flag_and[MIN_WIN-2:0],compare_err_pb_and};
            match_flag_or  <= #TCQ {match_flag_or[MIN_WIN-2:0],compare_err_pb_or};

            
            if({match_flag_or[MIN_WIN-2:0],compare_err_pb_or} == MIN_PASS) begin  
              no_err_win_detected <= #TCQ 1'b1;
              valid_window_cnt    <= #TCQ valid_window_cnt + 'd1;
            end else begin
              no_err_win_detected <= #TCQ 1'b0;
            end
            
            
            
            if((match_flag_and == MIN_PASS && compare_err_pb_and && (prbs_dqs_tap_cnt_r > MIN_WIN )) || prbs_dqs_tap_limit_r || (&right_edge_found_pb)) begin 
              prbs_state_r <= #TCQ FINE_CALC_TAPS; 
              
              
              if(!right_edge_found) smallest_right_edge <= #TCQ prbs_dqs_tap_cnt_r-1;                
            end else begin
              prbs_state_r <= #TCQ RD_DONE_WAIT_FOR_PI_INC_INC;  
            end
            num_samples_done_ind <= num_samples_done_r;
          end 
        end