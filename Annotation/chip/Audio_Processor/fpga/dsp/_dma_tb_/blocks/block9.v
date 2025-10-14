    task xfer_pulse;

        begin

            xfer_block <= 1;
            @(posedge wb_clk);
            xfer_block <= 0;
            @(posedge wb_clk);

        end

    endtask