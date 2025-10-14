always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    ControlData[7:0] <= #Tp 8'h0;
  else
  if(~ByteCnt[0])
    ControlData[7:0] <= #Tp MuxedCtrlData[7:0];
end