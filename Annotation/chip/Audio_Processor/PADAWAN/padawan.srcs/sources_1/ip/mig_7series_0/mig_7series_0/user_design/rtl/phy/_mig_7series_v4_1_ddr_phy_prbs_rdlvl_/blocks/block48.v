      always @ (posedge clk) begin
        if (rst || new_cnt_dqs_r || (prbs_state_r == PRBS_INC_DQS) || (prbs_state_r == PRBS_DEC_DQS)) begin
              compare_err    <= #TCQ 1'b0;
              compare_err_r0 <= #TCQ 1'b0;
              compare_err_f0 <= #TCQ 1'b0;
              compare_err_r1 <= #TCQ 1'b0;
              compare_err_f1 <= #TCQ 1'b0;
              compare_err_r2 <= #TCQ 1'b0;
              compare_err_f2 <= #TCQ 1'b0;
              compare_err_r3 <= #TCQ 1'b0;
              compare_err_f3 <= #TCQ 1'b0;
            end else if (rd_valid_r2) begin
              compare_err_r0  <= #TCQ (mux_rd_rise0_r3 != compare_data_rise0_r1);
              compare_err_f0  <= #TCQ (mux_rd_fall0_r3 != compare_data_fall0_r1);
              compare_err_r1  <= #TCQ (mux_rd_rise1_r3 != compare_data_rise1_r1);
              compare_err_f1  <= #TCQ (mux_rd_fall1_r3 != compare_data_fall1_r1);
              compare_err_r2  <= #TCQ (mux_rd_rise2_r3 != compare_data_rise2_r1);
              compare_err_f2  <= #TCQ (mux_rd_fall2_r3 != compare_data_fall2_r1);
              compare_err_r3  <= #TCQ (mux_rd_rise3_r3 != compare_data_rise3_r1);
              compare_err_f3  <= #TCQ (mux_rd_fall3_r3 != compare_data_fall3_r1);
              compare_err     <= #TCQ (compare_err_r0 | compare_err_f0 |
                                       compare_err_r1 | compare_err_f1 |
                                                           compare_err_r2 | compare_err_f2 |
                                                           compare_err_r3 | compare_err_f3);
            end
      end