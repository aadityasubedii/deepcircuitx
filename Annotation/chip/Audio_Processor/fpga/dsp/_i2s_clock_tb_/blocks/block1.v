    initial begin

        $display("start i2s tests");

        wait(!rst);

        
        wait(ws);
        wait(!ws);
        wait(ws);
        wait(!ws);

        
        ext_rst <= 1;
        for (i = 0; i < 30; i = i + 1) begin
            @(posedge sck);
        end

        
        ext_rst <= 0;
        tb_assert(!external);

        
        for (i = 0; i < 6; i = i + 1) begin
            wait(ws);
            wait(!ws);
        end

        tb_assert(external);

        
        for (i = 0; i < 6; i = i + 1) begin
            wait(ws);
            wait(!ws);
        end

        
        ext_rst <= 1;

        
        wait(ws);
        wait(!ws);
        wait(ws);
        wait(!ws);

        tb_assert(!external);

        $display("done");
        $finish;
    end