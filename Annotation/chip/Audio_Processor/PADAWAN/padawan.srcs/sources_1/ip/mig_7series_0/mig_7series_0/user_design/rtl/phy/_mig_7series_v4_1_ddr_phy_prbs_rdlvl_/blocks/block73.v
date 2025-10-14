    always @(posedge clk)
      if (rst) begin
        dbg_prbs_first_edge_taps  <= #TCQ 'b0;
        dbg_prbs_second_edge_taps <= #TCQ 'b0;
      end else if (prbs_state_r == PRBS_CALC_TAPS) begin
        
        
        
          if (prbs_found_1st_edge_r)
            dbg_prbs_first_edge_taps[(prbs_dqs_cnt_timing_r*6)+:6]  
              <= #TCQ prbs_1st_edge_taps_r;
          if (prbs_found_2nd_edge_r)
            dbg_prbs_second_edge_taps[(prbs_dqs_cnt_timing_r*6)+:6] 
              <= #TCQ prbs_2nd_edge_taps_r;
      end else if (prbs_state_r == FINE_CALC_TAPS) begin
        if(stage_cnt == 'd2) begin
            dbg_prbs_first_edge_taps[(prbs_dqs_cnt_timing_r*6)+:6]  
              <= #TCQ largest_left_edge;
            dbg_prbs_second_edge_taps[(prbs_dqs_cnt_timing_r*6)+:6] 
            <= #TCQ smallest_right_edge; 
        end
      end