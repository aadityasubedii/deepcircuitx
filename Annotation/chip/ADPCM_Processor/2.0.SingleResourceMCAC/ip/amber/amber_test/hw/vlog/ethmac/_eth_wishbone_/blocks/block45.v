always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxDataLatched2 <=#Tp 32'h0;
  else
  if(SetWriteRxDataToFifo & ~ShiftWillEnd)
    RxDataLatched2 <=#Tp {RxDataLatched1[31:8], RxData};              
  else
  if(SetWriteRxDataToFifo & ShiftWillEnd)
    case(RxValidBytes)  
      0 : RxDataLatched2 <=#Tp {RxDataLatched1[31:8],  RxData};       
      1 : RxDataLatched2 <=#Tp {RxDataLatched1[31:24], 24'h0};
      2 : RxDataLatched2 <=#Tp {RxDataLatched1[31:16], 16'h0};
      3 : RxDataLatched2 <=#Tp {RxDataLatched1[31:8],   8'h0};
    endcase
end