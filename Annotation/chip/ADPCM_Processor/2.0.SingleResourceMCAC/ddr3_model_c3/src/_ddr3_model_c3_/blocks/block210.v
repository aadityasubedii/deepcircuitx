    always @(negedge rst_n_in or posedge diff_ck or negedge diff_ck) begin : main
        integer i;
        if (!rst_n_in) begin
            reset_task;
        end else begin
            if (!in_self_refresh && (diff_ck !== 1'b0) && (diff_ck !== 1'b1))
                $display ("%m: at time %t ERROR: CK and CK_N are not allowed to go to an unknown state.", $time);
            data_task;

            
            
            
            if (in_self_refresh || (in_power_down && (active_bank == 0))) begin
                if (diff_ck) begin
                    tjit_per_rtime = $time - tm_ck_pos - tck_avg;
                end else begin
                    tjit_per_rtime = $time - tm_ck_neg - tck_avg;
                end
                if (dll_locked && (abs_value(tjit_per_rtime) > TJIT_PER)) begin
                    if ((tm_ck_pos - tm_cke_cmd < TCKSRE) || (ck_cntr - ck_cke_cmd < TCKSRE_TCK))
                        $display ("%m: at time %t ERROR: tCKSRE violation during Self Refresh or Precharge Power Down Entry", $time);
                    if (odt_state) begin
                        $display ("%m: at time %t ERROR: Clock Frequency Change Failure.  ODT must be off prior to Clock Frequency Change.", $time);
                        if (STOP_ON_ERROR) $stop(0);
                    end else begin
                        if (DEBUG) $display ("%m: at time %t INFO: Clock Frequency Change detected.  DLL Reset is Required.", $time);
                        tm_freq_change <= $time;
                        ck_freq_change <= ck_cntr;
                        dll_locked = 0;
                    end
                end
            end

            if (diff_ck) begin
                
                if ($time > TIS) begin
                    if ($time - tm_cke < TIS) 
                        $display ("%m: at time %t ERROR:   tIS violation on CKE by %t", $time, tm_cke + TIS - $time);
                    if (cke_in) begin
                        for (i=0; i<22; i=i+1) begin
                            if ($time - tm_cmd_addr[i] < TIS) 
                                $display ("%m: at time %t ERROR:   tIS violation on %s by %t", $time, cmd_addr_string[i], tm_cmd_addr[i] + TIS - $time);
                        end
                    end
                end

                
                if (dll_locked) begin
                    if (mr_chk == 0) begin
                        mr_chk = 1;
                    end else if (init_mode_reg[0] && (mr_chk == 1)) begin
                        
                        if (cas_latency*tck_avg < CL_TIME && check_strict_timing)
                            $display ("%m: at time %t ERROR: CAS Latency = %d is illegal @tCK(avg) = %f", $time, cas_latency, tck_avg);
                        
                        if (ceil(write_recovery*tck_avg) < TWR)
                            $display ("%m: at time %t ERROR: Write Recovery = %d is illegal @tCK(avg) = %f", $time, write_recovery, tck_avg);
                        
					    if (check_strict_timing) begin 
                            case (cas_write_latency)
                                5 : if (tck_avg < 2500.0)                          $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                6 : if ((tck_avg < 1875.0) || (tck_avg >= 2500.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                7 : if ((tck_avg < 1500.0) || (tck_avg >= 1875.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                8 : if ((tck_avg < 1250.0) || (tck_avg >= 1500.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                9 : if ((tck_avg < 15e3/14) || (tck_avg >= 1250.0)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                10: if ((tck_avg < 937.5) || (tck_avg >= 15e3/14)) $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                                default :                                          $display ("%m: at time %t ERROR: CWL = %d is illegal @tCK(avg) = %f", $time, cas_write_latency, tck_avg);
                            endcase
                            
                            if (!valid_cl(cas_latency, cas_write_latency))
                                $display ("%m: at time %t ERROR: CAS Latency = %d is not valid when CAS Write Latency = %d", $time, cas_latency, cas_write_latency);
                        end
                        mr_chk = 2;
                    end
                end else if (!in_self_refresh) begin
                    mr_chk = 0;
                    if (ck_cntr - ck_dll_reset == TDLLK) begin
                        dll_locked = 1;
                    end
                end

                if (|auto_precharge_bank) begin
                    for (i=0; i<`BANKS; i=i+1) begin
                        
                        
                        
                        if (write_precharge_bank[i]) begin
                            if ($time - tm_bank_activate[i] >= TRAS_MIN) begin
                                if (ck_cntr - ck_bank_write[i] >= write_latency + burst_length/2 + write_recovery) begin
                                    if (DEBUG) $display ("%m: at time %t INFO: Auto Precharge bank %d", $time, i);
                                    write_precharge_bank[i] = 0;
                                    active_bank[i] = 0;
                                    auto_precharge_bank[i] = 0;
                                    tm_bank_precharge[i] = $time;
                                    tm_precharge = $time;
                                    ck_precharge = ck_cntr;
                                end
                            end
                        end
                        
                        
                        
                        
                        if (read_precharge_bank[i]) begin
                            if (($time - tm_bank_activate[i] >= TRAS_MIN) && (ck_cntr - ck_bank_read[i] >= additive_latency + TRTP_TCK)) begin
                                read_precharge_bank[i] = 0;
                                
                                
                                if ($time - tm_bank_read_end[i] < TRTP) begin
                                    if (DEBUG) $display ("%m: at time %t INFO: Auto Precharge bank %d", tm_bank_read_end[i] + TRTP, i);
                                    active_bank[i] <= #(tm_bank_read_end[i] + TRTP - $time) 0;
                                    auto_precharge_bank[i] <= #(tm_bank_read_end[i] + TRTP - $time) 0;
                                    tm_bank_precharge[i] <= #(tm_bank_read_end[i] + TRTP - $time) tm_bank_read_end[i] + TRTP;
                                    tm_precharge <= #(tm_bank_read_end[i] + TRTP - $time) tm_bank_read_end[i] + TRTP;
                                    ck_precharge = ck_cntr;
                                end else begin
                                    if (DEBUG) $display ("%m: at time %t INFO: Auto Precharge bank %d", $time, i);
                                    active_bank[i] = 0;
                                    auto_precharge_bank[i] = 0;
                                    tm_bank_precharge[i] = $time;
                                    tm_precharge = $time;
                                    ck_precharge = ck_cntr;
                                end
                            end
                        end
                    end
                end

                
                if (cke_in ^ prev_cke) begin
                    tm_cke_cmd <= $time;
                    ck_cke_cmd <= ck_cntr;
                end

                cmd_task(cke_in, cmd_n_in, ba_in, addr_in);
                if ((cmd_n_in == WRITE) || (cmd_n_in == READ)) begin
                    al_pipeline[2*additive_latency] = 1'b1;
                end
                if (al_pipeline[0]) begin
                    
                    if ((rd_pipeline[2*cas_latency - 1]) && ($time - tm_bank_activate[ba_pipeline[2*cas_latency - 1]] < TRCD))
                        $display ("%m: at time %t ERROR:  tRCD violation during %s", $time, cmd_string[READ]);
                    if ((wr_pipeline[2*cas_write_latency + 1]) && ($time - tm_bank_activate[ba_pipeline[2*cas_write_latency + 1]] < TRCD))
                        $display ("%m: at time %t ERROR:  tRCD violation during %s", $time, cmd_string[WRITE]);
                    
                    if (rd_pipeline[2*cas_latency - 1]) begin 
                        if (truebl4) begin 
                            i = ba_pipeline[2*cas_latency - 1];
                            if ($time - tm_group_write_end[i[1]] < TWTR)
                                $display ("%m: at time %t ERROR:  tWTR violation during %s", $time, cmd_string[READ]);
                            if ($time - tm_write_end < TWTR_DG)
                                $display ("%m: at time %t ERROR:  tWTR_DG violation during %s", $time, cmd_string[READ]);
                        end else begin
                            if ($time - tm_write_end < TWTR)
                                $display ("%m: at time %t ERROR:  tWTR violation during %s", $time, cmd_string[READ]);
                        end
                    end
                end
               if (rd_pipeline) begin
                  if (rd_pipeline[2*cas_latency - 1]) begin
                     tm_bank_read_end[ba_pipeline[2*cas_latency - 1]] <= $time;
                  end
	       end
                for (i=0; i<`BANKS; i=i+1) begin
		    if ((ck_cntr - ck_bank_write[i] > write_latency) && (ck_cntr - ck_bank_write[i] <= write_latency + burst_length/2)) begin
                        tm_bank_write_end[i] <= $time;
                        tm_group_write_end[i[1]] <= $time;
                        tm_write_end <= $time;
                    end
                end

                
                if (!in_self_refresh && tm_ck_pos ) begin
                    tjit_cc_time = $time - tm_ck_pos - tck_i;
                    tck_i   = $time - tm_ck_pos;
                    tck_avg = tck_avg - tck_sample[ck_cntr%TDLLK]/$itor(TDLLK);
                    tck_avg = tck_avg + tck_i/$itor(TDLLK);
                    tck_sample[ck_cntr%TDLLK] = tck_i;
                    tjit_per_rtime = tck_i - tck_avg;

                    if (dll_locked && check_strict_timing) begin
                        
                        terr_nper_rtime = 0;
                        for (i=0; i<12; i=i+1) begin
                            terr_nper_rtime = terr_nper_rtime + tck_sample[i] - tck_avg;
                            terr_nper_rtime = abs_value(terr_nper_rtime);
                            case (i)
                                      0 :;
                                      1 : if (terr_nper_rtime - TERR_2PER >= 1.0) $display ("%m: at time %t ERROR: tERR(2per) violation by %f ps.", $time, terr_nper_rtime - TERR_2PER);
                                      2 : if (terr_nper_rtime - TERR_3PER >= 1.0) $display ("%m: at time %t ERROR: tERR(3per) violation by %f ps.", $time, terr_nper_rtime - TERR_3PER);
                                      3 : if (terr_nper_rtime - TERR_4PER >= 1.0) $display ("%m: at time %t ERROR: tERR(4per) violation by %f ps.", $time, terr_nper_rtime - TERR_4PER);
                                      4 : if (terr_nper_rtime - TERR_5PER >= 1.0) $display ("%m: at time %t ERROR: tERR(5per) violation by %f ps.", $time, terr_nper_rtime - TERR_5PER);
                                      5 : if (terr_nper_rtime - TERR_6PER >= 1.0) $display ("%m: at time %t ERROR: tERR(6per) violation by %f ps.", $time, terr_nper_rtime - TERR_6PER);
                                      6 : if (terr_nper_rtime - TERR_7PER >= 1.0) $display ("%m: at time %t ERROR: tERR(7per) violation by %f ps.", $time, terr_nper_rtime - TERR_7PER);
                                      7 : if (terr_nper_rtime - TERR_8PER >= 1.0) $display ("%m: at time %t ERROR: tERR(8per) violation by %f ps.", $time, terr_nper_rtime - TERR_8PER);
                                      8 : if (terr_nper_rtime - TERR_9PER >= 1.0) $display ("%m: at time %t ERROR: tERR(9per) violation by %f ps.", $time, terr_nper_rtime - TERR_9PER);
                                      9 : if (terr_nper_rtime - TERR_10PER >= 1.0) $display ("%m: at time %t ERROR: tERR(10per) violation by %f ps.", $time, terr_nper_rtime - TERR_10PER);
                                     10 : if (terr_nper_rtime - TERR_11PER >= 1.0) $display ("%m: at time %t ERROR: tERR(11per) violation by %f ps.", $time, terr_nper_rtime - TERR_11PER);
                                     11 : if (terr_nper_rtime - TERR_12PER >= 1.0) $display ("%m: at time %t ERROR: tERR(12per) violation by %f ps.", $time, terr_nper_rtime - TERR_12PER);
                            endcase
                        end
					   
                        
                        if (abs_value(tjit_per_rtime) - TJIT_PER >= 1.0) 
                            $display ("%m: at time %t ERROR: tJIT(per) violation by %f ps.", $time, abs_value(tjit_per_rtime) - TJIT_PER);
                        if (abs_value(tjit_cc_time) - TJIT_CC >= 1.0) 
                            $display ("%m: at time %t ERROR: tJIT(cc) violation by %f ps.", $time, abs_value(tjit_cc_time) - TJIT_CC);
                        if (TCK_MIN - tck_avg >= 1.0)
                            $display ("%m: at time %t ERROR: tCK(avg) minimum violation by %f ps.", $time, TCK_MIN - tck_avg);
                        if (tck_avg - TCK_MAX >= 1.0) 
                            $display ("%m: at time %t ERROR: tCK(avg) maximum violation by %f ps.", $time, tck_avg - TCK_MAX);

                        
                        if (tm_ck_neg - $time < TCL_ABS_MIN*tck_avg) 
                            $display ("%m: at time %t ERROR: tCL(abs) minimum violation on CLK by %t", $time, TCL_ABS_MIN*tck_avg - tm_ck_neg + $time);
                        if (tcl_avg < TCL_AVG_MIN*tck_avg) 
                            $display ("%m: at time %t ERROR: tCL(avg) minimum violation on CLK by %t", $time, TCL_AVG_MIN*tck_avg - tcl_avg);
                        if (tcl_avg > TCL_AVG_MAX*tck_avg) 
                            $display ("%m: at time %t ERROR: tCL(avg) maximum violation on CLK by %t", $time, tcl_avg - TCL_AVG_MAX*tck_avg);
                    end

                    
                    tch_avg = tch_avg - tch_sample[ck_cntr%TDLLK]/$itor(TDLLK);
                    tch_avg = tch_avg + tch_i/$itor(TDLLK);
                    tch_sample[ck_cntr%TDLLK] = tch_i;
                    tjit_ch_rtime = tch_i - tch_avg;
                    duty_cycle = tch_avg/tck_avg;

                    
                    tcl_i <= $time - tm_ck_neg;
                end

                prev_odt <= odt_in;
                
                ck_cntr <= ck_cntr + 1;
                tm_ck_pos = $time;
            end else begin
                
                if (!in_self_refresh) begin
                    if (dll_locked && check_strict_timing) begin
                        if ($time - tm_ck_pos < TCH_ABS_MIN*tck_avg) 
                            $display ("%m: at time %t ERROR: tCH(abs) minimum violation on CLK by %t", $time, TCH_ABS_MIN*tck_avg - $time + tm_ck_pos);
                        if (tch_avg < TCH_AVG_MIN*tck_avg) 
                            $display ("%m: at time %t ERROR: tCH(avg) minimum violation on CLK by %t", $time, TCH_AVG_MIN*tck_avg - tch_avg);
                        if (tch_avg > TCH_AVG_MAX*tck_avg) 
                            $display ("%m: at time %t ERROR: tCH(avg) maximum violation on CLK by %t", $time, tch_avg - TCH_AVG_MAX*tck_avg);
                    end
				   
                    
                    tcl_avg = tcl_avg - tcl_sample[ck_cntr%TDLLK]/$itor(TDLLK);
                    tcl_avg = tcl_avg + tcl_i/$itor(TDLLK);
                    tcl_sample[ck_cntr%TDLLK] = tcl_i;

                    
                    tch_i <= $time - tm_ck_pos;
                end
                tm_ck_neg = $time;
            end

            
            if (odt_en || dyn_odt_en) begin
                
                if (!in_self_refresh && diff_ck) begin
                    if ($time - tm_odt < TIS)
                        $display ("%m: at time %t ERROR: tIS violation on ODT by %t", $time, tm_odt + TIS - $time);
                    if (prev_odt ^ odt_in) begin
                        if (!dll_locked)
                            $display ("%m: at time %t WARNING: tDLLK violation during ODT transition.", $time);
                        if (($time - tm_load_mode < TMOD) || (ck_cntr - ck_load_mode < TMOD_TCK))
                            $display ("%m: at time %t ERROR:  tMOD violation during ODT transition", $time);
                        if (ck_cntr - ck_zqinit < TZQINIT)
                            $display ("%m: at time %t ERROR: TZQinit violation during ODT transition", $time);
                        if (ck_cntr - ck_zqoper < TZQOPER)
                            $display ("%m: at time %t ERROR: TZQoper violation during ODT transition", $time);
                        if (ck_cntr - ck_zqcs < TZQCS)
                            $display ("%m: at time %t ERROR: tZQcs violation during ODT transition", $time);
                        
                        
                        if (ck_cntr - ck_self_refresh < TXSDLL)
                            $display ("%m: at time %t ERROR: tXSDLL violation during ODT transition", $time);
                        if (in_self_refresh)
                            $display ("%m: at time %t ERROR:  Illegal ODT transition during Self Refresh.", $time);
                        if (!odt_in && (ck_cntr - ck_odt < ODTH4))
                            $display ("%m: at time %t ERROR:  ODTH4 violation during ODT transition", $time);
                        if (!odt_in && (ck_cntr - ck_odth8 < ODTH8))
                            $display ("%m: at time %t ERROR:  ODTH8 violation during ODT transition", $time);
                        if (($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK))
                            $display ("%m: at time %t WARNING: tXPDLL during ODT transition.  Synchronous or asynchronous change in termination resistance is possible.", $time);

                        
                        
                        
                        
                        if ((in_power_down && low_power && (active_bank == 0)) || ($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK)) begin
                            odt_state = odt_in;
                            if (DEBUG && odt_en) $display ("%m: at time %t INFO: Async On Die Termination Rtt_NOM = %d Ohm", $time, {32{odt_state}} & get_rtt_nom(odt_rtt_nom));
                            if (odt_state) begin
                                odt_state_dly <= #(TAONPD) odt_state;
                            end else begin
                                odt_state_dly <= #(TAOFPD) odt_state;
                            end
                        
                        
                        
                        
                        end else begin
                            odt_pipeline[2*(write_latency - 2)] = 1'b1; 
                        end
                        ck_odt <= ck_cntr;
                    end
                end
                if (odt_pipeline[0]) begin
                    odt_state = ~odt_state;
                    if (DEBUG && odt_en) $display ("%m: at time %t INFO: Sync On Die Termination Rtt_NOM = %d Ohm", $time, {32{odt_state}} & get_rtt_nom(odt_rtt_nom));
                    if (odt_state) begin
                        odt_state_dly <= #(TAON) odt_state;
                    end else begin
                        odt_state_dly <= #(TAOF*tck_avg) odt_state;
                    end
                end
                if (rd_pipeline[RDQSEN_PRE]) begin
                    odt_cntr = 1 + RDQSEN_PRE + bl_pipeline[RDQSEN_PRE] + RDQSEN_PST - 1;
                end
                if (odt_cntr > 0) begin
                    if (odt_state) begin
                        $display ("%m: at time %t ERROR: On Die Termination must be OFF during Read data transfer.", $time);
                    end
                    odt_cntr = odt_cntr - 1;
                end
                if (dyn_odt_en && odt_state) begin
                    if (DEBUG && (dyn_odt_state ^ dyn_odt_pipeline[0]))
                        $display ("%m: at time %t INFO: Sync On Die Termination Rtt_WR = %d Ohm", $time, {32{dyn_odt_pipeline[0]}} & get_rtt_wr(odt_rtt_wr));
                    dyn_odt_state = dyn_odt_pipeline[0];
                end 
                dyn_odt_state_dly <= #(TADC*tck_avg) dyn_odt_state; 
            end

            if (cke_in && write_levelization) begin
                for (i=0; i<DQS_BITS; i=i+1) begin
                    if ($time - tm_dqs_pos[i] < TWLH)
                        $display ("%m: at time %t WARNING: tWLH violation on DQS bit %d positive edge.   Indeterminate CK capture is possible.", $time, i);
                end
            end

            
            if (|wr_pipeline || |rd_pipeline || |al_pipeline) begin
                al_pipeline = al_pipeline>>1;
                wr_pipeline = wr_pipeline>>1;
                rd_pipeline = rd_pipeline>>1;
                for (i=0; i<`MAX_PIPE; i=i+1) begin
                    bl_pipeline[i] = bl_pipeline[i+1];
                    ba_pipeline[i] = ba_pipeline[i+1];
                    row_pipeline[i] = row_pipeline[i+1];
                    col_pipeline[i] = col_pipeline[i+1];
                end
            end
            if (|odt_pipeline || |dyn_odt_pipeline) begin
                odt_pipeline = odt_pipeline>>1;
                dyn_odt_pipeline = dyn_odt_pipeline>>1;
            end
        end
    end