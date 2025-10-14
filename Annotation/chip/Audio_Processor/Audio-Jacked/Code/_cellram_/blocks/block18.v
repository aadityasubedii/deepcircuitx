    always @(cre_in) begin
        if (!ce_n | tavh_check) begin
            if (!adv_n_in) begin
                if ($realtime - tm_clk_pos < tHD) 
                    $display ("%t ERROR:   tHD violation on CRE by %t", $realtime, tm_clk_pos + tHD - $realtime);
            end
            if (!sync_access | initial_latency) begin
                if ($realtime - tm_adv_n_pos < tAVH) 
                    $display ("%t ERROR:  tAVH violation on CRE by %t", $realtime, tm_adv_n_pos + tAVH - $realtime);
            end
        end
        tm_cre = $realtime;
    end