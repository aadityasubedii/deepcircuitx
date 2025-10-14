   always @(posedge clk) begin
     if (rst)
       flag_init <= #TCQ 1'b1;
     else if ((wl_state_r == WL_WAIT) && ((wl_state_r1 == WL_INIT_FINE_INC_WAIT) ||
              (wl_state_r1 == WL_INIT_FINE_DEC_WAIT)))
       flag_init <= #TCQ 1'b0;
   end