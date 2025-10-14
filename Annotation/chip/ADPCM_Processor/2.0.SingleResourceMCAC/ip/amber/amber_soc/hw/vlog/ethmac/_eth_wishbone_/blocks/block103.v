always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxBDAddress <=#Tp 7'h0;
  else if(r_RxEn & (~r_RxEn_q))
    RxBDAddress <=#Tp r_TxBDNum[6:0];
  else if(RxStatusWrite)
    RxBDAddress <=#Tp TempRxBDAddress;
end