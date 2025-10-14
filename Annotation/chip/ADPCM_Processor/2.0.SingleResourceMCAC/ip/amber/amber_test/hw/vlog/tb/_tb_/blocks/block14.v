initial
    begin
    clk_25mhz = 1'd0;
    forever #20000 clk_25mhz = ~clk_25mhz;
    end