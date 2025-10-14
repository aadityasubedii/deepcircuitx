always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxEndFrm_d <= #Tp 1'b0;
      RxEndFrm   <= #Tp 1'b0;
    end
  else
    begin
      RxEndFrm_d <= #Tp GenerateRxEndFrm;
      RxEndFrm   <= #Tp RxEndFrm_d | DribbleRxEndFrm;
    end
end