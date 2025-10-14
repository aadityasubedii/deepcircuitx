    always @(posedge ck) begin
        if (inv)
            out <= 1'b1 + ~in;
        else
            out <= in;
    end