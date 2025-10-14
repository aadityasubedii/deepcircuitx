always @ (posedge UI_CLK)
begin
if (RST)
   State_Start_DynCal_R1 <= 1'b0;
else 
   State_Start_DynCal_R1 <= State_Start_DynCal;
end