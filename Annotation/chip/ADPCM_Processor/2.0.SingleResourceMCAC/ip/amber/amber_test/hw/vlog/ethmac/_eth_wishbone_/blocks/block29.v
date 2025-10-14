always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEnded <=#Tp 1'b0;
  else
  if(ShiftEndedSync3 & MasterWbRX & m_wb_ack_i & RxBufferAlmostEmpty & ~ShiftEnded)
    ShiftEnded <=#Tp 1'b1;
  else
  if(RxStatusWrite)
    ShiftEnded <=#Tp 1'b0;
end