  always @ (posedge clk_i)
  begin
  if (data_valid_i && user_bl_cnt_is_1)  
     user_bl_cnt_not_1 <= #TCQ 1'b1;
  else     
     user_bl_cnt_not_1 <= #TCQ 1'b0;
  end  