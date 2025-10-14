    always @(posedge ck) begin
        if (poll_addr != 0) begin
            read(poll_addr);
        end
    end