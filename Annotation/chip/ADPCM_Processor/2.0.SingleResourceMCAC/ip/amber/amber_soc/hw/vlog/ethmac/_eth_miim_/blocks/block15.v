always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    Nvalid <= #Tp 1'b0;
  else
    begin
      if(~InProgress_q2 & InProgress_q3)
        begin
          Nvalid <= #Tp 1'b0;
        end
      else
        begin
          if(ScanStat_q2  & ~SyncStatMdcEn)
            Nvalid <= #Tp 1'b1;
        end
    end
end 