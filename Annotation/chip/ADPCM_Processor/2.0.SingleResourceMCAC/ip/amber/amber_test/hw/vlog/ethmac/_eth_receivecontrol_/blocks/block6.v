always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    Divider2 <= #Tp 1'b0;
  else
  if(|PauseTimer[15:0] & RxFlow)
    Divider2 <= #Tp ~Divider2;
  else
    Divider2 <= #Tp 1'b0;
end