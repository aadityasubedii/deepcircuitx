always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxByteCnt <=#Tp 2'h0;
  else
  if(ShiftEnded_rck | RxAbort)
    RxByteCnt <=#Tp 2'h0;
  else
  if(RxValid & RxStartFrm & RxReady)
    case(RxPointerLSB_rst)  
      2'h0 : RxByteCnt <=#Tp 2'h1;
      2'h1 : RxByteCnt <=#Tp 2'h2;
      2'h2 : RxByteCnt <=#Tp 2'h3;
      2'h3 : RxByteCnt <=#Tp 2'h0;
    endcase
  else
  if(RxValid & RxEnableWindow & RxReady | LastByteIn)
    RxByteCnt <=#Tp RxByteCnt + 1'b1;
end