    initial begin

        aligned_i_valid = 1'b0;

        aligned_i_left = 16'hcccc;
        aligned_i_right = 16'hdddd;

        repeat (2) @(posedge sclk) reset = 1'b1;
        repeat (20) @(posedge sclk) reset = 1'b0;

        out_data(16'hABCD, 16'h0123);
        out_data(16'h5555, 16'haaaa);
        out_data(16'h3456, 16'h9321);
        out_data(16'h6666, 16'h1111);

        repeat (32) @(posedge sclk);

        $finish();

    end