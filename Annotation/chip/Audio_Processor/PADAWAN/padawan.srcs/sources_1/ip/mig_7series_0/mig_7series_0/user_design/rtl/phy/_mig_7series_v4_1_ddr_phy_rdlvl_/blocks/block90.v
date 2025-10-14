   always @(posedge clk) begin
     if (rst)
       done_cnt <= #TCQ 'b0;
     else if (((cal1_state_r == CAL1_REGL_LOAD) &&
               (cal1_state_r1 == CAL1_NEXT_DQS)) ||
              ((done_cnt == 4'd1) && (cal1_state_r != CAL1_DONE)))
       done_cnt <= #TCQ 4'b1010;
     else if (done_cnt > 'b0)
       done_cnt <= #TCQ done_cnt - 1;
   end