    always @(adv_n_in or addr[ADDR_BITS-1:4]) begin
        if (!adv_n_in) begin
            tm_upper_addr <= $realtime;
        end
    end