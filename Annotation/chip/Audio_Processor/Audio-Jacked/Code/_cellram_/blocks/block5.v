    always @(addr) begin
        addr2wir <= 1'b0;
        addr2wir <= #(1) 1'b1;
    end