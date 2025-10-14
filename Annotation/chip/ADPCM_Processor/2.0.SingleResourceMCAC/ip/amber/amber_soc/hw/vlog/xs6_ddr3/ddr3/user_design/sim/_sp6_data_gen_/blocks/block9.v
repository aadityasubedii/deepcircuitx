  always @ (posedge clk_i)
  begin
    if (rst_i)  
      hdata <= #TCQ    'd0;
    else if((fifo_rdy_i && user_burst_cnt != 6'd0) || cmd_startC ) begin
      if (NUM_DQ_PINS == 16)
           hdata <= #TCQ    32'h0000_FFFF;
      else if (NUM_DQ_PINS == 8)
           hdata <= #TCQ    32'h00FF_00FF;
      else if (NUM_DQ_PINS == 4)     
           hdata <= #TCQ    32'h0F0F_0F0F;
    end
  end