    generate
        if (CLOCKS==64) begin
            assign MASK = 6'b111111;
            assign midpoint = 32;
        end
        if (CLOCKS==32) begin
            assign MASK = 6'b011111;
            assign midpoint = 16;
        end
    endgenerate