      always @(posedge clk) begin
        if (rst || pi_rst_stg1_cal_r1[0] || fine_adjust)
          pi_rst_stg1_cal_r[0] <= #TCQ 1'b0;
        else if ((pi_dqs_found_start && ~dqs_found_start_r) ||
                 
                 (pi_dqs_found_any_bank_r[0] && ~pi_dqs_found_all_bank[0]) ||
                 (rd_byte_data_offset[rnk_cnt_r][0+:6] < (nCL + nAL - 1)))
          pi_rst_stg1_cal_r[0] <= #TCQ 1'b1;
      end