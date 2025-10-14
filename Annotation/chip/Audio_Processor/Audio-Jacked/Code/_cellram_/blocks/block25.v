    always @(posedge clk_in) begin
        if ($realtime > tCLK) begin
            if ($realtime - tm_ce_n < tCSP)
                $display ("%t ERROR:  tCSP violation on CE# by %t", $realtime, tm_ce_n + tCSP - $realtime);
            if (!ce_n) begin
                if ($realtime - tm_adv_n < tSP)
                    $display ("%t ERROR:   tSP violation on ADV# by %t", $realtime, tm_adv_n + tSP - $realtime);
                if (adv_n_in) begin
                    if ($realtime - tm_by_n < tSP)
                        $display ("%t ERROR:   tSP violation on BY# by %t", $realtime, tm_by_n + tSP - $realtime);
                end else begin
                    if ($realtime - tm_we_n < tSP)
                        $display ("%t ERROR:   tSP violation on WE# by %t", $realtime, tm_we_n + tSP - $realtime);
                    if ($realtime - tm_cre < tSP)
                        $display ("%t ERROR:   tSP violation on CRE by %t", $realtime, tm_cre + tSP - $realtime);
                    if ($realtime - tm_addr < tSP) 
                        $display ("%t ERROR:   tSP violation on ADDR by %t", $realtime, tm_addr + tSP - $realtime);
                end

                tm_clk_period = min_clk_period(initial_latency, latency_counter[2:0]);
                if (tm_clk_period == 0.0)
                    $display ("%t ERROR: Illegal latency counter = %h", $realtime, latency_counter);
                if ($realtime - tm_clk_pos < tm_clk_period)
                    $display ("%t ERROR: Clock Period must be >= %f while Latency Counter = %h.  Actual Clock Period = %f", $realtime, tm_clk_period, latency_counter, $realtime - tm_clk_pos);

                if ($realtime - tm_clk_pos < tCLK)
                    $display ("%t ERROR:  tCLK minimum violation on CLK by %t", $realtime, tm_clk_pos + tCLK - $realtime);
                if ($realtime - tm_clk_neg < tKP)
                    $display ("%t ERROR:   tKP minimum violation on CLK by %t", $realtime, tm_clk_neg + tKP - $realtime);
            end
        end
        tm_clk_pos = $realtime - 0.0001;  
    end