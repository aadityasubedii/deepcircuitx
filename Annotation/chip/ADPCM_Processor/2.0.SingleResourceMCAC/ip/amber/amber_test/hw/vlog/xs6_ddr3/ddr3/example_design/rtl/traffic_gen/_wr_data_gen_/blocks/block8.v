always @( posedge clk_i)
begin
  if ( rst_i[0] )
    cmd_rdyC <= #TCQ 1'b1;
  else if (cmd_startC)
     if (bl_i == 1)
        cmd_rdyC <= #TCQ 1'b1;
     else
       cmd_rdyC <= #TCQ 1'b0;
  else if  ((user_burst_cnt == 6'd2 && fifo_not_full ) )


      cmd_rdyC <= #TCQ 1'b1;
  

end