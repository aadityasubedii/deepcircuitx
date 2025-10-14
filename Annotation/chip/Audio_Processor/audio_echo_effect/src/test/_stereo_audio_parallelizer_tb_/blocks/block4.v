    initial begin
        clk = 1'b0;
        forever begin
            #(CLK_TIME / 2) clk = ~clk;
        end
    end