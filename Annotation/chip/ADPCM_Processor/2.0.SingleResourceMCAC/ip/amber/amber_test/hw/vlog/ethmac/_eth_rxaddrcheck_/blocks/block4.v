always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    UnicastOK <= #Tp 1'b0;
  else
  if(RxCheckEn & ByteCntEq2)
    UnicastOK <= #Tp   RxData[7:0] == MAC[47:40];
  else
  if(RxCheckEn & ByteCntEq3)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[39:32]) & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq4)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[31:24]) & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq5)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[23:16]) & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq6)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[15:8])  & UnicastOK;
  else
  if(RxCheckEn & ByteCntEq7)
    UnicastOK <= #Tp ( RxData[7:0] == MAC[7:0])   & UnicastOK;
  else
  if(RxEndFrm | RxAbort)
    UnicastOK <= #Tp 1'b0;
end