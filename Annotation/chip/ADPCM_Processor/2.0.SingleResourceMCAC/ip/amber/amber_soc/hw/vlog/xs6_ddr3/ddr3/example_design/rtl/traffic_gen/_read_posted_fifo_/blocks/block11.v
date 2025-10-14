   always @ (posedge clk_i)
   begin 
         
         
         
       dfifo_has_enough_room <= #TCQ (buf_avail_r >= 62  ) ? 1'b1: 1'b0;

       dfifo_has_enough_room_d1 <= #TCQ dfifo_has_enough_room ;
   end