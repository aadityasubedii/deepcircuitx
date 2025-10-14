     always @ (posedge clk) begin
       if(rst | prbs_state_r == PRBS_NEW_DQS_WAIT ) begin
         fine_delay_incdec_pb[f_pb] <= #TCQ 1'b0;
       end else if((prbs_state_r == FINE_CALC_TAPS_WAIT) && (bit_cnt == DRAM_WIDTH)) begin 
         if(stage_cnt == 'd0) fine_delay_incdec_pb[f_pb] <= #TCQ (f_pb==ref_bit)? 1'b0:1'b1;  
         else if(stage_cnt == 'd1) fine_delay_incdec_pb[f_pb] <= #TCQ (right_gain_pb[f_pb*6+:6]>left_loss_pb[f_pb*6+:6])?1'b1:1'b0;
       end
     end