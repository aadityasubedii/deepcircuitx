always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      WCtrlDataStart <= #Tp 1'b0;
      WCtrlDataStart_q <= #Tp 1'b0;
      RStatStart <= #Tp 1'b0;
    end
  else
    begin
      if(EndBusy)
        begin
          WCtrlDataStart <= #Tp 1'b0;
          RStatStart <= #Tp 1'b0;
        end
      else
        begin
          if(WCtrlData_q2 & ~WCtrlData_q3)
            WCtrlDataStart <= #Tp 1'b1;
          if(RStat_q2 & ~RStat_q3)
            RStatStart <= #Tp 1'b1;
          WCtrlDataStart_q <= #Tp WCtrlDataStart;
        end
    end
end 