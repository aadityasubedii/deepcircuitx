      always @(posedge clk) begin
        if (rst) begin
          for (r = 0; r < RANKS; r = r + 1) begin: two_bank1_rst_loop
            rd_byte_data_offset[r][6+:6] <= #TCQ nCL + nAL - 2;
          end
        end else if ((rank_done_r1 && ~init_dqsfound_done_r) ||
		             (rd_byte_data_offset[rnk_cnt_r][6+:6] > (nCL + nAL + LATENCY_FACTOR - 1)))
            rd_byte_data_offset[rnk_cnt_r][6+:6] <= #TCQ nCL + nAL - 2;
        else if (dqs_found_start_r && ~pi_dqs_found_all_bank[1] &&
                 
                 (detect_pi_found_dqs && (detect_rd_cnt == 'd1)) && ~init_dqsfound_done_r && ~fine_adjust)
          rd_byte_data_offset[rnk_cnt_r][6+:6]
          <= #TCQ rd_byte_data_offset[rnk_cnt_r][6+:6] + 1;
      end