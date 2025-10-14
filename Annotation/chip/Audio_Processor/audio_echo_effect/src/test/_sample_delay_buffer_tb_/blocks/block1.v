    always @(posedge clk or reset) begin
        if (reset) begin
            i_ready <= 1'b1;
            o_valid <= 1'b0;
        end else begin
            if (i_valid) begin
                i_ready <= 1'b0;
                o_result <= i_current + i_buffer;
                o_buffer <= i_buffer;
                repeat (2) @(posedge clk);
                o_valid <= 1'b1;
            end
            if (o_valid && o_ready) begin
                o_valid <= 1'b0;
                i_ready <= 1'b1;
            end
        end
    end