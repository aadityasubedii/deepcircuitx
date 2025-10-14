    always @(posedge ck) begin
        if (ready)
            ready <= 0;
        if (enable) begin
            ready <= 1;
        end
    end