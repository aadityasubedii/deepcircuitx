always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStartFrm_syncb1 <=#Tp 1'b0;
  else
    TxStartFrm_syncb1 <=#Tp TxStartFrm_sync2;
end