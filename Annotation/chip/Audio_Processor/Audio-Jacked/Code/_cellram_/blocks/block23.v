    always @(ce_n) begin
        if ($realtime > tCLK) begin
            if ($realtime - tm_clk_pos < tHD) 
                $display ("%t ERROR:   tHD violation on CE# by %t", $realtime, tm_clk_pos + tHD - $realtime);
        end
        if (!ce_n) begin
            if (last_access) begin
                if ($realtime - tm_ce_n < tCBPH)
                    $display ("%t ERROR: tCBPH violation on CE# by %t", $realtime, tm_ce_n + tCBPH - $realtime);
            end else begin
                if ($realtime - tm_ce_n < tCPH)
                    $display ("%t ERROR:  tCPH violation on CE# by %t", $realtime, tm_ce_n + tCPH - $realtime);
                if ($realtime - tm_write_end < tWR)
                    $display ("%t ERROR:   tWR violation on CE# by %t", $realtime, tm_write_end + tWR - $realtime);
            end
            if ($realtime - tm_power_up < tPU)
                $display ("%t  WARN:   tPU violation on CE# by %t", $realtime, tm_power_up + tPU - $realtime);
        end
        tm_ce_n = $realtime;
        tm_tcw  <= $realtime;
        tm_tdpd <= $realtime;
    end