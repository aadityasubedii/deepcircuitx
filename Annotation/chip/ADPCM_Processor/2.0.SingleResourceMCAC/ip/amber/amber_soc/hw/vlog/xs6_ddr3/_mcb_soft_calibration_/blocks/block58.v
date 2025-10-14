always @ (posedge UI_CLK)
begin
if (RST)
   State_Start_DynCal <= 1'b0;
else if (STATE == START_DYN_CAL)   
   State_Start_DynCal <= 1'b1;
else
   State_Start_DynCal <= 1'b0;
end