always @( posedge clk_i)
begin
  if ( rst_i[0] )
    cmd_rdy <= #TCQ   1'b1;
  else if (cmd_start)
       cmd_rdy <= #TCQ   1'b0;
  else if  ((data_port_fifo_rdy && user_burst_cnt == 1)) 
      cmd_rdy <= #TCQ   1'b1;
  

end