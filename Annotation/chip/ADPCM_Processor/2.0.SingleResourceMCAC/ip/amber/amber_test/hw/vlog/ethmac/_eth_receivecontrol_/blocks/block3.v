always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    SlotTimer[5:0] <= #Tp 6'h0;
  else
  if(ResetSlotTimer)
    SlotTimer[5:0] <= #Tp 6'h0;
  else
  if(IncrementSlotTimer)
    SlotTimer[5:0] <= #Tp SlotTimer[5:0] + 1'b1;
end