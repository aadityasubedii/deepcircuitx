always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxValidBytesLatched <=#Tp 2'h0;
  else
  if(LatchValidBytes & ~LatchValidBytes_q)
    TxValidBytesLatched <=#Tp TxValidBytes;
  else
  if(TxRetryPulse | TxDonePulse | TxAbortPulse)
    TxValidBytesLatched <=#Tp 2'h0;
end