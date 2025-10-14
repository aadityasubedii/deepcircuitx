initial
    begin
    clk_200mhz = 1'd0;
    
    forever #2500 clk_200mhz = ~clk_200mhz;
    end