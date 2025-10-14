    always @(posedge clk_in) begin
        if (!operating_mode || Sync2AsyncConfig) begin 

            if (!ce_n) begin
                if (!adv_n_in) begin 
                    sync_addr = addr;
                    
                    sync_burst_length_override = (dq_in[DQ_BITS-2] && (GENERATION == CR20));
                    sync_cre = cre_in;
                    sync_we_n = we_n;

                    if (!rbc && (sync_latency_cntr > 0)) 
                        $display ("%t ERROR: Illegal burst interrupt.  Burst interrupt is illegal until after the first data word has been transferred.", $realtime);
                    last_access <= 1'b1;
                    last_ce <= 1'b0;
                    random_delay <= 0;
                    row_count <= 0;
                    rbc <= 0;

                    if (!sync_we_n) begin 
                        if (DEBUG[0]) begin
                            if (sync_cre) begin
                                $display ("%t  INFO:  Sync - Configuration Register Write", $realtime);
                            end else begin
                                $display ("%t  INFO:  Sync - Write", $realtime);
                            end
                        end
                    end else begin 
                        if (DEBUG[0]) begin
                            if (sync_cre) begin
                                $display ("%t  INFO:  Sync - Configuration Register Read", $realtime);
                            end else begin
                                $display ("%t  INFO:  Sync - Read", $realtime);
                            end
                        end
                        
                        if (!initial_latency && ($time - ref_collision >= tCEM)) begin
                            ref_collision <= $time;
                            random_delay = ($random % latency_counter);
                            if (DEBUG[0] && (random_delay > 0)) 
                                $display ("%t  INFO:  Sync - Read refresh collision of %d clocks has occurred.", $realtime, random_delay);
                        end
                    end
                    sync_latency_cntr = !sync_we_n + random_delay + latency_counter + 1;
                    sync_wait = wait_polarity;
                    sync_wait_q = wait_polarity;
                end

                if (!sync_we_n) begin
                    if ((!sync_cre) && (oe_n !== 1))
                        $display ("%t ERROR: Sync - OE# must be driven high during sync writes", $realtime);
                end else begin
                    if ((GENERATION > CR10) && (by_n !== {BY_BITS{1'b0}}))
                        $display ("%t ERROR: Sync - BY# must be LOW during READ cycles.", $realtime);
                end

                if (row_count > 0) begin
                    if (row_count == 1) begin
                        $display ("%t ERROR: CE# must go HIGH before the third CLK after the WAIT period asserts with BCR[8] = 0, or before the fourth CLK after WAIT asserts with BCR[8] = 1", $realtime);
                    end else begin
                        row_count = row_count - 1;
                    end
                end else if (rbc) begin
                    if (sync_latency_cntr == 2*latency_counter + 2 + !sync_we_n) begin
                        rbc_by = by_n;
                        rbc_dq = dq_in;
                    end else if (sync_latency_cntr == 2) begin
                        if (!sync_we_n) begin
                            if (DEBUG[0]) 
                                $display ("%t  INFO:  Sync - Write, addr = %h, Mask = %h, Data = %h - Row Boundary Crossing", $realtime, sync_addr, rbc_by, rbc_dq);
                            memory_write(sync_addr, rbc_by, rbc_dq);
                            sync_addr[COL_BITS-1:0] = sync_addr[COL_BITS-1:0] + 1;
                        end
                        rbc <= 0;
                    end
                end else if (sync_latency_cntr < 2) begin 
                    next_by_out = 0;
                    for (i=0; i<BY_BITS; i=i+1) begin
                        next_by_out = next_by_out | ({`DQ_PER_BY{!by_n[i]}}<<(i*`DQ_PER_BY));
                    end
                    by_out   <= #tKOH next_by_out;
                    data_out <= #tKOH {DQ_BITS{1'bx}};

                    if (!sync_we_n) begin 
                        if (sync_cre) begin 
                            if (DEBUG[0]) 
                                $display ("%t  INFO:  Sync - Configuration Register Write data latched, Register Select = %h, Data = %h", $realtime, sync_addr>>REG_SEL, sync_addr);
                            register_write(sync_addr>>REG_SEL, sync_addr[15:0], 1'b1);
                        end else begin 
                            if (DEBUG[0]) 
                                $display ("%t  INFO:  Sync - Write, addr = %h, Mask = %h, Data = %h", $realtime, sync_addr, by_n, dq_in);
                            memory_write(sync_addr, by_n, dq_in);
                        end
                    end else begin 
                        if (sync_cre) begin 
                            case (sync_addr>>REG_SEL)
                                (RCR  & RCR_MASK[17:16])  : next_data_out = ref_conf_register | (RCR<<REG_SEL);
                                (DIDR & DIDR_MASK[17:16]) : next_data_out = didr_conf_register | (DIDR<<REG_SEL);
                                (BCR  & BCR_MASK[17:16])  : next_data_out = bus_conf_register | (BCR<<REG_SEL);
                                default: $display ("%t ERROR:  Sync - Illegal Register Select = %h", $realtime, sync_addr>>REG_SEL);
                            endcase
                            if (DEBUG[0]) 
                                $display ("%t  INFO:  Sync - Configuration Register Read, Register Select = %h, Data = %h", $realtime, sync_addr>>REG_SEL, next_data_out);
                            data_out <= #tACLK next_data_out;
                        end else begin 
                            next_data_out = memory_read(sync_addr);
                            if (DEBUG[0]) 
                                $display ("%t  INFO:  Sync - Read, addr = %h, Data = %h", $realtime, sync_addr, next_data_out);
                            data_out <= #tACLK next_data_out;
                        end
                    end

                    
                    if (!sync_cre) begin
                        
                        
                        if (!burst_wrap_n && (sync_we_n || (GENERATION > CR10))) begin 
                            case (burst_length | {3{sync_burst_length_override}}) 
                                3'b001 : sync_addr[         1:0] = sync_addr[         1:0] + 1;
                                3'b010 : sync_addr[         2:0] = sync_addr[         2:0] + 1;
                                3'b011 : sync_addr[         3:0] = sync_addr[         3:0] + 1;
                                3'b100 : sync_addr[         4:0] = sync_addr[         4:0] + 1;
                                3'b111 : sync_addr[COL_BITS-1:0] = sync_addr[COL_BITS-1:0] + 1;
                            endcase
                            $display ("%t  INFO:  Sync - increment addr = %h", $realtime, sync_addr);
                        end else begin 
                            if (sync_addr[COL_BITS-1:0] == {COL_BITS{1'b1}}) begin
                                sync_wait = wait_polarity;
                                
                                if (!initial_latency && (GENERATION == CR10)) begin
                                    rbc <= 1;
                                    sync_latency_cntr = 2*latency_counter + 3 + !sync_we_n;
                                end else begin
                                    row_count = 3 + (sync_we_n | !cr20wait_code);
                                end
                            end
                            sync_addr[COL_BITS-1:0] = sync_addr[COL_BITS-1:0] + 1;
                        end
                    end
                end

                if (sync_latency_cntr == (!sync_we_n + 2)) begin
                    sync_wait = !wait_polarity;
                
                end else if (cr20wait_code && !sync_we_n && burst_wrap_n && (sync_addr[COL_BITS-1:0] == {COL_BITS{1'b1}})) begin
                    sync_wait = wait_polarity;
                end
            end
        end

        if (sync_latency_cntr > 0) begin
            sync_latency_cntr <= sync_latency_cntr - 1;
        end

        if (Sync2AsyncConfig > 0) begin
            Sync2AsyncConfig <= Sync2AsyncConfig - 1;
        end

        if (wait_configuration) begin 
            wait_out <= #tKHTL sync_wait;
        end else begin
            wait_out <= #tKHTL sync_wait_q;
        end

        sync_wait_q <= sync_wait;
    end