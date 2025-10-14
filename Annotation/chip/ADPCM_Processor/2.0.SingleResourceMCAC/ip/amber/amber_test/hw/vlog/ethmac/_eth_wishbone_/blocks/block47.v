always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxValidBytes <=#Tp 2'h1;
  else
  if(RxValid & RxStartFrm)
    case(RxPointerLSB_rst)  
      2'h0 : RxValidBytes <=#Tp 2'h1;
      2'h1 : RxValidBytes <=#Tp 2'h2;
      2'h2 : RxValidBytes <=#Tp 2'h3;
      2'h3 : RxValidBytes <=#Tp 2'h0;
    endcase
  else
  if(RxValid & ~LastByteIn & ~RxStartFrm & RxEnableWindow)
    RxValidBytes <=#Tp RxValidBytes + 1'b1;
end