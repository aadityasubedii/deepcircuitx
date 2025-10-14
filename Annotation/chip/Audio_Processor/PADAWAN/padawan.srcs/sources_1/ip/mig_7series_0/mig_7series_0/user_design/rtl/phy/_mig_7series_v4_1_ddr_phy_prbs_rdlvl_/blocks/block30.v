        always @ (posedge clk) begin
          
          if (rst || new_cnt_dqs_r || (prbs_state_r == FINE_PI_INC) || (prbs_state_r == FINE_PI_DEC) || 
         (err_chk_invalid && ((prbs_state_r == FINE_PI_DEC_WAIT)||(prbs_state_r == FINE_PI_INC_WAIT)))) 
            compare_err_pb[pb_i]  <= #TCQ 1'b0;
          else if (rd_valid_r2) 
            compare_err_pb[pb_i]  <= #TCQ (mux_rd_rise0_r3[pb_i] != compare_data_rise0_r1[pb_i]) |  
                                          (mux_rd_fall0_r3[pb_i] != compare_data_fall0_r1[pb_i]) |  
                                          (mux_rd_rise1_r3[pb_i] != compare_data_rise1_r1[pb_i]) |  
                                          (mux_rd_fall1_r3[pb_i] != compare_data_fall1_r1[pb_i]) |  
                                          (mux_rd_rise2_r3[pb_i] != compare_data_rise2_r1[pb_i]) |  
                                          (mux_rd_fall2_r3[pb_i] != compare_data_fall2_r1[pb_i]) |  
                                          (mux_rd_rise3_r3[pb_i] != compare_data_rise3_r1[pb_i]) |  
                                          (mux_rd_fall3_r3[pb_i] != compare_data_fall3_r1[pb_i]) ; 
        end 