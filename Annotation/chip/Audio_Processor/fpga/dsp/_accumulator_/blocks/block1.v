    always @(posedge ck) begin
        if (en) begin
            if (add)
                out <= prev + to_add;
            else
                out <= prev - to_add;
        end
    end