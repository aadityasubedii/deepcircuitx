        begin
        $display("Load main memory from %s", `MAIN_MEM_FILE);
        `ifdef XILINX_FPGA
        
        $display("Wait for DDR3 initialization to complete before loading main memory");
        #70000000
        $display("Done waiting at %d ticks", `U_TB.clk_count);
        `endif
        main_mem_file   = $fopen(`MAIN_MEM_FILE, "r");
            
        
        main_mem_line_count   = 0;
        
        if (main_mem_file == 0)
            begin
            $display("ERROR: Can't open input file %s", `MAIN_MEM_FILE);
            `TB_ERROR_MESSAGE
            end
        

        if (main_mem_file != 0)
            begin  
            fgets_return = 1;
            while (fgets_return != 0)
                begin
                fgets_return        = $fgets(line, main_mem_file);
                main_mem_line_count = main_mem_line_count + 1;
                aligned_line        = align_line(line);
                
                
                if (aligned_line[120*8-1:118*8] != 16'h2f2f)
                    begin
                    
                    if (aligned_line[120*8-1:119*8] != 8'h40 && aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        $display("Format ERROR in input file %s, line %1d. Line must start with a @, not %08x", 
                                 `MAIN_MEM_FILE, main_mem_line_count, aligned_line[118*8-1:117*8]);
                        `TB_ERROR_MESSAGE
                        end
                    
                    if (aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        main_mem_file_address =   hex_chars_to_32bits (aligned_line[119*8-1:111*8]);
                        main_mem_file_data    =   hex_chars_to_32bits (aligned_line[110*8-1:102*8]);
                        
                        `ifdef XILINX_FPGA
                            mm_ddr3_addr = {main_mem_file_address[13:11], main_mem_file_address[26:14], main_mem_file_address[10:4]};
                        
                            main_mem_file_data_128 = tb.u_ddr3_model.memory [mm_ddr3_addr];
                            tb.u_ddr3_model.memory [mm_ddr3_addr] =
                                    insert_32_into_128 ( main_mem_file_address[3:2], 
                                                         main_mem_file_data_128, 
                                                         main_mem_file_data );
                                                
                            `ifdef AMBER_LOAD_MEM_DEBUG
                                main_mem_file_data_128 = tb.u_ddr3_model.memory [mm_ddr3_addr];
                                $display ("Load DDR3: PAddr: 0x%08x, DDR3 Addr 0x%08h, Data 0x%032x", 
                                          main_mem_file_address, mm_ddr3_addr, main_mem_file_data_128);
                            `endif   

                        `else
                            
                        
                            
                            
                            
                            main_mem_file_data_128 = `U_RAM [main_mem_file_address[31:4]];
                            `U_RAM [main_mem_file_address[31:4]] = 
                                insert_32_into_128 ( main_mem_file_address[3:2], 
                                                     main_mem_file_data_128, 
                                                     main_mem_file_data );

                            `ifdef AMBER_LOAD_MEM_DEBUG
                                $display ("Load RAM: PAddr: 0x%08x, Data 0x%08x", 
                                           main_mem_file_address, main_mem_file_data);
                            `endif   
                        
                        `endif
                        
                        end
                    end  
                end
                
            $display("Read in %1d lines", main_mem_line_count);      
            end
        end