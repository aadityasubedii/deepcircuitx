always @ (posedge MTxClk)
begin
  ControlEnd_q     <= #Tp ControlEnd;
  TxCtrlStartFrm_q <= #Tp TxCtrlStartFrm;
end