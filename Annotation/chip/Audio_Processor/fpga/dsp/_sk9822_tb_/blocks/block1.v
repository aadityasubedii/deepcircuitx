    initial begin
        $display("start");

        wait(!wb_rst);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);

        for (i = 0; i < 16; i = i + 1) begin
            write(ADDR+(i*4), i + (i << 8) + (i << 16));
            wait(ack);
            wait(!ack);
            @(posedge wb_clk);
        end

        $display("done");
        
    end