always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    LatchedTxLength <=#Tp 16'h0;
  else
  if(TxEn & TxEn_q & TxBDRead)
    LatchedTxLength <=#Tp ram_do[31:16];
end