always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      WCtrlData_q1 <= #Tp 1'b0;
      WCtrlData_q2 <= #Tp 1'b0;
      WCtrlData_q3 <= #Tp 1'b0;
      
      RStat_q1 <= #Tp 1'b0;
      RStat_q2 <= #Tp 1'b0;
      RStat_q3 <= #Tp 1'b0;

      ScanStat_q1  <= #Tp 1'b0;
      ScanStat_q2  <= #Tp 1'b0;
      SyncStatMdcEn <= #Tp 1'b0;
    end
  else
    begin
      WCtrlData_q1 <= #Tp WCtrlData;
      WCtrlData_q2 <= #Tp WCtrlData_q1;
      WCtrlData_q3 <= #Tp WCtrlData_q2;

      RStat_q1 <= #Tp RStat;
      RStat_q2 <= #Tp RStat_q1;
      RStat_q3 <= #Tp RStat_q2;

      ScanStat_q1  <= #Tp ScanStat;
      ScanStat_q2  <= #Tp ScanStat_q1;
      if(MdcEn)
        SyncStatMdcEn  <= #Tp ScanStat_q2;
    end
end