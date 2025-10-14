always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxValid_d <= #Tp 1'b0;
      RxValid   <= #Tp 1'b0;
    end
  else
    begin
      RxValid_d <= #Tp GenerateRxValid;
      RxValid   <= #Tp RxValid_d;
    end
end