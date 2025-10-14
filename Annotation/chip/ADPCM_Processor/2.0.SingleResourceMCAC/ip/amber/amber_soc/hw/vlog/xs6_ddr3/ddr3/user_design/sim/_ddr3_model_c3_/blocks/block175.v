    always @(posedge rst_n_in) begin
        if ($time > 100000) begin
            if (tm_rst_n + 100000 > $time)
                $display ("%m: at time %t ERROR: RST_N pulse width violation by %t", $time, tm_rst_n + 100000 - $time);
        end
        tm_rst_n = $time;
    end