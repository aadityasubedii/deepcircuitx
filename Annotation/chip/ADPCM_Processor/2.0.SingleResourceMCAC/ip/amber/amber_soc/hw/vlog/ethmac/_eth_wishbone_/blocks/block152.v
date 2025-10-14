always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxEn_needed <=#Tp 1'b0;
  else
  if(~TxBDReady & r_TxEn & WbEn & ~WbEn_q)
    TxEn_needed <=#Tp 1'b1;
  else
  if(TxPointerRead & TxEn & TxEn_q)
    TxEn_needed <=#Tp 1'b0;
end