always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStatus <=#Tp 4'h0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    TxStatus <=#Tp ram_do[14:11];
end