always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxBDAddress <=#Tp 7'h0;
  else if (r_TxEn & (~r_TxEn_q))
    TxBDAddress <=#Tp 7'h0;
  else if (TxStatusWrite)
    TxBDAddress <=#Tp TempTxBDAddress;
end