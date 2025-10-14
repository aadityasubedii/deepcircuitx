    always @(we_n) begin
        if (!ce_n) begin
            if (!adv_n_in) begin
                if ($realtime - tm_clk_pos < tHD) 
                    $display ("%t ERROR:   tHD violation on WE# by %t", $realtime, tm_clk_pos + tHD - $realtime);
            end
            if (!sync_access) begin
                if (!we_n) begin
                    if ($realtime - tm_we_n < tWPH)
                        $display ("%t ERROR:   tWPH violation on WE# by %t", $realtime, tm_we_n + tWPH - $realtime);
                end
            end
        end
        tm_we_n <= $realtime;
    end