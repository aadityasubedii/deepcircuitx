always @ ( posedge `U_SYSTEM.sys_rst )
        begin
		repeat(`RESET_MEM_TICKS)
			@ ( negedge `U_SYSTEM.sys_clk );
`ifndef XILINX_FPGA
        $display("Load boot memory from %s", `BOOT_MEM_FILE);
        boot_mem_line_count   = 0;
        boot_mem_file         = $fopen(`BOOT_MEM_FILE,    "r");
        if (boot_mem_file == 0)
            begin
            `TB_ERROR_MESSAGE
            $display("ERROR: Can't open input file %s", `BOOT_MEM_FILE);
            $finish;
            end
        
        if (boot_mem_file != 0)
            begin  
            fgets_return = 1;
            while (fgets_return != 0)
                begin
                fgets_return        = $fgets(line, boot_mem_file);
                boot_mem_line_count = boot_mem_line_count + 1;
                aligned_line        = align_line(line);
                
                
                if (aligned_line[120*8-1:118*8] != 16'h2f2f)
                    begin
                    
                    if (aligned_line[120*8-1:119*8] != 8'h40 && aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        $display("Format ERROR in input file %s, line %1d. Line must start with a @, not %08x", 
                                 `BOOT_MEM_FILE, boot_mem_line_count, aligned_line[118*8-1:117*8]);
                        `TB_ERROR_MESSAGE
                        end
                    
                    if (aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        boot_mem_file_address  =   hex_chars_to_32bits (aligned_line[119*8-1:111*8]);
                        boot_mem_file_data     =   hex_chars_to_32bits (aligned_line[110*8-1:102*8]);
                        
                        `ifdef AMBER_A25_CORE
                            boot_mem_file_data_128 = `U_BOOT_MEM.u_mem.mem[boot_mem_file_address[BOOT_MSB:4]];
                            `U_BOOT_MEM.u_mem.mem[boot_mem_file_address[BOOT_MSB:4]] = 
                                    insert_32_into_128 ( boot_mem_file_address[3:2], 
                                                         boot_mem_file_data_128, 
                                                         boot_mem_file_data );
                        `else
                            `U_BOOT_MEM.u_mem.mem[boot_mem_file_address[BOOT_MSB:2]] = boot_mem_file_data;
                        `endif
                        
                        `ifdef AMBER_LOAD_MEM_DEBUG
                            $display ("Load Boot Mem: PAddr: 0x%08x, Data 0x%08x", 
                                        boot_mem_file_address, boot_mem_file_data);
                        `endif   
                        end
                    end  
                end
                
            $display("Read in %1d lines", boot_mem_line_count);      
            end
`endif
            
        
        timeout   = `AMBER_TIMEOUT   ;  
        `ifdef AMBER_A25_CORE
        core_str = "amber25";
        `else
        core_str = "amber23";
        `endif         
        $display("Core %s, log file %s, timeout %0d, test name %0s ", core_str, `AMBER_LOG_FILE, timeout, `AMBER_TEST_NAME );          
        log_file = $fopen(`AMBER_LOG_FILE, "a");                               
        end