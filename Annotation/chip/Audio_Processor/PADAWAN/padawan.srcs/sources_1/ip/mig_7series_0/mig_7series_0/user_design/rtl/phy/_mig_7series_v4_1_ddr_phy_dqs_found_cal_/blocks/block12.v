      always @(posedge clk) begin
        if (rst || rank_done_r)
          retry_cnt[0+:10] <= #TCQ 'b0;
        else if ((rd_byte_data_offset[rnk_cnt_r][0+:6] < (nCL + nAL - 1)) &&
                 ~pi_dqs_found_all_bank[0])
          retry_cnt[0+:10] <= #TCQ retry_cnt[0+:10] + 1;
        else
          retry_cnt[0+:10] <= #TCQ retry_cnt[0+:10];
      end