    always @(posedge ck) begin
        if (!rst) begin
            gpio_reg <= 0;
        end else begin
            if (we)
                gpio_reg <= iomem_wdata;
            if (re)
                iomem_rdata <= gpio_reg;
        end
    end