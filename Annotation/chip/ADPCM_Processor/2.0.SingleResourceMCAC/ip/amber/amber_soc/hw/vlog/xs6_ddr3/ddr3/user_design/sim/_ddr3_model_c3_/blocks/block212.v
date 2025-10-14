    task data_task;
        reg [BA_BITS-1:0] bank;
        reg [ROW_BITS-1:0] row;
        reg [COL_BITS-1:0] col;
        integer i;
        integer j;
        begin

            if (diff_ck) begin
                for (i=0; i<32; i=i+1) begin
                    if (dq_in_valid && dll_locked && ($time - tm_dqs_neg[i] < $rtoi(TDSS*tck_avg)))
                        $display ("%m: at time %t ERROR: tDSS violation on %s bit %d", $time, dqs_string[i/16], i%16);
                    if (check_write_dqs_high[i])
                        $display ("%m: at time %t ERROR: %s bit %d latching edge required during the preceding clock period.", $time, dqs_string[i/16], i%16);
                end
                check_write_dqs_high <= 0;
            end else begin
                for (i=0; i<32; i=i+1) begin
                    if (dll_locked && dq_in_valid) begin
                        tm_tdqss = abs_value(1.0*tm_ck_pos - tm_dqss_pos[i]);
                        if ((tm_tdqss < tck_avg/2.0) && (tm_tdqss > TDQSS*tck_avg))
                            $display ("%m: at time %t ERROR: tDQSS violation on %s bit %d", $time, dqs_string[i/16], i%16); 
                    end
                    if (check_write_dqs_low[i])
                        $display ("%m: at time %t ERROR: %s bit %d latching edge required during the preceding clock period", $time, dqs_string[i/16], i%16);
                end
                check_write_preamble <= 0;
                check_write_postamble <= 0;
                check_write_dqs_low <= 0;
            end

            if (wr_pipeline[0] || rd_pipeline[0]) begin
                bank = ba_pipeline[0];
                row = row_pipeline[0];
                col = col_pipeline[0];
                burst_cntr = 0;
                memory_read(bank, row, col, memory_data);
            end

            
            if (burst_cntr < burst_length) begin
                burst_position = col ^ burst_cntr;
                if (!burst_order) begin
                    burst_position[BO_BITS-1:0] = col + burst_cntr;
                end
                burst_cntr = burst_cntr + 1;
            end

            
            if (wr_pipeline[WDQS_PRE + 1]) begin
                wdqs_cntr = WDQS_PRE + bl_pipeline[WDQS_PRE + 1] + WDQS_PST - 1;
            end
            
            if ((wr_pipeline[2]) && (wdq_cntr == 0)) begin 
                check_write_preamble <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
            end
            if (wdqs_cntr > 1) begin  
                if ((wdqs_cntr - WDQS_PST)%2) begin
                    check_write_dqs_high <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
                end else begin
                    check_write_dqs_low <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
                end
            end
            if (wdqs_cntr == WDQS_PST) begin 
                check_write_postamble <= ({DQS_BITS{1'b1}}<<16) | {DQS_BITS{1'b1}};
            end 
            if (wdqs_cntr > 0) begin
                wdqs_cntr = wdqs_cntr - 1;
            end

            
            if (dq_in_valid) begin 
                bit_mask = 0;
                if (diff_ck) begin
                    for (i=0; i<DM_BITS; i=i+1) begin
                        bit_mask = bit_mask | ({`DQ_PER_DQS{~dm_in_neg[i]}}<<(burst_position*DQ_BITS + i*`DQ_PER_DQS));
                    end
                    memory_data = (dq_in_neg<<(burst_position*DQ_BITS) & bit_mask) | (memory_data & ~bit_mask);
                end else begin
                    for (i=0; i<DM_BITS; i=i+1) begin
                        bit_mask = bit_mask | ({`DQ_PER_DQS{~dm_in_pos[i]}}<<(burst_position*DQ_BITS + i*`DQ_PER_DQS));
                    end
                    memory_data = (dq_in_pos<<(burst_position*DQ_BITS) & bit_mask) | (memory_data & ~bit_mask);
                end
                dq_temp = memory_data>>(burst_position*DQ_BITS);
                if (DEBUG) $display ("%m: at time %t INFO: WRITE @ DQS= bank = %h row = %h col = %h data = %h",$time, bank, row, (-1*BL_MAX & col) + burst_position, dq_temp);
                if (burst_cntr%BL_MIN == 0) begin
                    memory_write(bank, row, col, memory_data);
                end
            end
            if (wr_pipeline[1]) begin
                wdq_cntr = bl_pipeline[1];
            end
            if (wdq_cntr > 0) begin
                wdq_cntr = wdq_cntr - 1;
                dq_in_valid = 1'b1;
            end else begin
                dq_in_valid = 1'b0;
                dqs_in_valid <= 1'b0;
                for (i=0; i<31; i=i+1) begin
                    wdqs_pos_cntr[i]    <= 0;
                end
            end
            if (wr_pipeline[0]) begin
                b2b_write <= 1'b0;
            end
            if (wr_pipeline[2]) begin
                if (dqs_in_valid) begin
                    b2b_write <= 1'b1;
                end
                dqs_in_valid <= 1'b1;
                wr_burst_length = bl_pipeline[2];
            end

            
            if (rd_pipeline[RDQSEN_PRE]) begin
                rdqsen_cntr = RDQSEN_PRE + bl_pipeline[RDQSEN_PRE] + RDQSEN_PST - 1;
            end
            if (rdqsen_cntr > 0) begin
                rdqsen_cntr = rdqsen_cntr - 1;
                dqs_out_en = 1'b1;
            end else begin
                dqs_out_en = 1'b0;
            end
            
            
            if (rd_pipeline[RDQS_PRE]) begin
                rdqs_cntr = RDQS_PRE + bl_pipeline[RDQS_PRE] + RDQS_PST - 1;
            end
            
            if (((rd_pipeline>>1 & {RDQS_PRE{1'b1}}) > 0) && (rdq_cntr == 0)) begin 
                dqs_out = 1'b0;
            end else if (rdqs_cntr > RDQS_PST) begin 
                dqs_out = rdqs_cntr - RDQS_PST;
            end else if (rdqs_cntr > 0) begin 
                dqs_out = 1'b0;
            end else begin
                dqs_out = 1'b1;
            end
            if (rdqs_cntr > 0) begin
                rdqs_cntr = rdqs_cntr - 1;
            end

            
            if (rd_pipeline[RDQEN_PRE]) begin
                rdqen_cntr = RDQEN_PRE + bl_pipeline[RDQEN_PRE] + RDQEN_PST;
            end
            if (rdqen_cntr > 0) begin
                rdqen_cntr = rdqen_cntr - 1;
                dq_out_en = 1'b1;
            end else begin
                dq_out_en = 1'b0;
            end
            
            if (rd_pipeline[0]) begin
                rdq_cntr = bl_pipeline[0];
            end
            if (rdq_cntr > 0) begin 
                if (mpr_en) begin
`ifdef MPR_DQ0 
                    if (mpr_select == 2'b00) begin 
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS-1{1'b0}}, calibration_pattern[burst_position]}};
                    end else if (odts_readout && (mpr_select == 2'b11)) begin 
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS-1{1'b0}}, temp_sensor[burst_position]}};
                    end else begin 
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS-1{1'b0}}, 1'bx}};
                    end
`else 
                    if (mpr_select == 2'b00) begin 
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS{calibration_pattern[burst_position]}}}};
                    end else if (odts_readout && (mpr_select == 2'b11)) begin 
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS{temp_sensor[burst_position]}}}};
                    end else begin 
                        dq_temp = {DQS_BITS{{`DQ_PER_DQS{1'bx}}}};
                    end
`endif				   
                    if (DEBUG) $display ("%m: at time %t READ @ DQS MultiPurpose Register %d, col = %d,  data = %b", $time, mpr_select, burst_position, dq_temp[0]);
                end else begin
                    dq_temp = memory_data>>(burst_position*DQ_BITS);
                    if (DEBUG) $display ("%m: at time %t INFO: READ @ DQS= bank = %h row = %h col = %h data = %h",$time, bank, row, (-1*BL_MAX & col) + burst_position, dq_temp);
                end
                dq_out = dq_temp;
                rdq_cntr = rdq_cntr - 1;
            end else begin
                dq_out = {DQ_BITS{1'b1}};
            end

            
            if (RANDOM_OUT_DELAY && (dqs_out_en || (|dqs_out_en_dly) || dq_out_en || (|dq_out_en_dly))) begin
                for (i=0; i<DQS_BITS; i=i+1) begin
                    
                    
                    
                    
                    dqsck_max = TDQSCK;
                    if (dqsck_max > dqsck[i] + TQH*tck_avg + TDQSQ) begin
                        dqsck_max = dqsck[i] + TQH*tck_avg + TDQSQ;
                    end
                    dqsck_min = -1*TDQSCK;
                    if (dqsck_min < dqsck[i] - TQH*tck_avg - TDQSQ) begin
                        dqsck_min = dqsck[i] - TQH*tck_avg - TDQSQ;
                    end

                    
                    
                    
                    
                    dqsq_min = 0;
                    if (dqsq_min < dqsck[i] - TQH*tck_avg) begin
                        dqsq_min = dqsck[i] - TQH*tck_avg;
                    end
                    if (dqsck_min == dqsck_max) begin
                        dqsck[i] = dqsck_min;
                    end else begin
                        dqsck[i] = $dist_uniform(seed, dqsck_min, dqsck_max);
                    end
                    dqsq_max = TDQSQ + dqsck[i];

                    dqs_out_en_dly[i] <= #(tck_avg/2) dqs_out_en;
                    dqs_out_dly[i]    <= #(tck_avg/2 + dqsck[i]) dqs_out;
                    if (!write_levelization) begin
                        for (j=0; j<`DQ_PER_DQS; j=j+1) begin
                            dq_out_en_dly[i*`DQ_PER_DQS + j] <= #(tck_avg/2) dq_out_en;
                            if (dqsq_min == dqsq_max) begin
                                dq_out_dly   [i*`DQ_PER_DQS + j] <= #(tck_avg/2 + dqsq_min) dq_out[i*`DQ_PER_DQS + j];
                            end else begin
                                dq_out_dly   [i*`DQ_PER_DQS + j] <= #(tck_avg/2 + $dist_uniform(seed, dqsq_min, dqsq_max)) dq_out[i*`DQ_PER_DQS + j];
                            end
                        end
                    end
                end
            end else begin
                out_delay = tck_avg/2;
                dqs_out_en_dly <= #(out_delay) {DQS_BITS{dqs_out_en}};
                dqs_out_dly    <= #(out_delay) {DQS_BITS{dqs_out   }};
                if (write_levelization !== 1'b1) begin
                    dq_out_en_dly  <= #(out_delay) {DQ_BITS {dq_out_en }};
                    dq_out_dly     <= #(out_delay) {DQ_BITS {dq_out    }};
                end
            end
        end
    endtask