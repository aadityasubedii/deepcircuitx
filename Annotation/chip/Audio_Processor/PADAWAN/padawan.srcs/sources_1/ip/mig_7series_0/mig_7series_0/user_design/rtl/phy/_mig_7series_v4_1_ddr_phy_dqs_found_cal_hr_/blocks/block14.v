      always @(posedge clk) begin
        if (rst || fine_adjust)
          pi_rst_stg1_cal_r1[0]  <= #TCQ 1'b0;
        else if (pi_rst_stg1_cal_r[0])
          pi_rst_stg1_cal_r1[0]  <= #TCQ 1'b1;
        else if (~pi_dqs_found_any_bank_r[0] && ~pi_dqs_found_all_bank[0])
          pi_rst_stg1_cal_r1[0]  <= #TCQ 1'b0;
      end