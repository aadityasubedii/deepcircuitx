always @ (posedge clk_i)
begin
  if (rst_i[0])  
    data_valid <= #TCQ   'd0;
  else if (user_burst_cnt == 6'd1 && data_port_fifo_rdy)
    data_valid <= #TCQ   1'b0;
  else if(( user_burst_cnt >= 6'd1) || cmd_start) 
    data_valid <= #TCQ   1'b1;
end