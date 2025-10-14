    task register_write;
        input  [1:0] select;
        input [15:0] opcode;
        input        report;
        begin

            case(select)
                BCR: begin
                    burst_length        = opcode[2:0];
                    burst_wrap_n        = opcode[3];
                    drive_strength      = opcode[5:4];
                    clock_configuration = opcode[6];
                    wait_configuration  = opcode[8];   
                    cr20wait            = opcode[9];
                    cr20wait_code       = (cr20wait == CR20WAIT_POLARITY);
                    wait_polarity       = opcode[10];
                    latency_counter     = (opcode[13:11] == 3'b000) ? 4'd8 : opcode[13:11];
                    initial_latency     = opcode[14];
                    if (!operating_mode && opcode[15]) begin 
                        Sync2AsyncConfig = latency_counter;
                    end
                    operating_mode      = opcode[15]; 
                end
                RCR: begin
                    partial_array_refresh = opcode[2:0];
                    if (software_access_unlock) begin
                        if ((GENERATION == CR10) && (deep_power_down_n ^ opcode[4]))
                            $display ("%t ERROR: Deep Power Down cannot be enabled or disabled using the software access sequence", $realtime);
                    end
                    
                    if (!deep_power_down_n && opcode[4]) begin
                        if (GENERATION == CR10) begin
                            tm_power_up <= $realtime;
                        end else begin
                            if ($realtime - tm_tdpd < tDPD)
                                $display ("%t ERROR:  tDPD violation on CE# by %t", $realtime, tm_tdpd + tDPD - $realtime);
                            deep_power_down_exit <= 1'b1;
                            tm_tdpdx <= $realtime;
                        end
                        if (DEBUG[0]) 
                            $display ("%t  INFO: Deep Power Down Exit", $realtime);
                    end
                    deep_power_down_n     = opcode[4];
                    case_temp             = opcode[6:5];
                    page_mode             = opcode[7];
                end
            endcase

            if (report) begin
                case(select)
                    (BCR & BCR_MASK[17:16]): begin
                        $display ("%t  INFO: Register Select = BCR", $realtime);
                        if ((~BCR_MASK & opcode) !== (~BCR_MASK & BCR_DEFAULT))
                            $display ("%t ERROR: Reserved bits in BCR cannot be changed from their default value.", $realtime);

                        if (&BCR_MASK[2:0]) begin
                            casex ({(GENERATION > CR10), burst_length})
                                4'bx001:$display ("%t  INFO: Burst Length =  4 words", $realtime);
                                4'bx010:$display ("%t  INFO: Burst Length =  8 words", $realtime);
                                4'bx011:$display ("%t  INFO: Burst Length = 16 words", $realtime);
                                4'b1100:$display ("%t  INFO: Burst Length = 32 words", $realtime);
                                4'bx111:$display ("%t  INFO: Burst Length = continuous", $realtime);  
                                default:$display ("%t ERROR: Illegal Burst Length = %h", $realtime, burst_length);
                            endcase
                        end

                        if (BCR_MASK[3]) begin
                            case (burst_wrap_n)
                                1'b0   :$display ("%t  INFO: Burst Wrap = Burst wraps within the burst length", $realtime);
                                1'b1   :$display ("%t  INFO: Burst Wrap = Burst no wrap", $realtime);  
                                default:$display ("%t ERROR: Illegal Burst Wrap = %h", $realtime, burst_wrap_n);
                            endcase
                        end

                        if (|BCR_MASK[5:4]) begin
                            case (drive_strength & BCR_MASK[5:4])
                                2'b00  :$display ("%t  INFO: Drive Strength = Full", $realtime);  
                                2'b01  :$display ("%t  INFO: Drive Strength = 1/2", $realtime);  
                                2'b10  :$display ("%t  INFO: Drive Strength = 1/4", $realtime);  
                                default:$display ("%t ERROR: Illegal Drive Strength = %h", $realtime, drive_strength);
                            endcase
                        end

                        if (BCR_MASK[6]) begin
                            case (clock_configuration)
                                1'b1   :$display ("%t  INFO: Clock Configuration = Rising edge", $realtime); 
                                default:$display ("%t ERROR: Illegal Clock Configuration = %h", $realtime, clock_configuration);
                            endcase
                        end

                        if (BCR_MASK[8]) begin
                            case (wait_configuration)
                                1'b0   :$display ("%t  INFO: WAIT Configuration = Asserted during delay", $realtime); 
                                1'b1   :$display ("%t  INFO: WAIT Configuration = Asserted one data cycle before delay", $realtime);  
                                default:$display ("%t ERROR: Illegal WAIT Configuration = %h", $realtime, wait_configuration);
                            endcase
                        end

                        if (BCR_MASK[9]) begin
                            case (cr20wait_code)
                                1'b0   :$display ("%t  INFO: CR1.5 WAIT Behavior", $realtime); 
                                1'b1   :$display ("%t  INFO: CR2.0 WAIT Behavior", $realtime);
                                default:$display ("%t ERROR: Illegal CR2.0 WAIT Behavior = %h", $realtime, cr20wait_code);
                            endcase
                        end

                        if (BCR_MASK[10]) begin
                            case (wait_polarity)
                                1'b0   :$display ("%t  INFO: Wait Polarity = Active LOW", $realtime); 
                                1'b1   :$display ("%t  INFO: Wait Polarity = Active HIGH", $realtime);  
                                default:$display ("%t ERROR: Illegal Wait Polarity = %h", $realtime, wait_polarity);
                            endcase
                        end

                        if (&BCR_MASK[13:11]) begin
                            casex ({initial_latency, latency_counter})
                                5'hx2  :$display ("%t  INFO: Latency Counter = Code 2", $realtime);
                                5'hx3  :$display ("%t  INFO: Latency Counter = Code 3", $realtime);   
                                5'h14  :$display ("%t  INFO: Latency Counter = Code 4", $realtime);
                                5'h15  :$display ("%t  INFO: Latency Counter = Code 5", $realtime);
                                5'h16  :$display ("%t  INFO: Latency Counter = Code 6", $realtime);
                                5'h18  :$display ("%t  INFO: Latency Counter = Code 8", $realtime);
                                default:$display ("%t ERROR: Illegal Latency Counter = %h", $realtime, latency_counter);
                            endcase
                        end

                        if (BCR_MASK[14]) begin
                            case (initial_latency)
                                1'b0   :$display ("%t  INFO: Initial Access Latency = Variable", $realtime);  
                                1'b1   :$display ("%t  INFO: Initial Access Latency = Fixed", $realtime);
                                default:$display ("%t ERROR: Illegal Initial Access Latency = %h", $realtime, initial_latency);
                            endcase
                        end

                        if (BCR_MASK[15]) begin
                            case (operating_mode)
                                1'b0   :$display ("%t  INFO: Operating Mode = Synchronous burst access mode", $realtime);
                                1'b1   :$display ("%t  INFO: Operating Mode = Asynchronous access mode", $realtime);  
                                default:$display ("%t ERROR: Illegal Operating Mode = %h", $realtime, operating_mode);
                            endcase
                        end
                    end

                    (RCR & RCR_MASK[17:16]): begin
                        $display ("%t  INFO: Register Select = RCR", $realtime);
                        if ((~RCR_MASK & opcode) !== (~RCR_MASK & RCR_DEFAULT))
                            $display ("%t ERROR: Reserved bits in RCR cannot be changed from their default value.", $realtime);

                        if (RCR_MASK[2:0]) begin
                            case (partial_array_refresh)
                               3'b000 : begin $display ("%t  INFO: Partial Array Refresh =       Full array", $realtime); partial_address_size = 1<<(ADDR_BITS-0); partial_address_offset = 0; end
                               3'b001 : begin $display ("%t  INFO: Partial Array Refresh = Bottom 1/2 array", $realtime); partial_address_size = 1<<(ADDR_BITS-1); partial_address_offset = 0; end
                               3'b010 : begin $display ("%t  INFO: Partial Array Refresh = Bottom 1/4 array", $realtime); partial_address_size = 1<<(ADDR_BITS-2); partial_address_offset = 0; end
                               3'b011 : begin $display ("%t  INFO: Partial Array Refresh = Bottom 1/8 array", $realtime); partial_address_size = 1<<(ADDR_BITS-3); partial_address_offset = 0; end
                               3'b100 : begin $display ("%t  INFO: Partial Array Refresh =             None", $realtime); partial_address_size = 0;                partial_address_offset = 0; end
                               3'b101 : begin $display ("%t  INFO: Partial Array Refresh =    Top 1/2 array", $realtime); partial_address_size = 1<<(ADDR_BITS-1); partial_address_offset = (1<<ADDR_BITS) - partial_address_size; end
                               3'b110 : begin $display ("%t  INFO: Partial Array Refresh =    Top 1/4 array", $realtime); partial_address_size = 1<<(ADDR_BITS-2); partial_address_offset = (1<<ADDR_BITS) - partial_address_size; end
                               3'b111 : begin $display ("%t  INFO: Partial Array Refresh =    Top 1/8 array", $realtime); partial_address_size = 1<<(ADDR_BITS-3); partial_address_offset = (1<<ADDR_BITS) - partial_address_size; end
                               default: begin $display ("%t ERROR: Illegal Partial Array Refresh = %h", $realtime, partial_array_refresh); end
                            endcase
                        end

                        if (RCR_MASK[4]) begin
                            case (deep_power_down_n)
                               1'b0   : $display ("%t  INFO: Deep Power Down = DPD Enable", $realtime);
                               1'b1   : $display ("%t  INFO: Deep Power Down = DPD Disable", $realtime);
                               default: $display ("%t ERROR: Illegal Deep Power Down = %h", $realtime, deep_power_down_n);
                            endcase
                        end

                        if (&RCR_MASK[6:5]) begin
                            case (case_temp)
                               2'b00  : $display ("%t  INFO: Maximum Case Temp = 70 degrees C", $realtime);
                               2'b01  : $display ("%t  INFO: Maximum Case Temp = 45 degrees C", $realtime);
                               2'b10  : $display ("%t  INFO: Maximum Case Temp = 15 degrees C", $realtime);
                               2'b11  : $display ("%t  INFO: Maximum Case Temp = 85 degrees C", $realtime);
                               default: $display ("%t ERROR: Illegal Maximum Case Temp = %h", $realtime, case_temp);
                            endcase
                        end

                        if (RCR_MASK[7]) begin
                            case (page_mode)
                               1'b0   : $display ("%t  INFO: Page Mode = Page Mode Disabled", $realtime);
                               1'b1   : $display ("%t  INFO: Page Mode = Page Mode Enable", $realtime);
                               default: $display ("%t ERROR: Illegal Page Mode = %h", $realtime, page_mode);
                            endcase
                        end
                    end
                    (DIDR & DIDR_MASK[17:16]): begin
                        $display ("%t  INFO: Register Select = DIDR", $realtime);
                        $display ("%t ERROR: DIDR Configuration Register is read-only", $realtime);
                    end
                    default: begin
                        $display ("%t ERROR: Illegal Register Select = %d", $realtime, select);
                    end
                endcase
            end
        end
    endtask