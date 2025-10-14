always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    begin
      PauseTimerEq0_sync1 <= #Tp 1'b1;
      PauseTimerEq0_sync2 <= #Tp 1'b1;
    end
  else
    begin
      PauseTimerEq0_sync1 <= #Tp PauseTimerEq0;
      PauseTimerEq0_sync2 <= #Tp PauseTimerEq0_sync1;
    end
end