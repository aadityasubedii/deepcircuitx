always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    begin
      TxAbortInLatched <= #Tp 1'b0;
      TxDoneInLatched  <= #Tp 1'b0;
    end
  else
    begin
      TxAbortInLatched <= #Tp TxAbortIn;
      TxDoneInLatched  <= #Tp TxDoneIn;
    end
end