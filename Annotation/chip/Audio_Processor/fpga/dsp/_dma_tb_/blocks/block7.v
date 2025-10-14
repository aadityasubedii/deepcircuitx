    always @(posedge wb_clk) begin
        if (dma_cyc) begin
            dma_ack <= 1;
        end
        if (dma_ack) begin
            dma_ack <= 0;
        end
    end