      always @(posedge clk) begin
        if (pb_detect_edge_setup) begin
          
          
          pb_cnt_eye_size_r[z]     <= #TCQ 5'd0;
          pb_detect_edge_done_r[z] <= #TCQ 1'b0;
          pb_found_stable_eye_r[z] <= #TCQ 1'b0;
          pb_last_tap_jitter_r[z]  <= #TCQ 1'b0;
          pb_found_edge_last_r[z]  <= #TCQ 1'b0;
          pb_found_edge_r[z]       <= #TCQ 1'b0;
          pb_found_first_edge_r[z] <= #TCQ 1'b0;
        end else if (pb_detect_edge) begin
          
          
          
          pb_found_edge_last_r[z] <= #TCQ pb_found_edge_r[z];

          if (!pb_detect_edge_done_r[z]) begin
            if (samp_cnt_done_r) begin
              
              
              
              
              
              
              pb_last_tap_jitter_r[z]  <= #TCQ 1'b0;
              pb_detect_edge_done_r[z] <= #TCQ 1'b1;
              if (!pb_found_edge_r[z] && !pb_last_tap_jitter_r[z]) begin
                
                
                
                if (pb_cnt_eye_size_r[z] != MIN_EYE_SIZE-1)
                  pb_cnt_eye_size_r[z] <= #TCQ pb_cnt_eye_size_r[z] + 1;
                else 
                  
                  pb_found_stable_eye_r[z] <= #TCQ 1'b1;
              end else begin
                
                
                
                
                
                pb_cnt_eye_size_r[z]     <= #TCQ 5'd0;
                pb_found_stable_eye_r[z] <= #TCQ 1'b0;
                pb_found_edge_r[z]       <= #TCQ 1'b1;
                pb_detect_edge_done_r[z] <= #TCQ 1'b1;
              end
            end else if (prev_sr_diff_r[z]) begin
              
              
              
              pb_cnt_eye_size_r[z]     <= #TCQ 5'd0;
              pb_found_stable_eye_r[z] <= #TCQ 1'b0;
              pb_last_tap_jitter_r[z]  <= #TCQ 1'b1;
              pb_found_edge_r[z]       <= #TCQ 1'b1;
              pb_found_first_edge_r[z] <= #TCQ 1'b1;
              pb_detect_edge_done_r[z] <= #TCQ 1'b1;
            end else if (old_sr_diff_r[z] || pb_last_tap_jitter_r[z]) begin
              
              
              
              
              
              
              
              
              pb_cnt_eye_size_r[z]     <= #TCQ 5'd0;
              pb_found_stable_eye_r[z] <= #TCQ 1'b0;
              pb_found_edge_r[z]       <= #TCQ 1'b1;
              pb_found_first_edge_r[z] <= #TCQ 1'b1;
            end
          end
        end else begin
          
          pb_found_edge_r[z]       <= #TCQ 1'b0;
          pb_detect_edge_done_r[z] <= #TCQ 1'b0;
        end
      end