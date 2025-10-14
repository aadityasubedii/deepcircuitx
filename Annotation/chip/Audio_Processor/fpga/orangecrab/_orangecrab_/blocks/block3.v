    always @(posedge clock_in) begin
        divide <= !divide;
    end