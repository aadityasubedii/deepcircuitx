    always @(negedge clk_in) begin
        if ($realtime > tCLK) begin
            if ($realtime - tm_clk_pos < tKP)
                $display ("%t ERROR:   tKP minimum violation on CLK by %t", $realtime, tm_clk_pos + tKP - $realtime);
        end
        tm_clk_neg = $realtime - 0.0001;  
    end