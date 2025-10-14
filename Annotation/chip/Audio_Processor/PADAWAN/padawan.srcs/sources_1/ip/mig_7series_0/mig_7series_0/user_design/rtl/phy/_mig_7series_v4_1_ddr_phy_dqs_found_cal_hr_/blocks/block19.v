      always @(posedge clk) begin
        if (rst)
          pi_dqs_found_err_r[1] <= #TCQ 1'b0;
        else if (~pi_dqs_found_all_bank[1] && (retry_cnt[10+:10] == NUM_DQSFOUND_CAL) &&
                (rd_byte_data_offset[rnk_cnt_r][6+:6] > (nCL + nAL + LATENCY_FACTOR - 1)))
          pi_dqs_found_err_r[1] <= #TCQ 1'b1;
      end