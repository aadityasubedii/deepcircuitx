    always @(sync_access or ce2wi or we_n or oe_n or by_n or zz_n_in or async_cre or async_addr) begin
        if (sync_access) begin
            software_access_unlock <= 2'b0;
            async_state = IDLE;
        end else begin

            
            if ((async_state == WR) && ((last_ce2wi && !ce2wi) || (!last_we_n && we_n) || |(~last_by_n & by_n))) begin
                if ($realtime - tm_tcw < tCW) 
                    $display ("%t ERROR:   tCW violation on CE# by %t", $realtime, tm_tcw + tCW - $realtime);
                if ($realtime - tm_adv_n_neg < tVS) 
                    $display ("%t ERROR:   tVS violation on ADV# by %t", $realtime, tm_adv_n_neg + tVS - $realtime);
                if ($realtime - tm_tbw < tBW) 
                    $display ("%t ERROR:   tBW violation on BY# by %t", $realtime, tm_tbw + tBW - $realtime);
                if ($realtime - tm_we_n < tWP)
                    $display ("%t ERROR:   tWP violation on WE# by %t", $realtime, tm_we_n + tWP - $realtime);
                if ($realtime - tm_async_cre < tAW) 
                    $display ("%t ERROR:   tAW violation on CRE by %t", $realtime, tm_async_cre + tAW - $realtime);
                if ($realtime - tm_async_addr < tAW)
                    $display ("%t ERROR:   tAW violation on ADDR by %t", $realtime, tm_async_addr + tAW - $realtime);
                if ($realtime - tm_dq_tdw < tDW) 
                    $display ("%t ERROR:   tDW violation on DQ by %t", $realtime, tm_dq_tdw + tDW - $realtime);
                if (($realtime - tm_async_addr < tWC) || ($realtime - tm_tcw < tWC))
                    $display ("%t ERROR:   tWC violation on ADDR", $realtime);

                if ((async_addr == {ADDR_BITS{1'b1}}) && (software_access_unlock == 2)) begin
                    case (last_dq[1:0])
                       (2'b00 & RCR_MASK[17:16])  : software_access_which_reg <= RCR;
                       (2'b10 & DIDR_MASK[17:16]) : software_access_which_reg <= DIDR;
                       (2'b01 & BCR_MASK[17:16])  : software_access_which_reg <= BCR;
                       default: $display ("%t ERROR: Async - Illegal Register Select = %h", $realtime, last_dq[1:0]);
                    endcase
                    if (DEBUG[0]) 
                        $display ("%t  INFO: Async - Software Access Unlock = %d, Register Select = %h", $realtime, software_access_unlock, last_dq[1:0]);
                    software_access_unlock <= software_access_unlock + 1;
                end else if ((async_addr == {ADDR_BITS{1'b1}}) && (software_access_unlock == 3)) begin
                    if (DEBUG[0]) 
                        $display ("%t  INFO: Async - Software Access Write, Data = %h", $realtime, last_dq[15:0]);
                    register_write(software_access_which_reg, last_dq[15:0], 1'b1);
                    software_access_unlock <= 2'b0;
                end else begin
                    memory_write(async_addr, last_by_n, last_dq);
                    software_access_unlock <= 2'b0;
                    if (DEBUG[0]) 
                        $display ("%t  INFO: Async - Write data latched, addr = %h, Mask = %h, Data = %h", $realtime, async_addr, last_by_n, last_dq);
                end
                async_state = IDLE;
                async_wr_lockout = 1;
                tavh_check <= #tAVH 1'b0;
                tow_check <= #tOW 1'b1;
            end

            
            if ((async_state == CFG_WR) && ((last_ce2wi && !ce2wi) || (!last_we_n && we_n))) begin
                if ($realtime - tm_tcw < tCW) 
                    $display ("%t ERROR:   tCW violation on CE# by %t", $realtime, tm_tcw + tCW - $realtime);
                if ($realtime - tm_adv_n_neg < tVS) 
                    $display ("%t ERROR:   tVS violation on ADV# by %t", $realtime, tm_adv_n_neg + tVS - $realtime);
                if ($realtime - tm_tbw < tBW) 
                    $display ("%t ERROR:   tBW violation on BY# by %t", $realtime, tm_tbw + tBW - $realtime);
                if ($realtime - tm_we_n < tWP)
                    $display ("%t ERROR:   tWP violation on WE# by %t", $realtime, tm_we_n + tWP - $realtime);
                if ($realtime - tm_async_cre < tAW) 
                    $display ("%t ERROR:   tAW violation on CRE by %t", $realtime, tm_async_cre + tAW - $realtime);
                if ($realtime - tm_async_addr < tAW)
                    $display ("%t ERROR:   tAW violation on ADDR by %t", $realtime, tm_async_addr + tAW - $realtime);
                if ($realtime - tm_dq_tdw < tDW) 
                    $display ("%t ERROR:   tDW violation on DQ by %t", $realtime, tm_dq_tdw + tDW - $realtime);
                if (($realtime - tm_async_addr < tWC) || ($realtime - tm_tcw < tWC))
                    $display ("%t ERROR:   tWC violation on ADDR", $realtime);

                if (DEBUG[0]) 
                    $display ("%t  INFO: Async - Configuration Register Write data latched, Register Select = %h, Data = %h", $realtime, async_addr>>REG_SEL, async_addr);
                register_write(async_addr>>REG_SEL, async_addr[15:0], 1'b1);
                software_access_unlock <= 2'b0;
                async_state = IDLE;
                async_wr_lockout = 1;
                tow_check <= #tOW 1'b1;
                tavh_check <= #tAVH 1'b0;
                tm_write_end = $realtime;
           end

            
            if (async_state == RD) begin
                if (last_ce2wi && !ce2wi) begin
                    if (($realtime - tm_upper_addr < tRC) || ($realtime - tm_tcw < tRC))
                        $display ("%t ERROR:   tRC violation on ADDR", $realtime);
                    if ($realtime - tm_page_addr3 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr3 + tPC - $realtime);
                    if ($realtime - tm_page_addr2 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr2 + tPC - $realtime);
                    if ($realtime - tm_page_addr1 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr1 + tPC - $realtime);
                    if ($realtime - tm_page_addr0 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr0 + tPC - $realtime);
                    async_state = IDLE;
                end else if (!last_oe_n && oe_n) begin
                    async_state = IDLE;
                end
            end

            
            if (!last_we_n && we_n) begin
                async_wr_lockout = 0;
            end
            
            if (last_ce2wi && !ce2wi) begin
                tavh_check <= #tAVH 1'b0;
            end

            
            if (!async_wr_lockout && ce2wi && !we_n && !async_cre) begin
                if (async_state == WR) begin
                    $display ("%t ERROR: Async - Illegal or unintended Page Mode Write.", $realtime);
                end
                async_state = WR;
                last_access <= 1'b0;
                last_ce <= 1'b0;
                tavh_check <= 1'b1;
                if (DEBUG[0]) 
                    $display ("%t  INFO: Async - Write", $realtime);
            end
            if (!async_wr_lockout && ce2wi && !we_n && (async_cre || !zz_n_in) && ((GENERATION != CR20) || oe_n)) begin
                if (async_state == CFG_WR) begin
                    $display ("%t ERROR: Async - Page Mode Configuration Register Write is Illegal.", $realtime);
                end
                async_state = CFG_WR;
                last_access <= 1'b0;
                last_ce <= 1'b0;
                tavh_check <= 1'b1;
                if (DEBUG[0]) 
                    $display ("%t  INFO: Async - Configuration Register Write", $realtime);
            end
            if (ce2wi && !oe_n && we_n && !async_cre) begin
                next_data_out = {DQ_BITS{1'bx}};
                if (!page_mode && (async_state == RD))
                    $display ("%t ERROR: Async - Illegal or unintended Page Mode Read.  Page mode is disabled in BCR", $realtime);
                if ((GENERATION > CR10) && (by_n !== {BY_BITS{1'b0}}))
                    $display ("%t ERROR: Async - BY# must be LOW during READ cycles.", $realtime);
                if (async_addr == {ADDR_BITS{1'b1}} && (software_access_unlock == 3)) begin
                    case (software_access_which_reg)
                        RCR  : next_data_out = ref_conf_register | (RCR<<REG_SEL);
                        DIDR : next_data_out = didr_conf_register | (DIDR<<REG_SEL);
                        BCR  : next_data_out = bus_conf_register | (BCR<<REG_SEL);
                    endcase
                    if (DEBUG[0]) 
                        $display ("%t  INFO: Async - Software Access Read, Data = %h", $realtime, next_data_out);
                    software_access_unlock <= 2'b0;
                end else begin 
                    next_data_out = memory_read(async_addr);
                    if (DEBUG[0]) 
                        $display ("%t  INFO: Async - Read, addr = %h, Data = %h", $realtime, async_addr, next_data_out);
                    if (async_addr == {ADDR_BITS{1'b1}}) begin
                        if (software_access_unlock < 2) begin
                            if (DEBUG[0]) 
                                $display ("%t  INFO: Async - Software Access Unlock = %d", $realtime, software_access_unlock);
                            software_access_unlock <= software_access_unlock + 1;
                        end
                    end else begin
                        software_access_unlock <= 2'b0;
                    end
                end
                data_out <= #tOH {DQ_BITS{1'bx}};
                if (async_state == RD) begin
                    data_out <= #tAPA next_data_out;
                end else begin
                    data_out <= #tOE next_data_out;
                end
                async_state = RD;
                last_access <= 1'b0;
                last_ce <= 1'b0;
                tavh_check <= 1'b1;
            end
            if (ce2wi && !oe_n && we_n && async_cre) begin
                next_data_out = {DQ_BITS{1'bx}};
                if (async_state == RD)
                    $display ("%t ERROR: Async - Page Mode Configuration Register Read is Illegal.", $realtime);
                if ((GENERATION > CR10) && (by_n !== {BY_BITS{1'b0}}))
                    $display ("%t ERROR: Async - BY# must be LOW during READ cycles.", $realtime);
                if (!CRE_READ)
                    $display ("%t ERROR: Async - Access using CRE is WRITE only.", $realtime);
                case (async_addr>>REG_SEL)
                    (RCR  & RCR_MASK[17:16])  : next_data_out = ref_conf_register | (RCR<<REG_SEL);
                    (DIDR & DIDR_MASK[17:16]) : next_data_out = didr_conf_register | (DIDR<<REG_SEL);
                    (BCR  & BCR_MASK[17:16])  : next_data_out = bus_conf_register | (BCR<<REG_SEL);
                    default: $display ("%t ERROR: Async - Illegal Register Select = %h", $realtime, async_addr>>REG_SEL);
                endcase
                if (DEBUG[0]) 
                    $display ("%t  INFO: Async - Configuration Register Read, Register Select = %h, Data = %h", $realtime, async_addr>>REG_SEL, next_data_out);
                software_access_unlock <= 2'b0;
                data_out <= #tOH {DQ_BITS{1'bx}};
                data_out <= #tOE next_data_out;
                async_state = RD;
                last_access <= 1'b0;
                last_ce <= 1'b0;
                tavh_check <= 1'b1;
            end

            if (ce2wi) begin
                next_by_out = 0;
                for (i=0; i<BY_BITS; i=i+1) begin
                    next_by_out = next_by_out | ({`DQ_PER_BY{!by_n[i]}}<<(i*`DQ_PER_BY));
                end
                by_out <= #tOH next_by_out;
            end
        end
    end