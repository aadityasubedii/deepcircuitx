    initial begin
        reset = 1;
        i_valid = 0;
        o_ready = 1;
        i_audio = 0;
        repeat (2) @(posedge clk) reset = 1'b1;
        repeat (2) @(posedge clk) reset = 1'b0;

        out_data(16'h1000);
        out_data(16'h2000);
        out_data(16'h3000);
        out_data(16'h4000);

        out_data(16'h0001);
        out_data(16'h0002);
        out_data(16'h0003);
        out_data(16'h0004);

        out_data(16'h0005);
        out_data(16'h0006);
        out_data(16'h0007);
        out_data(16'h0008);

        repeat (16) @(posedge clk);

        $finish;
    end