 always @(posedge clk_100MHz)begin
    if(counterEnable==0)begin
        counter <= 0;
        delay_done <= 0;
    end
    
    else if(counter < 60) begin
        counter <= counter + 1;
        delay_done <= 0;
    end
    
    else begin
        counter <= 0;
        delay_done <= 1;
    end
   end     