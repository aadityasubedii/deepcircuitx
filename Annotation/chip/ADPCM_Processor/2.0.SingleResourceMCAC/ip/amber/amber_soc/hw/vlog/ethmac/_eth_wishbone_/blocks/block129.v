always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerLSB[1:0] <=#Tp 0;
  else
  if(TxEn & TxEn_q & TxPointerRead)
    TxPointerLSB[1:0] <=#Tp ram_do[1:0];
end