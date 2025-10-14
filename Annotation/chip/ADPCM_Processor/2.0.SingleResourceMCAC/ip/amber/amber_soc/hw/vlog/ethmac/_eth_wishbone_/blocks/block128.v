always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerLSB_rst[1:0] <=#Tp 0;
  else
  if(TxEn & TxEn_q & TxPointerRead)
    TxPointerLSB_rst[1:0] <=#Tp ram_do[1:0];
  else
  if(MasterWbTX & m_wb_ack_i)                 
    TxPointerLSB_rst[1:0] <=#Tp 0;
end