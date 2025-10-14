    initial begin

        $display("test highest_bit()");

        level_in <= 0;
        @(posedge ck);

        test_level(40'h0000000000, 0);
        test_level(40'h0000000001, 0);
        test_level(40'h0000000003, 1);
        test_level(40'h1000000001, 36);
        test_level(40'h2002222001, 37);
        test_level(40'h7002222001, 38);
        test_level(40'h7fffffffff, 38);

        for (ii = 0; ii < 39; ii = ii + 1) begin
            test_level(1 << ii, ii);
        end

        test_level(40'h8000000000, 38);
        test_level(40'hA000000000, 38);
        test_level(40'hA123456789, 38);
        test_level(40'hffffffffff, 0);
        test_level(40'hffffffffef, 4);
        test_level(40'hfeffffffef, 32);

    end