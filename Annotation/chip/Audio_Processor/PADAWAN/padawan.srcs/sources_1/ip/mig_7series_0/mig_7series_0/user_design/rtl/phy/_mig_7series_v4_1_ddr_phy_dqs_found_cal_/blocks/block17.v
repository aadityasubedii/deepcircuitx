      always @(posedge clk) begin
        if (rst) begin
          for (q = 0; q < RANKS; q = q + 1) begin: two_bank0_rst_loop
            rd_byte_data_offset[q][0+:6] <= #TCQ nCL + nAL + LATENCY_FACTOR;
          end
        end else if ((rank_done_r1 && ~init_dqsfound_done_r)  ||
                     (rd_byte_data_offset[rnk_cnt_r][0+:6] < (nCL + nAL - 1)))
            rd_byte_data_offset[rnk_cnt_r][0+:6] <= #TCQ nCL + nAL + LATENCY_FACTOR;
        else if (dqs_found_start_r && ~pi_dqs_found_all_bank[0] &&
                 
                 (detect_pi_found_dqs && (detect_rd_cnt == 'd1)) && ~init_dqsfound_done_r && ~fine_adjust)
          rd_byte_data_offset[rnk_cnt_r][0+:6]
          <= #TCQ rd_byte_data_offset[rnk_cnt_r][0+:6] - 1;
      end