      always @(posedge clk) begin
        if (rst) begin
          for (s = 0; s < RANKS; s = s + 1) begin: three_bank2_rst_loop
            rd_byte_data_offset[s][12+:6] <= #TCQ nCL + nAL + LATENCY_FACTOR;
          end
        end else if ((rank_done_r1 && ~init_dqsfound_done_r)  ||
                     (rd_byte_data_offset[rnk_cnt_r][12+:6] < (nCL + nAL - 1)))
            rd_byte_data_offset[rnk_cnt_r][12+:6] <= #TCQ nCL + nAL + LATENCY_FACTOR;
        else if (dqs_found_start_r && ~pi_dqs_found_all_bank[2] &&
                 
                 (detect_pi_found_dqs && (detect_rd_cnt == 'd1)) && ~init_dqsfound_done_r && ~fine_adjust)
          rd_byte_data_offset[rnk_cnt_r][12+:6]
          <= #TCQ rd_byte_data_offset[rnk_cnt_r][12+:6] - 1;
      end