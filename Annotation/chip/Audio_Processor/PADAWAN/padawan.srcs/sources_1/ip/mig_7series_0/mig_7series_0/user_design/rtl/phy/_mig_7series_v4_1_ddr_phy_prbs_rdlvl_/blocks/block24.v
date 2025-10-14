  always @ (posedge clk) begin
    if(rst | (prbs_state_r == FINE_PI_INC) | (prbs_state_r == FINE_PI_DEC) | 
      (~cnt_wait_state && ((prbs_state_r == FINE_PI_INC_WAIT)|(prbs_state_r == FINE_PI_DEC_WAIT)))) begin 
	  compare_err_pb_and <= #TCQ 1'b0;
	  compare_err_pb_or  <= #TCQ 1'b0;
    end
	else begin
          compare_err_pb_and <= #TCQ &compare_err_pb? 1'b1: compare_err_pb_and;
	  compare_err_pb_or  <= #TCQ |compare_err_pb? 1'b1: compare_err_pb_or; 
	end
  end