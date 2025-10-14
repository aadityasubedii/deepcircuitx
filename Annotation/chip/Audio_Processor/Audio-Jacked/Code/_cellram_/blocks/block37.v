    always @(adv_n_in or cre_in) begin
        if (!adv_n_in) begin
            async_cre <= cre_in;
            tm_async_cre <= $realtime;
        end
    end