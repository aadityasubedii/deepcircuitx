always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxData_d[7:0]      <= #Tp 8'h0;
      DelayData          <= #Tp 1'b0;
      LatchedByte[7:0]   <= #Tp 8'h0;
      RxData[7:0]        <= #Tp 8'h0;
    end
  else
    begin
      LatchedByte[7:0]   <= #Tp {MRxD[3:0], LatchedByte[7:4]};  
      DelayData          <= #Tp StateData[0];

      if(GenerateRxValid)
        RxData_d[7:0] <= #Tp LatchedByte[7:0] & {8{|StateData}};  
      else
      if(~DelayData)
        RxData_d[7:0] <= #Tp 8'h0;                                

      RxData[7:0] <= #Tp RxData_d[7:0];                           
    end
end