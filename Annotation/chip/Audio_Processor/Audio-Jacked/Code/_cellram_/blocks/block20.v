    always @(we_n or ce2wi) begin
        if (!sync_access && !we_n && ce2wi) begin
            if ($realtime - tm_adv_n_neg < tAS)
                $display ("%t ERROR:   tAS violation on ADV# by %t", $realtime, tm_adv_n_neg + tAS - $realtime);
            if ($realtime - tm_async_addr < tAS)
                $display ("%t ERROR:   tAS violation on ADDR by %t", $realtime, tm_async_addr + tAS - $realtime);
        end
    end