    initial begin
        reset = 1;
        i_valid = 0;
        o_ready = 1;
        i_left = 0;
        i_right = 0;
        repeat (2) @(posedge clk) reset = 1'b1;
        repeat (2) @(posedge clk) reset = 1'b0;

        out_data(16'hC000, 16'h1100);
        out_data(16'h2000, 16'h2100);
        out_data(16'h3000, 16'h3100);
        out_data(16'h4000, 16'h4100);

        out_data(16'hE001, 16'h0101);
        out_data(16'h0002, 16'h0102);
        out_data(16'h0003, 16'h0103);
        out_data(16'h0004, 16'h0104);

        out_data(16'h0005, 16'h0105);
        out_data(16'h0006, 16'h0106);
        out_data(16'h0007, 16'h0107);
        out_data(16'h0008, 16'h0108);

        repeat (16) @(posedge clk);

        $finish;
    end