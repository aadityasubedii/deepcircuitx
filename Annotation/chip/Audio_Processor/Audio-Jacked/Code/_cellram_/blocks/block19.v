    always @(by_n) begin
        if (!ce_n) begin
            if (adv_n_in) begin
                if ($realtime - tm_clk_pos < tHD) 
                    $display ("%t ERROR:   tHD violation on BY# by %t", $realtime, tm_clk_pos + tHD - $realtime);
            end
        end
        tm_by_n = $realtime;
        tm_tbw <= $realtime;
    end