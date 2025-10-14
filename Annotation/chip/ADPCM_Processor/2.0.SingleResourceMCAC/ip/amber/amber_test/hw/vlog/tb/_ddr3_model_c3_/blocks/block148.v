    task dm_timing_check;
    input i;
    reg [3:0] i;
    begin
        if (dqs_in_valid) begin
            if ($time - tm_dqs[i] < TDH) 
                $display ("%m: at time %t ERROR:   tDH violation on DM bit %d by %t", $time, i, tm_dqs[i] + TDH - $time);
            if (check_dm_tdipw[i]) begin
                if ($time - tm_dm[i] < TDIPW)
                    $display ("%m: at time %t ERROR: tDIPW violation on DM bit %d by %t", $time, i, tm_dm[i] + TDIPW - $time);
            end
        end
        check_dm_tdipw[i] <= 1'b0;
        tm_dm[i] = $time;
    end
    endtask