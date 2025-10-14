always @ (posedge clk_i)
begin
  if (rst_i[1])  
    data_valid <= #TCQ 'd0;
  else if(cmd_start) 
    data_valid <= #TCQ 1'b1;
  else if (fifo_not_full && user_burst_cnt <= 6'd1)  
    data_valid <= #TCQ 1'b0;
end