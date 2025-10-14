    task dqs_pos_timing_check;
    input i;
    reg [4:0] i;
    reg [3:0] j;
    begin
        if (write_levelization && i<16) begin
            if (ck_cntr - ck_load_mode < TWLMRD) 
                $display ("%m: at time %t ERROR: tWLMRD violation on DQS bit %d positive edge.", $time, i);
            if (($time - tm_ck_pos < TWLS) || ($time - tm_ck_neg < TWLS))
                $display ("%m: at time %t WARNING: tWLS violation on DQS bit %d positive edge.  Indeterminate CK capture is possible.", $time, i);
            if (DEBUG) 
                $display ("%m: at time %t Write Leveling @ DQS ck = %b", $time, diff_ck);
            dq_out_en_dly[i*`DQ_PER_DQS] <= #(TWLO) 1'b1;
            dq_out_dly[i*`DQ_PER_DQS] <= #(TWLO) diff_ck;
            for (j=1; j<`DQ_PER_DQS; j=j+1) begin
                dq_out_en_dly[i*`DQ_PER_DQS+j] <= #(TWLO + TWLOE) 1'b1;
                dq_out_dly[i*`DQ_PER_DQS+j] <= #(TWLO + TWLOE) 1'b0;
            end
        end
        if (dqs_in_valid && ((wdqs_pos_cntr[i] < wr_burst_length/2) || b2b_write)) begin
            if (dqs_in[i] ^ prev_dqs_in[i]) begin
                if (dll_locked) begin
                    if (check_write_preamble[i]) begin
                        if ($time - tm_dqs_pos[i] < $rtoi(TWPRE*tck_avg))
                            $display ("%m: at time %t ERROR: tWPRE violation on &s bit %d", $time, dqs_string[i/16], i%16);
                    end else if (check_write_postamble[i]) begin
                        if ($time - tm_dqs_neg[i] < $rtoi(TWPST*tck_avg))
                            $display ("%m: at time %t ERROR: tWPST violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    end else begin
                        if ($time - tm_dqs_neg[i] < $rtoi(TDQSL*tck_avg))
                            $display ("%m: at time %t ERROR: tDQSL violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    end
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
                if ((wdqs_pos_cntr[i] < wr_burst_length/2) && !b2b_write) begin
                    wdqs_pos_cntr[i] <= wdqs_pos_cntr[i] + 1;
                end else begin
                    wdqs_pos_cntr[i] <= 1;
                end
                check_dm_tdipw[i%16] <= 1'b1;
                check_write_preamble[i] <= 1'b0;
                check_write_postamble[i] <= 1'b0;
                check_write_dqs_low[i] <= 1'b0;
                tm_dqs[i%16] <= $time;
            end else begin
                $display ("%m: at time %t ERROR: Invalid latching edge on %s bit %d", $time, dqs_string[i/16], i%16);
            end
        end
        tm_dqss_pos[i] <= $time;
        tm_dqs_pos[i] = $time;
        prev_dqs_in[i] <= dqs_in[i];
    end
    endtask