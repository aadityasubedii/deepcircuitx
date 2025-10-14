    task cmd_task;
        input cke;
        input [2:0] cmd;
        input [BA_BITS-1:0] bank;
        input [ADDR_BITS-1:0] addr;
        reg [`BANKS:0] i;
        integer j;
        reg [`BANKS:0] tfaw_cntr;
        reg [COL_BITS-1:0] col;
        reg group;
        begin
            
            if (!er_trfc_max && !in_self_refresh) begin
                if ($time - tm_refresh > TRFC_MAX && check_strict_timing) begin
                    $display ("%m: at time %t ERROR:  tRFC maximum violation during %s", $time, cmd_string[cmd]);
                    er_trfc_max = 1;
                end
            end
            if (cke) begin
                if ((cmd < NOP) && (cmd != PRECHARGE)) begin
                    if (($time - tm_txpr < TXPR) || (ck_cntr - ck_txpr < TXPR_TCK))
                        $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[cmd]);
                    for (j=0; j<=SELF_REF; j=j+1) begin
                        chk_err(SAME_BANK , bank, j, cmd);
                        chk_err(DIFF_BANK , bank, j, cmd);
                        chk_err(DIFF_GROUP, bank, j, cmd);
                    end
                end
                case (cmd)
                    LOAD_MODE : begin
                        if (|odt_pipeline)
                            $display ("%m: at time %t ERROR: ODTL violation during %s", $time, cmd_string[cmd]);
                        if (odt_state)
                            $display ("%m: at time %t ERROR: ODT must be off prior to %s", $time, cmd_string[cmd]);

                        if (|active_bank) begin
                            $display ("%m: at time %t ERROR: %s Failure.  All banks must be Precharged.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s %d", $time, cmd_string[cmd], bank);
                            if (bank>>2) begin
                                $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved bank bits must be programmed to zero", $time, cmd_string[cmd], bank);
                            end
                            case (bank)
                                0 : begin
                                    
                                    if (addr[1:0] == 2'b00) begin
                                        burst_length = 8;
                                        blotf = 0;
                                        truebl4 = 0;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = %d", $time, cmd_string[cmd], bank, burst_length);
                                    end else if (addr[1:0] == 2'b01) begin
                                        burst_length = 8;
                                        blotf = 1;
                                        truebl4 = 0;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = Select via A12", $time, cmd_string[cmd], bank);
                                    end else if (addr[1:0] == 2'b10) begin
                                        burst_length = 4;
                                        blotf = 0;
                                        truebl4 = 0;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = Fixed %d (chop)", $time, cmd_string[cmd], bank, burst_length);
                                    end else if (feature_truebl4 && (addr[1:0] == 2'b11)) begin
                                        burst_length = 4;
                                        blotf = 0;
                                        truebl4 = 1;
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Length = True %d", $time, cmd_string[cmd], bank, burst_length);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Burst Length = %d", $time, cmd_string[cmd], bank, addr[1:0]);
                                    end
                                    
                                    burst_order = addr[3];
                                    if (!burst_order) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Order = Sequential", $time, cmd_string[cmd], bank);
                                    end else if (burst_order) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Burst Order = Interleaved", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Burst Order = %d", $time, cmd_string[cmd], bank, burst_order);
                                    end
                                    
                                    cas_latency = {addr[2],addr[6:4]} + 4;
                                    set_latency;
                                    if ((cas_latency >= CL_MIN) && (cas_latency <= CL_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d CAS Latency = %d", $time, cmd_string[cmd], bank, cas_latency);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal CAS Latency = %d", $time, cmd_string[cmd], bank, cas_latency);
                                    end
                                    
                                    if (addr[7] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    
                                    dll_reset = addr[8];
                                    if (!dll_reset) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Reset = Normal", $time, cmd_string[cmd], bank);
                                    end else if (dll_reset) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Reset = Reset DLL", $time, cmd_string[cmd], bank);
                                        dll_locked = 0;
                                        init_dll_reset = 1;
                                        ck_dll_reset <= ck_cntr;
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal DLL Reset = %d", $time, cmd_string[cmd], bank, dll_reset);
                                    end

								   
								   if (addr[11:9] == 0) begin
									  write_recovery  = 16;
								   end else if (addr[11:9] < 4) begin
									  write_recovery  = addr[11:9] + 4;
								   end else begin
									  write_recovery  = 2*addr[11:9];
								   end

                                    if ((write_recovery >= WR_MIN) && (write_recovery <= WR_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Write Recovery = %d", $time, cmd_string[cmd], bank, write_recovery);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Write Recovery = %d", $time, cmd_string[cmd], bank, write_recovery);
                                    end
                                    
                                    low_power = !addr[12];
                                    if (!low_power) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Power Down Mode = DLL on", $time, cmd_string[cmd], bank);
                                    end else if (low_power) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Power Down Mode = DLL off", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Power Down Mode = %d", $time, cmd_string[cmd], bank, low_power);
                                    end
                                    
                                    if (ADDR_BITS>13 && addr[13] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                                1 : begin
                                    
                                    dll_en = !addr[0];
                                    if (!dll_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Enable = Disabled", $time, cmd_string[cmd], bank);
                                        if (check_strict_mrbits) $display ("%m: at time %t WARNING: %s %d DLL off mode is not modeled", $time, cmd_string[cmd], bank);
                                    end else if (dll_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d DLL Enable = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal DLL Enable = %d", $time, cmd_string[cmd], bank, dll_en);
                                    end
                                    
                                    if ({addr[5], addr[1]} == 2'b00) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Output Drive Strength = %d Ohm", $time, cmd_string[cmd], bank, RZQ/6);
                                    end else if ({addr[5], addr[1]} == 2'b01) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Output Drive Strength = %d Ohm", $time, cmd_string[cmd], bank, RZQ/7);
                                    end else if ({addr[5], addr[1]} == 2'b11) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Output Drive Strength = %d Ohm", $time, cmd_string[cmd], bank, RZQ/5);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Output Drive Strength = %d", $time, cmd_string[cmd], bank, {addr[5], addr[1]});
                                    end
                                    
                                    odt_rtt_nom = {addr[9], addr[6], addr[2]};
                                    if (odt_rtt_nom == 3'b000) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d ODT Rtt = Disabled", $time, cmd_string[cmd], bank);
                                        odt_en = 0;
                                    end else if ((odt_rtt_nom < 4) || ((!addr[7] || (addr[7] && addr[12])) && (odt_rtt_nom < 6))) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d ODT Rtt = %d Ohm", $time, cmd_string[cmd], bank, get_rtt_nom(odt_rtt_nom));
                                        odt_en = 1;
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal ODT Rtt = %d", $time, cmd_string[cmd], bank, odt_rtt_nom);
                                        odt_en = 0;
                                    end
                                    
                                    al = addr[4:3];
                                    set_latency;
                                    if (al == 0) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Additive Latency = %d", $time, cmd_string[cmd], bank, al);
                                    end else if ((al >= AL_MIN) && (al <= AL_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Additive Latency = CL - %d", $time, cmd_string[cmd], bank, al);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Additive Latency = %d", $time, cmd_string[cmd], bank, al);
                                    end
                                    
                                    write_levelization = addr[7];
                                    if (!write_levelization) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Write Levelization = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (write_levelization) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Write Levelization = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Write Levelization = %d", $time, cmd_string[cmd], bank, write_levelization);
                                    end
                                    
                                    if (addr[8] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    
                                    if (addr[10] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    
                                    tdqs_en = addr[11];
                                    if (!tdqs_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d TDQS Enable = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (tdqs_en) begin
                                        if (8 == DQ_BITS) begin
										    if (DEBUG) $display ("%m: at time %t INFO: %s %d TDQS Enable = Enabled", $time, cmd_string[cmd], bank);
                                        end
									    else begin
                                            $display ("%m: at time %t WARNING: %s %d Illegal TDQS Enable.  TDQS only exists on a x8 part", $time, cmd_string[cmd], bank);
                                            tdqs_en = 0;
										end   
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal TDQS Enable = %d", $time, cmd_string[cmd], bank, tdqs_en);
                                    end 
                                    
                                    out_en = !addr[12];
                                    if (!out_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Qoff = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (out_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Qoff = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Qoff = %d", $time, cmd_string[cmd], bank, out_en);
                                    end 
                                    
                                    if (ADDR_BITS>13 && addr[13] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                                2 : begin
								    if (feature_pasr) begin
                                        
                                        pasr = addr[2:0];
                                        case (pasr)
                                            3'b000 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0-7", $time, cmd_string[cmd], bank);
                                            3'b001 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0-3", $time, cmd_string[cmd], bank);
                                            3'b010 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0-1", $time, cmd_string[cmd], bank);
                                            3'b011 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 0", $time, cmd_string[cmd], bank);
                                            3'b100 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 2-7", $time, cmd_string[cmd], bank);
                                            3'b101 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 4-7", $time, cmd_string[cmd], bank);
                                            3'b110 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 6-7", $time, cmd_string[cmd], bank);
                                            3'b111 : if (DEBUG) $display ("%m: at time %t INFO: %s %d Partial Array Self Refresh = Bank 7", $time, cmd_string[cmd], bank);
                                            default : $display ("%m: at time %t ERROR: %s %d Illegal Partial Array Self Refresh = %d", $time, cmd_string[cmd], bank, pasr);
                                        endcase 
									end 
								    else
                                    if (addr[2:0] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    
                                    cas_write_latency = addr[5:3]+5;
                                    set_latency;
                                    if ((cas_write_latency >= CWL_MIN) && (cas_write_latency <= CWL_MAX)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d CAS Write Latency = %d", $time, cmd_string[cmd], bank, cas_write_latency);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal CAS Write Latency = %d", $time, cmd_string[cmd], bank, cas_write_latency);
                                    end
                                    
                                    asr = addr[6];
                                    if (!asr) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Auto Self Refresh = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (asr) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Auto Self Refresh = Enabled", $time, cmd_string[cmd], bank);
                                        if (check_strict_mrbits) $display ("%m: at time %t WARNING: %s %d Auto Self Refresh is not modeled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Auto Self Refresh = %d", $time, cmd_string[cmd], bank, asr);
                                    end 
                                    
                                    srt = addr[7];
                                    if (!srt) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Self Refresh Temperature = Normal", $time, cmd_string[cmd], bank);
                                    end else if (srt) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Self Refresh Temperature = Extended", $time, cmd_string[cmd], bank);
                                        if (check_strict_mrbits) $display ("%m: at time %t WARNING: %s %d Self Refresh Temperature is not modeled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Self Refresh Temperature = %d", $time, cmd_string[cmd], bank, srt);
                                    end 
                                    if (asr && srt)
                                        $display ("%m: at time %t ERROR: %s %d SRT must be set to 0 when ASR is enabled.", $time, cmd_string[cmd], bank);
                                    
                                    if (addr[8] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                    
                                    odt_rtt_wr = addr[10:9];
                                    if (odt_rtt_wr == 2'b00) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Dynamic ODT = Disabled", $time, cmd_string[cmd], bank);
                                        dyn_odt_en = 0;
                                    end else if ((odt_rtt_wr > 0) && (odt_rtt_wr < 3)) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d Dynamic ODT Rtt = %d Ohm", $time, cmd_string[cmd], bank, get_rtt_wr(odt_rtt_wr));
                                        dyn_odt_en = 1;
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal Dynamic ODT = %d", $time, cmd_string[cmd], bank, odt_rtt_wr);
                                        dyn_odt_en = 0;
                                    end
                                    
                                    if (ADDR_BITS>13 && addr[13:11] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                                3 : begin
                                    mpr_select = addr[1:0];
                                    
                                    if (mpr_select == 2'b00) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d MultiPurpose Register Select = Pre-defined pattern", $time, cmd_string[cmd], bank);
                                    end else begin
                                        if (check_strict_mrbits) $display ("%m: at time %t ERROR: %s %d Illegal MultiPurpose Register Select = %d", $time, cmd_string[cmd], bank, mpr_select);
                                    end
                                    
                                    mpr_en = addr[2];
                                    if (!mpr_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d MultiPurpose Register Enable = Disabled", $time, cmd_string[cmd], bank);
                                    end else if (mpr_en) begin
                                        if (DEBUG) $display ("%m: at time %t INFO: %s %d MultiPurpose Register Enable = Enabled", $time, cmd_string[cmd], bank);
                                    end else begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal MultiPurpose Register Enable = %d", $time, cmd_string[cmd], bank, mpr_en);
                                    end 
                                    
                                    if (ADDR_BITS>13 && addr[13:3] !== 0 && check_strict_mrbits) begin
                                        $display ("%m: at time %t ERROR: %s %d Illegal value.  Reserved address bits must be programmed to zero", $time, cmd_string[cmd], bank);
                                    end
                                end
                            endcase
                            if (dyn_odt_en && write_levelization)
                                $display ("%m: at time %t ERROR: Dynamic ODT is not available during Write Leveling mode.", $time);
                            init_mode_reg[bank] = 1;
                            mode_reg[bank] = addr;
                            tm_load_mode <= $time;
                            ck_load_mode <= ck_cntr;
                        end
                    end
                    REFRESH : begin
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (|active_bank) begin
                            $display ("%m: at time %t ERROR: %s Failure.  All banks must be Precharged.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s", $time, cmd_string[cmd]);
                            er_trfc_max = 0;
                            ref_cntr = ref_cntr + 1;
                            tm_refresh <= $time;
                            ck_refresh <= ck_cntr;
                        end
                    end
                    PRECHARGE : begin
                        if (addr[AP]) begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s All", $time, cmd_string[cmd]);
                        end
                        
                        
                        if (|active_bank) begin
                            if (($time - tm_txpr < TXPR) || (ck_cntr - ck_txpr < TXPR_TCK))
                                $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[cmd]);
                            if (mpr_en) begin
                                $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                                if (STOP_ON_ERROR) $stop(0);
                            end else begin
                                for (i=0; i<`BANKS; i=i+1) begin
                                    if (active_bank[i]) begin
                                        if (addr[AP] || (i == bank)) begin

                                            for (j=0; j<=SELF_REF; j=j+1) begin
                                                chk_err(SAME_BANK, i, j, cmd);
                                                chk_err(DIFF_BANK, i, j, cmd);
                                            end

                                            if (auto_precharge_bank[i]) begin
                                                $display ("%m: at time %t ERROR: %s Failure.  Auto Precharge is scheduled to bank %d.", $time, cmd_string[cmd], i);
                                                if (STOP_ON_ERROR) $stop(0);
                                            end else begin
                                                if (DEBUG) $display ("%m: at time %t INFO: %s bank %d", $time, cmd_string[cmd], i);
                                                active_bank[i] = 1'b0;
                                                tm_bank_precharge[i] <= $time;
                                                tm_precharge <= $time;
                                                ck_precharge <= ck_cntr;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    ACTIVATE : begin
                        tfaw_cntr = 0;
                        for (i=0; i<`BANKS; i=i+1) begin
                            if ($time - tm_bank_activate[i] < TFAW) begin
                                tfaw_cntr = tfaw_cntr + 1;
                            end
                        end
                        if (tfaw_cntr > 3) begin
                            $display ("%m: at time %t ERROR:  tFAW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                        end

                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Initialization sequence is not complete.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (active_bank[bank]) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Bank %d must be Precharged.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (addr >= 1<<ROW_BITS) begin
                                $display ("%m: at time %t WARNING: row = %h does not exist.  Maximum row = %h", $time, addr, (1<<ROW_BITS)-1);
                            end
                            if (DEBUG) $display ("%m: at time %t INFO: %s bank %d row %h", $time, cmd_string[cmd], bank, addr);
                            active_bank[bank] = 1'b1;
                            active_row[bank] = addr;
                            tm_group_activate[bank[1]] <= $time;
                            tm_activate <= $time;
                            tm_bank_activate[bank] <= $time;
                            ck_group_activate[bank[1]] <= ck_cntr;
                            ck_activate <= ck_cntr;
                        end
                    end
                    WRITE : begin
                        if ((!rd_bc && blotf) || (burst_length == 4)) begin 
                            if (truebl4) begin
                                if (ck_cntr - ck_group_read[bank[1]] < read_latency + TCCD/2 + 2 - write_latency)
                                    $display ("%m: at time %t ERROR:  tRTW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                                if (ck_cntr - ck_read < read_latency + TCCD_DG/2 + 2 - write_latency)
                                    $display ("%m: at time %t ERROR:  tRTW_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);
                            end else begin
                                if (ck_cntr - ck_read < read_latency + TCCD/2 + 2 - write_latency)
                                    $display ("%m: at time %t ERROR:  tRTW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                            end
                        end else begin 
                            if (ck_cntr - ck_read < read_latency + TCCD + 2 - write_latency)
                                $display ("%m: at time %t ERROR:  tRTW violation during %s to bank %d", $time, cmd_string[cmd], bank);
                        end

                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Initialization sequence is not complete.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!active_bank[bank])  begin
                            if (check_strict_timing) $display ("%m: at time %t ERROR: %s Failure.  Bank %d must be Activated.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (auto_precharge_bank[bank]) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Auto Precharge is scheduled to bank %d.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (ck_cntr - ck_write < burst_length/2) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Illegal burst interruption.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (addr[AP]) begin
                                auto_precharge_bank[bank] = 1'b1;
                                write_precharge_bank[bank] = 1'b1;
                            end
                            col = {addr[BC-1:AP+1], addr[AP-1:0]}; 
                            if (col >= 1<<COL_BITS) begin
                                $display ("%m: at time %t WARNING: col = %h does not exist.  Maximum col = %h", $time, col, (1<<COL_BITS)-1);
                            end
                            if ((!addr[BC] && blotf) || (burst_length == 4)) begin 
                                col = col & -4;
                            end else begin 
                                col = col & -8;
                            end
                            if (DEBUG) $display ("%m: at time %t INFO: %s bank %d col %h, auto precharge %d", $time, cmd_string[cmd], bank, col, addr[AP]);
                            wr_pipeline[2*write_latency + 1]  = 1;
                            ba_pipeline[2*write_latency + 1]  = bank;
                            row_pipeline[2*write_latency + 1] = active_row[bank];
                            col_pipeline[2*write_latency + 1] = col;
                            if ((!addr[BC] && blotf) || (burst_length == 4)) begin 
                                bl_pipeline[2*write_latency + 1] = 4;
                                if (mpr_en && col%4) begin
                                    $display ("%m: at time %t WARNING: col[1:0] must be set to 2'b00 during a BL4 Multipurpose Register read", $time);
                                end
                            end else begin 
                                bl_pipeline[2*write_latency + 1] = 8;
                                if (odt_in) begin
                                    ck_odth8 <= ck_cntr;
                                end
                            end
                            for (j=0; j<(burst_length + 4); j=j+1) begin
                                dyn_odt_pipeline[2*(write_latency - 2) + j] = 1'b1; 
                            end
                            ck_bank_write[bank] <= ck_cntr;
                            ck_group_write[bank[1]] <= ck_cntr;
                            ck_write <= ck_cntr;
                        end
                    end
                    READ : begin
                        if (!dll_locked)
                            $display ("%m: at time %t WARNING: tDLLK violation during %s.", $time, cmd_string[cmd]);
                        if (mpr_en && (addr[1:0] != 2'b00)) begin
                            $display ("%m: at time %t ERROR: %s Failure.  addr[1:0] must be zero during Multipurpose Register Read.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Initialization sequence is not complete.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!active_bank[bank] && !mpr_en) begin
                            if (check_strict_timing) $display ("%m: at time %t ERROR: %s Failure.  Bank %d must be Activated.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (auto_precharge_bank[bank]) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Auto Precharge is scheduled to bank %d.", $time, cmd_string[cmd], bank);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (ck_cntr - ck_read < burst_length/2) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Illegal burst interruption.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (addr[AP] && !mpr_en) begin
                                auto_precharge_bank[bank] = 1'b1;
                                read_precharge_bank[bank] = 1'b1;
                            end
                            col = {addr[BC-1:AP+1], addr[AP-1:0]}; 
                            if (col >= 1<<COL_BITS) begin
                                $display ("%m: at time %t WARNING: col = %h does not exist.  Maximum col = %h", $time, col, (1<<COL_BITS)-1);
                            end
                            if (DEBUG) $display ("%m: at time %t INFO: %s bank %d col %h, auto precharge %d", $time, cmd_string[cmd], bank, col, addr[AP]);
                            rd_pipeline[2*read_latency - 1]  = 1;
                            ba_pipeline[2*read_latency - 1]  = bank;
                            row_pipeline[2*read_latency - 1] = active_row[bank];
                            col_pipeline[2*read_latency - 1] = col;
                            if ((!addr[BC] && blotf) || (burst_length == 4)) begin 
                                bl_pipeline[2*read_latency - 1] = 4;
                                if (mpr_en && col%4) begin
                                    $display ("%m: at time %t WARNING: col[1:0] must be set to 2'b00 during a BL4 Multipurpose Register read", $time);
                                end
                            end else begin 
                                bl_pipeline[2*read_latency - 1] = 8;
                                if (mpr_en && col%8) begin
                                    $display ("%m: at time %t WARNING: col[2:0] must be set to 3'b000 during a BL8 Multipurpose Register read", $time);
                                end
                            end
                            rd_bc = addr[BC];
                            ck_bank_read[bank] <= ck_cntr;
                            ck_group_read[bank[1]] <= ck_cntr;
                            ck_read <= ck_cntr;
                        end
                    end
                    ZQ : begin
                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: %s Failure.  Multipurpose Register must be disabled.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (|active_bank) begin
                            $display ("%m: at time %t ERROR: %s Failure.  All banks must be Precharged.", $time, cmd_string[cmd]);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: %s long = %d", $time, cmd_string[cmd], addr[AP]);
                            if (addr[AP]) begin
                                zq_set = 1;
                                if (init_done) begin
                                    ck_zqoper <= ck_cntr;
                                end else begin
                                    ck_zqinit <= ck_cntr;
                                end
                            end else begin
                                ck_zqcs <= ck_cntr;
                            end
                        end
                    end
                    NOP: begin
                        if (in_power_down) begin
                            if (($time - tm_freq_change < TCKSRX) || (ck_cntr - ck_freq_change < TCKSRX_TCK))
                                $display ("%m: at time %t ERROR: tCKSRX violation during Power Down Exit", $time);
                            if ($time - tm_cke_cmd > TPD_MAX)
                                $display ("%m: at time %t ERROR: tPD maximum violation during Power Down Exit", $time);
                            if (DEBUG) $display ("%m: at time %t INFO: Power Down Exit", $time);
                            in_power_down = 0;
                            if ((active_bank == 0) && low_power) begin 
                                if (ck_cntr - ck_odt < write_latency - 1)
                                    $display ("%m: at time %t WARNING: tANPD violation during Power Down Exit.  Synchronous or asynchronous change in termination resistance is possible.", $time);
                                tm_slow_exit_pd <= $time;
                                ck_slow_exit_pd <= ck_cntr;
                            end
                            tm_power_down <= $time;
                            ck_power_down <= ck_cntr;
                        end
                        if (in_self_refresh) begin
                            if (($time - tm_freq_change < TCKSRX) || (ck_cntr - ck_freq_change < TCKSRX_TCK))
                                $display ("%m: at time %t ERROR: tCKSRX violation during Self Refresh Exit", $time);
                            if (ck_cntr - ck_cke_cmd < TCKESR_TCK)
                                $display ("%m: at time %t ERROR: tCKESR violation during Self Refresh Exit", $time);
                            if ($time - tm_cke < TISXR)
                                $display ("%m: at time %t ERROR: tISXR violation during Self Refresh Exit", $time);
                            if (DEBUG) $display ("%m: at time %t INFO: Self Refresh Exit", $time);
                            in_self_refresh = 0;
                            ck_dll_reset <= ck_cntr;
                            ck_self_refresh <= ck_cntr;
                            tm_self_refresh <= $time;
                            tm_refresh <= $time;
                        end
                    end
                endcase
                if ((prev_cke !== 1) && (cmd !== NOP)) begin
                    $display ("%m: at time %t ERROR: NOP or Deselect is required when CKE goes active.", $time);
                end

                if (!init_done) begin
                    case (init_step)
                        0 : begin
                            if ($time - tm_rst_n < 500000000 && check_strict_timing) 
                                $display ("%m at time %t WARNING: 500 us is required after RST_N goes inactive before CKE goes active.", $time);
                            tm_txpr <= $time;
                            ck_txpr <= ck_cntr;
                            init_step = init_step + 1;
                        end
                        1 : if (dll_en) init_step = init_step + 1;
                        2 : begin
                            if (&init_mode_reg && init_dll_reset && zq_set) begin
                                if (DEBUG) $display ("%m: at time %t INFO: Initialization Sequence is complete", $time);
                                init_done = 1;
                            end
                        end
                    endcase
                end
            end else if (prev_cke) begin
                if ((!init_done) && (init_step > 1)) begin
                    $display ("%m: at time %t ERROR: CKE must remain active until the initialization sequence is complete.", $time);
                    if (STOP_ON_ERROR) $stop(0);
                end
                case (cmd)
                    REFRESH : begin
                        if ($time - tm_txpr < TXPR)
                            $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[SELF_REF]);
                        for (j=0; j<=SELF_REF; j=j+1) begin
                            chk_err(DIFF_BANK, bank, j, SELF_REF);
                        end

                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  Multipurpose Register must be disabled.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (|active_bank) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  All banks must be Precharged.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (odt_state) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  ODT must be off prior to entering Self Refresh", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: Self Refresh Failure.  Initialization sequence is not complete.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) $display ("%m: at time %t INFO: Self Refresh Enter", $time);
						    if (feature_pasr)
                                
                                case (pasr)
                                    3'b000 : ;
                                    3'b001 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 4-7 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'hF0); end
                                    3'b010 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 2-7 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'hFC); end
                                    3'b011 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 1-7 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'hFE); end
                                    3'b100 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-1 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h03); end
                                    3'b101 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-3 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h0F); end
                                    3'b110 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-5 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h3F); end
                                    3'b111 : begin if (DEBUG) $display("%m: at time %t INFO: Banks 0-6 will be lost due to Partial Array Self Refresh", $time); erase_banks(8'h7F); end
							    endcase
                            in_self_refresh = 1;
                            dll_locked = 0;
                        end
                    end
                    NOP : begin
                        
                        if (low_power && (active_bank == 0) && |odt_pipeline)
                            $display ("%m: at time %t WARNING: tANPD violation during %s.   Synchronous or asynchronous change in termination resistance is possible.", $time, cmd_string[PWR_DOWN]);
                        if ($time - tm_txpr < TXPR)
                            $display ("%m: at time %t ERROR:  tXPR violation during %s", $time, cmd_string[PWR_DOWN]);
                        for (j=0; j<=SELF_REF; j=j+1) begin
                            chk_err(DIFF_BANK, bank, j, PWR_DOWN);
                        end

                        if (mpr_en) begin
                            $display ("%m: at time %t ERROR: Power Down Failure.  Multipurpose Register must be disabled.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else if (!init_done) begin
                            $display ("%m: at time %t ERROR: Power Down Failure.  Initialization sequence is not complete.", $time);
                            if (STOP_ON_ERROR) $stop(0);
                        end else begin
                            if (DEBUG) begin
                                if (|active_bank) begin
                                    $display ("%m: at time %t INFO: Active Power Down Enter", $time);
                                end else begin
                                    $display ("%m: at time %t INFO: Precharge Power Down Enter", $time);
                                end
                            end
                            in_power_down = 1;
                        end
                    end
                    default : begin
                        $display ("%m: at time %t ERROR: NOP, Deselect, or Refresh is required when CKE goes inactive.", $time);
                    end
                endcase
            end else if (in_self_refresh || in_power_down) begin
                if ((ck_cntr - ck_cke_cmd <= TCPDED) && (cmd !== NOP))
                    $display ("%m: at time %t ERROR: tCPDED violation during Power Down or Self Refresh Entry.  NOP or Deselect is required.", $time);
            end
            prev_cke  = cke;

        end
    endtask    