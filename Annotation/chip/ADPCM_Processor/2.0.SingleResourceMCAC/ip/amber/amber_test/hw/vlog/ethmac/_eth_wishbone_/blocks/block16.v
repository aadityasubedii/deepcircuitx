always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxStatusInLatched <=#Tp 'h0;
  else
  if(LoadRxStatus)
    RxStatusInLatched <=#Tp RxStatusIn;
end