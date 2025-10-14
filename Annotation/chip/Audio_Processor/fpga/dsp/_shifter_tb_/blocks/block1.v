    initial begin
        @(posedge ck);
        @(posedge ck);

        in <= 40'h00abcd1234;
        en <= 1;

        for (i = 0; i < 24; i = i + 1) begin

            shift <= i;
            @(posedge ck);
            @(posedge ck);
            tb_assert(out == ((in >> shift) & 16'hFFFF));
            
        end

    end