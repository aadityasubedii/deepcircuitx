    always @(posedge clk256 or posedge reset)
        clk128 <= (reset) ? 1'b0 : ~clk128;
