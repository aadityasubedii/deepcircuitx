    initial begin

        for (int i = 0; i < 5; i++) begin
            @(posedge ck);
        end

        data_y <= 16'h7fff;
        start <= 1;

        @(posedge ck);
        start <= 0;

        

    end