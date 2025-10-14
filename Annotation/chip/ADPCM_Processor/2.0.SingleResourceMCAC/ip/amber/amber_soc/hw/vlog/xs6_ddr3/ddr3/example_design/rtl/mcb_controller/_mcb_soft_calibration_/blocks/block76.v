always @ (posedge UI_CLK ) begin  
if (RstCounter >= TZQINIT_MAXCNT) 
    Rst_condition1 <= 1'b1;
else
    Rst_condition1 <= 1'b0;

end