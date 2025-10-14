    always @(adv_n_in or addr) begin
        if (!adv_n_in) begin
            async_addr <= addr;
            tm_async_addr <= $realtime;
        end
    end