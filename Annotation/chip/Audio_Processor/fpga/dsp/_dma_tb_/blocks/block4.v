    always @(posedge wb_clk) begin
        if (auto_poll) begin
            if (block_done) begin
                xfer_pulse();
            end
        end
    end