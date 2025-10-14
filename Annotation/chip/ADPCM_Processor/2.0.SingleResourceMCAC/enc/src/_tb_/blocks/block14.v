initial
    begin
    clk_533mhz = 1'd0;
    
    forever #938 clk_533mhz = ~clk_533mhz;
    end