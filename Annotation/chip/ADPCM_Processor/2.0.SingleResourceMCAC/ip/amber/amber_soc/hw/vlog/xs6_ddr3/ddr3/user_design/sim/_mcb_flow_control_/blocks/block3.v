 always @ (posedge clk_i)
 begin
if (rst_i[0])
   wr_in_progress <= #TCQ  1'b0;
else if (last_word_wr_i)   
   wr_in_progress <= #TCQ  1'b0;   
else if (current_state == WRITE)   
   wr_in_progress <= #TCQ  1'b1;


end