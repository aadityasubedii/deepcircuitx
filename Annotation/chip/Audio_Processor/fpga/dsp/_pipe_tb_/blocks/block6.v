    initial begin
        $display("test pipe()");
        tb_assert(pt_out == 0);
        @(posedge ck);
        pt_in <= 1;
        tb_assert(pt_out == 0);

        for (pt_i = 0; pt_i < 4; pt_i = pt_i + 1) begin
            @(posedge ck);
            tb_assert(pt_out == 0);
        end
 
        for (pt_i = 0; pt_i < 4; pt_i = pt_i + 1) begin
            @(posedge ck);
            tb_assert(pt_out == 1);
        end
 
        pt_in <= 0;
        @(posedge ck);
        pt_in <= 1;

        @(posedge ck);
        tb_assert(pt_out == 1);
        @(posedge ck);
        tb_assert(pt_out == 1);
        @(posedge ck);
        tb_assert(pt_out == 1);
        @(posedge ck);
        tb_assert(pt_out == 0);
        @(posedge ck);
        tb_assert(pt_out == 1);
        @(posedge ck);
        tb_assert(pt_out == 1);
        @(posedge ck);
        tb_assert(pt_out == 1);

        pt_in <= 0;
        for (pt_i = 0; pt_i < 4; pt_i = pt_i + 1) begin
            @(posedge ck);
            tb_assert(pt_out == 1);
        end
        for (pt_i = 0; pt_i < 4; pt_i = pt_i + 1) begin
            @(posedge ck);
            tb_assert(pt_out == 0);
        end
    end