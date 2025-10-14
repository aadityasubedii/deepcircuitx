    initial begin

        @(posedge ck);
        wait(!rst);
        @(posedge ck);

        p1_in <= 1;
        @(posedge ck);
        tb_assert(p1_out == 0);

        @(posedge ck);
        tb_assert(p1_out == 1);

        @(posedge ck);
        tb_assert(p1_out == 1);

        p1_in <= 0;
        @(posedge ck);
        tb_assert(p1_out == 1);

        @(posedge ck);
        tb_assert(p1_out == 0);

    end