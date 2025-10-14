    initial begin

        $display("start i2s rx tests");

        wait(!rst);
        @(posedge ck);

        
        wait(frame_posn == 5);
        send(24'hf0f0f0, 24'hcafedb);

        wait(frame_posn == 0);
        tb_assert(left == 24'hf0f0f0);
        tb_assert(right == 24'hcafedb);
        tb_assert(left_16 == 24'hf0f0);
        tb_assert(right_16 == 24'hcafe);

        
        wait(frame_posn == 5);
        send(24'h123456, 24'hFFFFFF);

        wait(frame_posn == 0);
        tb_assert(left == 24'h123456);
        tb_assert(right == 24'hFFFFFF);
        tb_assert(left_16 == 24'h1234);
        tb_assert(right_16 == 24'hFFFF);

        
        wait(frame_posn == 5);
        send(24'h000000, 24'haaaaaa);

        wait(frame_posn == 0);
        tb_assert(left == 24'h000000);
        tb_assert(right == 24'haaaaaa);
        tb_assert(left_16 == 24'h0000);
        tb_assert(right_16 == 24'haaaa);

        
        wait(frame_posn == 5);
        send(24'h555555, 24'h123456);

        wait(frame_posn == 0);
        tb_assert(left == 24'h555555);
        tb_assert(right == 24'h123456);
        tb_assert(left_16 == 24'h5555);
        tb_assert(right_16 == 24'h1234);

        $display("done");
        $finish;
    end