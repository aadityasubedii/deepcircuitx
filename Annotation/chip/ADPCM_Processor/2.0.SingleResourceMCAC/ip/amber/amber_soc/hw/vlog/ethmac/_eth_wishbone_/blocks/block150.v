always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      WbEn_q <=#Tp 1'b0;
      RxEn_q <=#Tp 1'b0;
      TxEn_q <=#Tp 1'b0;
      r_TxEn_q <=#Tp 1'b0;
      r_RxEn_q <=#Tp 1'b0;
    end
  else
    begin
      WbEn_q <=#Tp WbEn;
      RxEn_q <=#Tp RxEn;
      TxEn_q <=#Tp TxEn;
      r_TxEn_q <=#Tp r_TxEn;
      r_RxEn_q <=#Tp r_RxEn;
    end
end