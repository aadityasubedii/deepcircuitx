always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxStartFrm_d <= #Tp 1'b0;
      RxStartFrm   <= #Tp 1'b0;
    end
  else
    begin
      RxStartFrm_d <= #Tp GenerateRxStartFrm;
      RxStartFrm   <= #Tp RxStartFrm_d;
    end
end