      always @(posedge clk) begin
        if (rst) begin
          for (l = 0; l < RANKS; l = l + 1) begin: bank_rst_loop
            rd_byte_data_offset[l] <= #TCQ nCL + nAL - 2;
          end
        end else if ((rank_done_r1 && ~init_dqsfound_done_r) ||
		             (rd_byte_data_offset[rnk_cnt_r] > (nCL + nAL + LATENCY_FACTOR - 1)))
          rd_byte_data_offset[rnk_cnt_r] <= #TCQ nCL + nAL - 2;
        else if (dqs_found_start_r && ~pi_dqs_found_all_bank[0] &&
                 
                 (detect_pi_found_dqs && (detect_rd_cnt == 'd1)) && ~init_dqsfound_done_r && ~fine_adjust)
          rd_byte_data_offset[rnk_cnt_r]
          <= #TCQ rd_byte_data_offset[rnk_cnt_r] + 1;
      end