    always @(odt_in) begin
        if (rst_n_in && odt_en && !in_self_refresh) begin
            if ($time - tm_ck_pos < TIH) 
                $display ("%m: at time %t ERROR:  tIH violation on ODT by %t", $time, tm_ck_pos + TIH - $time);
            if ($time - tm_odt < TIPW)
                $display ("%m: at time %t ERROR: tIPW violation on ODT by %t", $time, tm_odt + TIPW - $time);
        end
        tm_odt = $time;
    end