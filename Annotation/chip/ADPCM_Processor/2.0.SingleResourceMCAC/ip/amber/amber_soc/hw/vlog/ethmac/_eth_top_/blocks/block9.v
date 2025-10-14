always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    WillSendControlFrame_sync2 <= 1'b0;
  else
    WillSendControlFrame_sync2 <=#Tp WillSendControlFrame_sync1;
end