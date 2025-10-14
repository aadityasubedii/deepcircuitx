always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxDataLatched1       <=#Tp 24'h0;
  else
  if(RxValid & RxReady & ~LastByteIn)
    if(RxStartFrm)
    begin
      case(RxPointerLSB_rst)     
        2'h0:        RxDataLatched1[31:24] <=#Tp RxData;            
        2'h1:        RxDataLatched1[23:16] <=#Tp RxData;
        2'h2:        RxDataLatched1[15:8]  <=#Tp RxData;
        2'h3:        RxDataLatched1        <=#Tp RxDataLatched1;
      endcase
    end
    else if (RxEnableWindow)
    begin
      case(RxByteCnt)     
        2'h0:        RxDataLatched1[31:24] <=#Tp RxData;            
        2'h1:        RxDataLatched1[23:16] <=#Tp RxData;
        2'h2:        RxDataLatched1[15:8]  <=#Tp RxData;
        2'h3:        RxDataLatched1        <=#Tp RxDataLatched1;
      endcase
    end
end