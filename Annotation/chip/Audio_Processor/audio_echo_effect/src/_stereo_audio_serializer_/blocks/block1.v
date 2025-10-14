    always @(posedge clk or posedge reset) begin
        if (reset) begin
            i_ready <= 1'b1;
            o_is_left <= 1'b1;
            right <= 0;
            left <= 0;
        end else begin
            if (i_valid && i_ready) begin
                i_ready <= 1'b0;
                right <= i_right;
                left <= i_left;
            end else if (o_valid && o_ready) begin
                o_is_left <= !o_is_left;
                i_ready <= !o_is_left;
            end
        end
    end