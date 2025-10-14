    initial begin
        @(posedge ck);
        @(posedge ck);

        shift_by <= 3'b000;
        shift_in <= 24'h123456;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 8)));

        shift_by <= 3'b001;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 7)));

        shift_by <= 3'b010;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 6)));

        shift_by <= 3'b011;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 5)));

        shift_by <= 3'b100;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 4)));

        shift_by <= 3'b101;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 3)));

        shift_by <= 3'b110;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 2)));

        shift_by <= 3'b111;
        @(posedge ck);
        tb_assert(shift_out == (16'hffff & (shift_in >> 1)));

    end