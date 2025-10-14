always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxPointerLSB_rst[1:0] <=#Tp 0;
  else
  if(MasterWbRX & m_wb_ack_i)                 
    RxPointerLSB_rst[1:0] <=#Tp 0;
  else
  if(RxEn & RxEn_q & RxPointerRead)
    RxPointerLSB_rst[1:0] <=#Tp ram_do[1:0];
end