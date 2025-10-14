always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    DataOut<=#1 RESET_VALUE;
  else
  if(SyncReset)
    DataOut<=#1 RESET_VALUE;
  else
  if(Write)                         
    DataOut<=#1 DataIn;
end