always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxPointerMSB <=#Tp 30'h0;
  else
  if(RxEn & RxEn_q & RxPointerRead)
    RxPointerMSB <=#Tp ram_do[31:2];
  else
  if(MasterWbRX & m_wb_ack_i)
      RxPointerMSB <=#Tp RxPointerMSB + 1'b1; 
end