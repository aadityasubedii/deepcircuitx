   always @(posedge clk_i)
   begin
   if (rst_i)
      wait_done <= #TCQ 1'b1;
   else if (cmd_rdy_o && cmd_valid_i)
      wait_done <= #TCQ 1'b0;
   else if (wait_cnt == 0)
      wait_done <= #TCQ 1'b1;
   else
      wait_done <= #TCQ 1'b0;
   
   end