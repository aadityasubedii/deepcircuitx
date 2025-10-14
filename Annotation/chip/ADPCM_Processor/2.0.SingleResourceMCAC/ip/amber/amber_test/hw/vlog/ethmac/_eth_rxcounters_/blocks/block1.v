always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    DlyCrcCnt[3:0] <= #Tp 4'h0;
  else
    begin
      if(DlyCrcCnt[3:0] == 4'h9)
        DlyCrcCnt[3:0] <= #Tp 4'h0;
      else
      if(DlyCrcEn & StateSFD)
        DlyCrcCnt[3:0] <= #Tp 4'h1;
      else
      if(DlyCrcEn & (|DlyCrcCnt[3:0]))
        DlyCrcCnt[3:0] <= #Tp DlyCrcCnt[3:0] + 1'b1;
    end
end