always @( posedge clk_i)
begin
  if ( rst_i[0] )
    user_burst_cnt <= #TCQ   'd0;
  else if(cmd_start)  begin
       if (bl_i == 6'b000000)
          user_burst_cnt <= #TCQ 7'b1000000;
       else
          user_burst_cnt <= #TCQ bl_i;
      end
  else if(data_port_fifo_rdy) 
     if (user_burst_cnt != 6'd0)
        user_burst_cnt <= #TCQ   user_burst_cnt - 1'b1;
     else
        user_burst_cnt <= #TCQ   'd0;
        
end