    always @(cke_in) begin
        if (rst_n_in) begin
            if ($time > TIH) begin
                if ($time - tm_ck_pos < TIH) 
                    $display ("%m: at time %t ERROR:  tIH violation on CKE by %t", $time, tm_ck_pos + TIH - $time);
            end
            if ($time - tm_cke < TIPW)
                $display ("%m: at time %t ERROR: tIPW violation on CKE by %t", $time, tm_cke + TIPW - $time);
        end
        tm_cke = $time;
    end