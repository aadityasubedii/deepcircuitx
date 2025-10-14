    always @(posedge ce_n or posedge clk) begin
        clk2waiter <= !ce_n;
    end