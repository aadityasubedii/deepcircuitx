    initial begin
        $display("test agc()");
        @(posedge ck);
        @(posedge ck);
        @(posedge ck);

        
        mic_0 <= 24'h100000;
        mic_1 <= 24'h010000;
        mic_2 <= 24'h001000;
        mic_3 <= 24'h000100;
        go();
        wait(done);
        @(posedge ck);

        
        mic_0 <= 24'h000001;
        mic_1 <= 24'h000000;
        mic_2 <= 24'h000000;
        mic_3 <= 24'h000000;
        @(posedge ck);
        go();
        wait(done);
        tb_assert(level == 22);

        mic_0 <= 24'h000000;
        mic_1 <= 24'h000001;
        mic_2 <= 24'h000000;
        mic_3 <= 24'h000000;
        @(posedge ck);
        go();
        wait(done);
        tb_assert(level == 22);

        mic_0 <= 24'h000000;
        mic_1 <= 24'h000000;
        mic_2 <= 24'h000001;
        mic_3 <= 24'h000000;
        @(posedge ck);
        go();
        wait(done);
        tb_assert(level == 22);

        mic_0 <= 24'h000000;
        mic_1 <= 24'h000000;
        mic_2 <= 24'h000000;
        mic_3 <= 24'h000001;
        @(posedge ck);
        go();
        wait(done);
        tb_assert(level == 22);

        
        mic_0 <= 24'h000000;
        mic_1 <= 24'h000000;
        mic_2 <= 24'h400000;
        mic_3 <= 24'h000000;
        for (i = 0; i < 24; i++) begin
            @(posedge ck);
            go();
            wait(done);
            @(posedge ck);
            tb_assert(level == i);
            mic_2 <= mic_2 >> 1;
        end

        
        mic_0 <= 24'h000000;
        mic_1 <= 24'h000000;
        mic_2 <= 24'hbfffff;
        mic_3 <= 24'h000000;
        for (i = 0; i < 22; i++) begin
            @(posedge ck);
            go();
            wait(done);
            @(posedge ck);
            tb_assert(level == i);
            mic_2 <= { 1'b1, mic_2[23:1] };
        end

        
        mic_0 <= 24'h000000;
        mic_1 <= 24'hfff000;
        mic_2 <= 24'h000000;
        mic_3 <= 24'h000000;
        @(posedge ck);
        go();
        wait(done);
        tb_assert(level == 10);

        mic_0 <= 24'h000000;
        mic_1 <= 24'h000fff;
        mic_2 <= 24'h000000;
        mic_3 <= 24'h000000;
        @(posedge ck);
        go();
        wait(done);
        tb_assert(level == 11);

        @(posedge ck);
        @(posedge ck);

        $finish;
    end