    always @(posedge clk or reset) begin
        if (reset) begin
        end else begin
            if (o_valid) begin
                $write("l = %08h, r = %08h\n", o_left, o_right);
            end
        end
    end