    always @(posedge clk or posedge reset) begin
        if (reset) begin
            i_ready <= 1'b1;
            o_left <= 0;
            o_right <= 0;
        end else begin
            if (i_ready) begin
                if (i_valid) begin
                    if (i_is_left)
                        o_left <= i_audio;
                    else
                        o_right <= i_audio;
                    i_ready <= i_is_left;
                end
            end else
                i_ready <= o_ready;
        end
    end