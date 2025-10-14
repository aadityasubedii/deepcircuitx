always @ (posedge clk_i)
begin
  if (cmd_startD) 
    adata <= #TCQ    addr_i;
  else if(fifo_rdy_i && data_rdy_i && user_burst_cnt > 6'd1) 
         if (DWIDTH == 128)
                 adata <= #TCQ    adata + 16;
         else if (DWIDTH == 64)
                 adata <= #TCQ    adata + 8;
         else     
                 adata <= #TCQ    adata + 4;
end