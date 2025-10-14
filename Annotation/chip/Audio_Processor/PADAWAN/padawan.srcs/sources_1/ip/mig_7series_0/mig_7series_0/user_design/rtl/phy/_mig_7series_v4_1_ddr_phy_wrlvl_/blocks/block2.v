   always @(posedge clk) begin
     if (rst)
       incdec_wait_cnt <= #TCQ 'd0;
     else if ((wl_state_r == WL_FINE_DEC_WAIT1) ||
             (wl_state_r == WL_INIT_FINE_DEC_WAIT1) ||
             (wl_state_r == WL_CORSE_INC_WAIT_TMP))
       incdec_wait_cnt <= #TCQ incdec_wait_cnt + 1;
     else
       incdec_wait_cnt <= #TCQ 'd0;
   end