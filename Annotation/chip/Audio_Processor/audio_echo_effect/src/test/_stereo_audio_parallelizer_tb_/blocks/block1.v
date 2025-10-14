    always @(posedge clk or posedge reset) begin
        if (reset) begin
            o_ready <= 1'b1;
        end else if (o_valid && o_ready) begin
            $write("l = %08h / r = %08h\n",  o_left, o_right);
            o_ready <= 1'b0;
            repeat(4) @(posedge clk);
            o_ready <= 1'b1;
            outlet_count += 2;
        end
    end