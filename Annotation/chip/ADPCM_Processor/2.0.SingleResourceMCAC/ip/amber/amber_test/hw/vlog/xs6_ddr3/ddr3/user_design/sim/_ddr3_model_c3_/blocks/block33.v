    task dqs_neg_timing_check;
    input i;
    reg [4:0] i;
    reg [3:0] j;
    begin
        if (write_levelization && i<16) begin
            if (ck_cntr - ck_load_mode < TWLDQSEN)
                $display ("%m: at time %t ERROR: tWLDQSEN violation on DQS bit %d.", $time, i);
            if ($time - tm_dqs_pos[i] < $rtoi(TDQSH*tck_avg))
                $display ("%m: at time %t ERROR: tDQSH violation on DQS bit %d by %t", $time, i, tm_dqs_pos[i] + TDQSH*tck_avg - $time);
        end
        if (dqs_in_valid && (wdqs_pos_cntr[i] > 0) && check_write_dqs_high[i]) begin
            if (dqs_in[i] ^ prev_dqs_in[i]) begin
                if (dll_locked) begin
                    if ($time - tm_dqs_pos[i] < $rtoi(TDQSH*tck_avg))
                        $display ("%m: at time %t ERROR: tDQSH violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    if ($time - tm_ck_pos < $rtoi(TDSH*tck_avg))
                        $display ("%m: at time %t ERROR: tDSH violation on %s bit %d", $time, dqs_string[i/16], i%16); 
                end
                if ($time - tm_dm[i%16] < TDS) 
                    $display ("%m: at time %t ERROR: tDS violation on DM bit %d by %t", $time, i,  tm_dm[i%16] + TDS - $time);
                if (!dq_out_en) begin
                    for (j=0; j<`DQ_PER_DQS; j=j+1) begin
                        if ($time - tm_dq[(i%16)*`DQ_PER_DQS+j] < TDS) 
                            $display ("%m: at time %t ERROR: tDS violation on DQ bit %d by %t", $time, i*`DQ_PER_DQS+j, tm_dq[(i%16)*`DQ_PER_DQS+j] + TDS - $time);
                        check_dq_tdipw[(i%16)*`DQ_PER_DQS+j] <= 1'b1;
                    end
                end
                check_dm_tdipw[i%16] <= 1'b1;
                tm_dqs[i%16] <= $time;
            end else begin
                $display ("%m: at time %t ERROR: Invalid latching edge on %s bit %d", $time, dqs_string[i/16], i%16);
            end
        end
        check_write_dqs_high[i] <= 1'b0;
        tm_dqs_neg[i] = $time;
        prev_dqs_in[i] <= dqs_in[i];
    end
    endtask