    always @(ce_n) begin
        if (!ce_n) begin
            if (DEBUG[0]) 
                $display("===============================================================");
            wait_out <= wait_polarity;
        end else begin
            if (!rbc && (sync_latency_cntr > 0)) begin
                memory_write(sync_addr, {BY_BITS{1'b0}}, {DQ_BITS{1'bx}});
                $display ("%t ERROR: Data at address 'h%h has been corrupted because CE# was deasserted prior to the first data transfer.", $realtime, sync_addr);
            end
            last_ce <= 1'b1;
            sync_latency_cntr <= 0;
            random_delay <= 0;
            row_count <= 0;
            rbc <= 0;
        end

        
        if (!last_ce_n && ce_n) begin
            if (!deep_power_down_n) begin 
                if (DEBUG[0]) 
                    $display ("%t  INFO: Async - Deep Power Down Entry", $realtime);
                memory_used = 0;
            end
            if (deep_power_down_exit) begin
                if ($realtime - tm_tdpdx < tDPDX)
                    $display ("%t ERROR: tDPDX violation on CE# by %t", $realtime, tm_tdpdx + tDPDX - $realtime);
                deep_power_down_exit <= 1'b0;
                tm_power_up <= $realtime;
            end
        end else if (last_ce_n && !ce_n) begin
            
            
            if ((GENERATION > CR10) && !deep_power_down_n) begin
                register_write(RCR, ref_conf_register | 16'h0010, 1'b0);
            end
        end
    end