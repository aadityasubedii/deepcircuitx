    initial begin

        
        i_valid <= 1'b0;
        reset = 1'b1;
        repeat(2) @(posedge clk);

        reset = 1'b0;
        repeat(2) @(posedge clk);

        
        intake(1'b1, 32'h00010000);
        intake(1'b0, 32'h1fed1fed);

        intake(1'b1, 32'h2eef2eef);
        intake(1'b0, 32'h33333333);

        intake(1'b1, 32'h12345678);
        intake(1'b0, 32'h1fed1fed);

        intake(1'b1, 32'h99911223);
        intake(1'b0, 32'hABCDEF01);

        intake(1'b1, 32'h55555555);
        intake(1'b0, 32'h44444444);

        @(posedge clk);
        i_valid <= 1'b0;

        wait (intake_count != outlet_count) @(posedge clk);

        repeat(32) @(posedge clk);

        $finish();

    end