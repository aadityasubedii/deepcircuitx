    task test_level(input [39:0] in, input [5:0] result);

        begin
            level_in <= in;
            @(posedge ck);
            @(posedge ck);
            
            tb_assert(level_out == result);
        end

    endtask