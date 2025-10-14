    always @(dq_in) begin
        if (!sync_access) begin
            if ($realtime - tm_write_end < tDH) 
                $display ("%t ERROR:  tDH violation on DQ by %t", $realtime, tm_write_end + tDH - $realtime);
        end
        tm_dq_tdw <= $realtime;
    end