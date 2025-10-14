always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      Collision_Tx1 <= #Tp 1'b0;
      Collision_Tx2 <= #Tp 1'b0;
    end
  else
    begin
      Collision_Tx1 <= #Tp mcoll_pad_i;
      if(ResetCollision)
        Collision_Tx2 <= #Tp 1'b0;
      else
      if(Collision_Tx1)
        Collision_Tx2 <= #Tp 1'b1;
    end
end