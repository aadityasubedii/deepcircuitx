      always @ (posedge clk) begin
        if((prbs_state_r == FINE_PI_INC) | (prbs_state_r == FINE_PI_DEC) | 
          (~cnt_wait_state && ((prbs_state_r == FINE_PI_INC_WAIT)|(prbs_state_r == FINE_PI_DEC_WAIT)))) 
          compare_err_pb_latch_r[pb_r] <= #TCQ 1'b0;
        else 
          compare_err_pb_latch_r[pb_r] <= #TCQ compare_err_pb[pb_r]? 1'b1:compare_err_pb_latch_r[pb_r];  
      end