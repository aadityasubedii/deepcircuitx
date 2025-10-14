    always @(posedge ck) begin
        if (debounce) begin
            sw1 <= SW1;
            if (SW1 && !sw1) begin
                state <= state + 1;
            end
        end
    end