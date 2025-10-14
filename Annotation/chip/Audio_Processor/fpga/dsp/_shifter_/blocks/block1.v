    always @(posedge ck) begin
        if (en) begin
            out <= shifted;
        end
    end