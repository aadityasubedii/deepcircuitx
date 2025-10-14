    task dq_timing_check;
    input i;
    reg [5:0] i;
    begin
        if (dqs_in_valid) begin
            if ($time - tm_dqs[i/`DQ_PER_DQS] < TDH) 
                $display ("%m: at time %t ERROR:   tDH violation on DQ bit %d by %t", $time, i, tm_dqs[i/`DQ_PER_DQS] + TDH - $time);
            if (check_dq_tdipw[i]) begin
                if ($time - tm_dq[i] < TDIPW)
                    $display ("%m: at time %t ERROR: tDIPW violation on DQ bit %d by %t", $time, i, tm_dq[i] + TDIPW - $time);
            end
        end
        check_dq_tdipw[i] <= 1'b0;
        tm_dq[i] = $time;
    end 
    endtask