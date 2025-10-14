    always @(adv_n_in) begin
        if (!ce_n) begin
            if ($realtime - tm_clk_pos < tHD) 
                $display ("%t ERROR:   tHD violation on ADV# by %t", $realtime, tm_clk_pos + tHD - $realtime);
            if (adv_n_in) begin
                if (!sync_access) begin
                    if ($realtime - tm_ce_n < tCVS)
                        $display ("%t ERROR:  tCVS violation on CE# by %t", $realtime, tm_ce_n + tCVS - $realtime);
                    if ($realtime - tm_adv_n < tVP)
                        $display ("%t ERROR:   tVP violation on ADV# by %t", $realtime, tm_adv_n + tVP - $realtime);
                    if ($realtime - tm_cre < tAVS)
                        $display ("%t ERROR:  tAVS violation on CRE by %t", $realtime, tm_cre + tAVS - $realtime);
                    if ($realtime - tm_addr < tAVS)
                        $display ("%t ERROR:  tAVS violation on ADDR by %t", $realtime, tm_addr + tAVS - $realtime);
                end
                if (!sync_access | initial_latency) begin
                    if ($realtime - tm_cre < tAVH)
                        $display ("%t ERROR:  tAVH violation on CRE by %t", $realtime, tm_cre + tAVH - $realtime);
                    if ($realtime - tm_addr < tAVH)
                        $display ("%t ERROR:  tAVH violation on ADDR by %t", $realtime, tm_addr + tAVH - $realtime);
                end
            end else begin
                if ($realtime - tm_adv_n < tVPH)
                    $display ("%t ERROR:   tVPH violation on ADV# by %t", $realtime, tm_adv_n + tVPH - $realtime);
            end
        end
        if (adv_n_in) begin
            tm_adv_n_pos = $realtime;
        end else begin
            tm_adv_n_neg <= $realtime;
        end
        tm_adv_n = $realtime;
    end