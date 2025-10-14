always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RetryCnt[3:0] <= #Tp 4'h0;
  else
    begin
      if(ExcessiveDeferOccured | UnderRun | TooBig | StartTxDone | TxUnderRun 
          | StateJam & NibCntEq7 & (~ColWindow | RetryMax))
        RetryCnt[3:0] <= #Tp 4'h0;
      else
      if(StateJam & NibCntEq7 & ColWindow & (RandomEq0 | NoBckof) | StateBackOff & RandomEqByteCnt)
        RetryCnt[3:0] <= #Tp RetryCnt[3:0] + 1'b1;
    end
end