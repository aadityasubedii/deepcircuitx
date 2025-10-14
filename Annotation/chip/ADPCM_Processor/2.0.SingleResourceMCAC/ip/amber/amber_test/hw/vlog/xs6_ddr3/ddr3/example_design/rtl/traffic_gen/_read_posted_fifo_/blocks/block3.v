   always @ (posedge clk_i)
   begin 
   if (rst_i)
       rd_first_data <= #TCQ 1'b0;
   else if (~empty && empty_r)
       rd_first_data <= #TCQ 1'b1;
   end   