    initial begin
        $display("test spl()");
        @(posedge ck);

        peak_en = 0;
        decay_en = 0;
        in <= 16'h4000;
        @(posedge ck);

        tb_assert(out == 0);

        peak_en <= 1;
        @(posedge ck);
        peak_en <= 0;
        @(posedge ck);
        tb_assert(out == 16'h4000);

        
        decay_en = 1;
        @(posedge ck);
        @(posedge ck);
        tb_assert(out == 16'h3fff);
        @(posedge ck);
        tb_assert(out == 16'h3ffe);
        @(posedge ck);
        tb_assert(out == 16'h3ffd);
        @(posedge ck);
        tb_assert(out == 16'h3ffc);

        wait(out == 16'h0002);
        decay_en = 0;
        @(posedge ck);
        @(posedge ck);
        @(posedge ck);
        @(posedge ck);
        tb_assert(out == 16'h0002);
        @(posedge ck);
        decay_en = 1;
        @(posedge ck);
        tb_assert(out == 16'h0001);
        @(posedge ck);
        tb_assert(out == 16'h0000);
        @(posedge ck);
        tb_assert(out == 16'h0000);
        @(posedge ck);
        tb_assert(out == 16'h0000);

        decay_en = 0;
        in <= 0;
        @(posedge ck);
        @(posedge ck);
        peak_en <= 1;

        
        for (i = 0; i < 16'h8000; i = i + 10) begin
            in <= i;
            @(posedge ck);
            @(posedge ck);
            @(posedge ck);
            tb_assert(out == i);
        end

        in <= 0;
        peak_en <= 0;

        
        rst <= 1;
        @(posedge ck);
        @(posedge ck);
        tb_assert(out == 0);
        rst <= 0;
        @(posedge ck);
        @(posedge ck);

        
        in <= 0;
        @(posedge ck);
        @(posedge ck);
        peak_en <= 1;

        for (i = 0; i < 16'h8000; i = i + 10) begin
            
            in <= 1 + ~i;
            @(posedge ck);
            @(posedge ck);
            @(posedge ck);
            tb_assert(out == i);

            in <= i;
            @(posedge ck);
            @(posedge ck);
            @(posedge ck);
            tb_assert(out == i);

        end

        @(posedge ck);
        @(posedge ck);
        @(posedge ck);
        $finish;
    end
