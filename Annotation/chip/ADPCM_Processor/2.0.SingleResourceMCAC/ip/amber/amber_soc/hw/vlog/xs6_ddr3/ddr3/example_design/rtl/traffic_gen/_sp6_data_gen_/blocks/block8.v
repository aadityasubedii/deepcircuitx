  always @ (posedge clk_i)
  begin
    if (rst_i)  
      hdata <= #TCQ    'd0;
    else if((fifo_rdy_i && user_burst_cnt != 6'd0) || cmd_startC )
      if (NUM_DQ_PINS == 16)
           hdata <= #TCQ    64'h0000FFFF_0000FFFF;
      else if (NUM_DQ_PINS == 8)
           hdata <= #TCQ    64'h00FF00FF_00FF00FF;
      else if (NUM_DQ_PINS == 4)     
           hdata <= #TCQ    64'h0F0F_0F0F_0F0F_0F0F;
    
  end
end