always @ (posedge clk_i)
begin
  if (cmd_startD) 
         acounts[35:0]  <= #TCQ {4'b0000,addr_i}; 
  else if (fifo_rdy_i && data_rdy_i && MEM_BURST_LEN == 8 )
      if (NUM_DQ_PINS == 8)
         acounts <= #TCQ acounts + 4;
      else if (NUM_DQ_PINS == 16 || NUM_DQ_PINS == 24)
         acounts <= #TCQ acounts + 8;
      else if (NUM_DQ_PINS >= 32 && NUM_DQ_PINS < 64) 
         acounts <= #TCQ acounts + 16;
         
      else if (NUM_DQ_PINS >= 64 && NUM_DQ_PINS < 128 ) 
         acounts <= #TCQ acounts + 32;

      else if (NUM_DQ_PINS >= 128 && NUM_DQ_PINS < 256 )
         acounts <= #TCQ acounts + 64;
         

end