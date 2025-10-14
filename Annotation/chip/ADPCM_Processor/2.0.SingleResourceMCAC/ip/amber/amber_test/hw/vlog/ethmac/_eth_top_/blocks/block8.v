always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    WillSendControlFrame_sync3 <= 1'b0;
  else
    WillSendControlFrame_sync3 <=#Tp WillSendControlFrame_sync2;
end