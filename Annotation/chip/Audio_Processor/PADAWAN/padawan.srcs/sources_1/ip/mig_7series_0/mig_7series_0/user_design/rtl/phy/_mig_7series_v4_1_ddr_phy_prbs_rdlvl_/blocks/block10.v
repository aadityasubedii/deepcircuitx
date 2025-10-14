        PRBS_NEXT_DQS: begin
          
          complex_init_pi_dec_done_r <= #TCQ 1'b0;
          reset_rd_addr <= #TCQ 'b1;  
          prbs_prech_req_r  <= #TCQ 1'b1;
          prbs_tap_en_r  <= #TCQ 1'b0;
          prbs_tap_inc_r <= #TCQ 1'b0;
          
          prbs_found_1st_edge_r <= #TCQ 1'b0;
          prbs_found_2nd_edge_r <= #TCQ 1'b0;
          prbs_1st_edge_taps_r  <= #TCQ 'd0;
          prbs_2nd_edge_taps_r  <= #TCQ 'd0;
          largest_left_edge       <= #TCQ 6'b000000;
          smallest_right_edge     <= #TCQ 6'b111111;
          if (prbs_dqs_cnt_r >= DQS_WIDTH-1) begin
            prbs_last_byte_done <= #TCQ 1'b1;
          end
           
          
          
          if (prech_done) begin
            prbs_prech_req_r <= #TCQ 1'b0;
            if (prbs_dqs_cnt_r >= DQS_WIDTH-1) begin
              
              prbs_state_r <= #TCQ PRBS_DONE;
            end else begin
              
              new_cnt_dqs_r  <= #TCQ 1'b1;
              prbs_dqs_cnt_r <= #TCQ prbs_dqs_cnt_r + 1;
              prbs_state_r   <= #TCQ PRBS_NEW_DQS_PREWAIT;
            end
          end
        end
        
        PRBS_NEW_DQS_PREWAIT: begin
          if (cnt_wait_state) begin
            prbs_state_r <= #TCQ PRBS_NEW_DQS_WAIT;
            fine_pi_dec_cnt <= #TCQ pi_counter_read_val;
          end
        end