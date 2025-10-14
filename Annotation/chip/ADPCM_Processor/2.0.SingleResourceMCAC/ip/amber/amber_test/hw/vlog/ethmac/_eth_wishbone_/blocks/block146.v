always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxBDReady <=#Tp 1'b0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    TxBDReady <=#Tp ram_do[15] & (ram_do[31:16] > 4); 
  else                                                
  if(ResetTxBDReady)
    TxBDReady <=#Tp 1'b0;
end