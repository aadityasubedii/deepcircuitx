always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStartFrm_syncb2 <=#Tp 1'b0;
  else
    TxStartFrm_syncb2 <=#Tp TxStartFrm_syncb1;
end