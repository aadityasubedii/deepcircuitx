   always @ (posedge clk_i)
   begin
   if (rst_i)
       wait_cnt <= #TCQ 'b0;
   else if (cmd_rdy_o && cmd_valid_i)
       wait_cnt <= #TCQ 2'b10;
   else if (wait_cnt > 0)
         wait_cnt <= #TCQ wait_cnt - 1;
       
   end