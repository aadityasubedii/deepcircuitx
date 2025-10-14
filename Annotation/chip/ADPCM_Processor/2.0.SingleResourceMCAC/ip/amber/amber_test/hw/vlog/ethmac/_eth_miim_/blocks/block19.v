always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      EndBusy_d <= #Tp 1'b0;
      EndBusy <= #Tp 1'b0;
    end
  else
    begin
      EndBusy_d <= #Tp ~InProgress_q2 & InProgress_q3;
      EndBusy   <= #Tp EndBusy_d;
    end
end