    always @(posedge clk or reset) begin
        if (reset) begin
        end else begin
            if (o_valid) begin
                $write("%08h\n", o_audio);
            end
        end
    end