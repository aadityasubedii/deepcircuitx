    initial begin

        $display("start i2s 32-bit rx tests");

        wait(!rst);
        @(posedge ck);

        send_32(16'hface, 16'h1234);
        wait(frame == 18);
        tb_assert(left_32 == 16'hface);
        wait(frame == 2);
        tb_assert(right_32 == 16'h1234);

        send_32(16'hffff, 16'h0000);
        wait(frame == 18);
        tb_assert(left_32 == 16'hffff);
        wait(frame == 2);
        tb_assert(right_32 == 16'h0000);

        send_32(16'h0000, 16'hffff);
        wait(frame == 18);
        tb_assert(left_32 == 16'h0000);
        wait(frame == 2);
        tb_assert(right_32 == 16'hffff);

        send_32(16'haaaa, 16'h5555);
        wait(frame == 18);
        tb_assert(left_32 == 16'haaaa);
        wait(frame == 2);
        tb_assert(right_32 == 16'h5555);
    end