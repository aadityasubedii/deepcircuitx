always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    OpCodeOK <= #Tp 1'b0;
  else
  if(ByteCntEq16)
    OpCodeOK <= #Tp 1'b0;
  else
    begin
      if(DetectionWindow & ByteCntEq14)
        OpCodeOK <= #Tp ByteCntEq14 & RxData[7:0] == 8'h00;
    
      if(DetectionWindow & ByteCntEq15)
        OpCodeOK <= #Tp ByteCntEq15 & RxData[7:0] == 8'h01 & OpCodeOK;
    end
end