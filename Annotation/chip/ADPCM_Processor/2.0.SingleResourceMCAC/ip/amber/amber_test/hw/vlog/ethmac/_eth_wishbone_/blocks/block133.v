always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxLength <=#Tp 16'h0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    TxLength <=#Tp ram_do[31:16];
  else
  if(MasterWbTX & m_wb_ack_i)
    begin
      if(TxLengthLt4)
        TxLength <=#Tp 16'h0;
      else
      if(TxPointerLSB_rst==2'h0)
        TxLength <=#Tp TxLength - 3'h4;    
      else
      if(TxPointerLSB_rst==2'h1)
        TxLength <=#Tp TxLength - 3'h3;    
      else
      if(TxPointerLSB_rst==2'h2)
        TxLength <=#Tp TxLength - 3'h2;    
      else
      if(TxPointerLSB_rst==2'h3)
        TxLength <=#Tp TxLength - 3'h1;    
    end
end