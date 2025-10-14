always @ (posedge mrx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    RxEnSync <= #Tp 1'b0;
  else
  if(~mrxdv_pad_i)
    RxEnSync <= #Tp r_RxEn;
end 