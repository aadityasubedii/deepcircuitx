always @(posedge main_clock) 
begin
    if (divide_counter == divide - 1)    
    begin
        divide_counter <= 0;            
        slow_clock <= ~slow_clock;      
    end
    else
        divide_counter <= divide_counter + 1;   
end