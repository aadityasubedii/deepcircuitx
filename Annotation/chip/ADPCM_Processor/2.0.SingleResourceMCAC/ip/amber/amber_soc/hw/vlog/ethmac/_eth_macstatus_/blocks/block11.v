always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    InvalidSymbol <=#Tp 1'b0;
  else
  if(LoadRxStatus & ~SetInvalidSymbol)
    InvalidSymbol <=#Tp 1'b0;
  else
  if(SetInvalidSymbol)
    InvalidSymbol <=#Tp 1'b1;
end