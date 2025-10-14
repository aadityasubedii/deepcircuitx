    always @(addr[ADDR_BITS-1:4]) begin
        addr2dqr <= 1'b0;
        addr2dqr <= #(1) 1'b1;
    end
