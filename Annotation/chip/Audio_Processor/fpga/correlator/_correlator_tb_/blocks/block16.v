    always @(posedge ck) begin
        out <= 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            if (hi_bit[i])
                out <= i;
        end
    end