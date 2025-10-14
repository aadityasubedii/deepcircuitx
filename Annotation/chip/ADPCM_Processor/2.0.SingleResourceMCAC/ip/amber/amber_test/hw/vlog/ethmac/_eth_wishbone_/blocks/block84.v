always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxData <=#Tp 0;
  else
  if(TxStartFrm_sync2 & ~TxStartFrm)
    case(TxPointerLSB)  
      2'h0 : TxData <=#Tp TxData_wb[31:24];                  
      2'h1 : TxData <=#Tp TxData_wb[23:16];                  
      2'h2 : TxData <=#Tp TxData_wb[15:08];                  
      2'h3 : TxData <=#Tp TxData_wb[07:00];                  
    endcase
  else
  if(TxStartFrm & TxUsedData & TxPointerLSB==2'h3)
    TxData <=#Tp TxData_wb[31:24];                           
  else
  if(TxUsedData & Flop)
    begin
      case(TxByteCnt)  
        0 : TxData <=#Tp TxDataLatched[31:24];               
        1 : TxData <=#Tp TxDataLatched[23:16];
        2 : TxData <=#Tp TxDataLatched[15:8];
        3 : TxData <=#Tp TxDataLatched[7:0];
      endcase
    end
end