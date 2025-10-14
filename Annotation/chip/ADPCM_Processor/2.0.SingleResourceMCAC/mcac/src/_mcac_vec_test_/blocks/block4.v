always @ ( posedge `U_SYSTEM.reset ) begin
	repeat(`RESET_MEM_TICKS)
		@ ( negedge `U_SYSTEM.clk );
        $display("Load enc main memory from %s", `ENC_MAIN_MEM_FILE);

        main_mem_file   = $fopen(`ENC_MAIN_MEM_FILE, "r");
            
        
        main_mem_line_count   = 0;
        
        if (main_mem_file == 0)
            begin
            $display("ERROR: Can't open input file %s", `ENC_MAIN_MEM_FILE);
            `ifndef NETLIST
			`TB_ERROR_MESSAGE
		`endif
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
                        `ifndef NETLIST
            			`TB_ERROR_MESSAGE
				`endif
                        end
                    
                    if (aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        main_mem_file_address =   hex_chars_to_32bits (aligned_line[119*8-1:111*8]);
                        main_mem_file_data    =   hex_chars_to_32bits (aligned_line[110*8-1:102*8]);

                      
                      
                      
                      
                      main_mem_file_data_128 = test.main_mem_e.ram[main_mem_file_address[31:4]];
                      test.main_mem_e.ram [main_mem_file_address[31:4]] = 
                          insert_32_into_128 ( main_mem_file_address[3:2], 
                                               main_mem_file_data_128, 
                                               main_mem_file_data );

                      `ifdef AMBER_LOAD_MEM_DEBUG
                          $display ("Load RAM: PAddr: 0x%08x, Data 0x%08x", 
                                     main_mem_file_address, main_mem_file_data);
                      `endif   
                        
                        end
                    end  
                end
                
            $display("Read in %1d lines", main_mem_line_count);      
            end

	  $display("Load dec main memory from %s", `DEC_MAIN_MEM_FILE);

        main_mem_file   = $fopen(`DEC_MAIN_MEM_FILE, "r");
            
        
        main_mem_line_count   = 0;
        
        if (main_mem_file == 0)
            begin
            $display("ERROR: Can't open input file %s", `DEC_MAIN_MEM_FILE);
            `ifndef NETLIST
			`TB_ERROR_MESSAGE
		`endif
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
                                 `DEC_MAIN_MEM_FILE, main_mem_line_count, aligned_line[118*8-1:117*8]);
                        `ifndef NETLIST
            			`TB_ERROR_MESSAGE
				`endif
                        end
                    
                    if (aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        main_mem_file_address =   hex_chars_to_32bits (aligned_line[119*8-1:111*8]);
                        main_mem_file_data    =   hex_chars_to_32bits (aligned_line[110*8-1:102*8]);

                      
                      
                      
                      
                      main_mem_file_data_128 = test.main_mem_d.ram[main_mem_file_address[31:4]];
                      test.main_mem_d.ram [main_mem_file_address[31:4]] = 
                          insert_32_into_128 ( main_mem_file_address[3:2], 
                                               main_mem_file_data_128, 
                                               main_mem_file_data );

                      `ifdef AMBER_LOAD_MEM_DEBUG
                          $display ("Load RAM: PAddr: 0x%08x, Data 0x%08x", 
                                     main_mem_file_address, main_mem_file_data);
                      `endif   
                        
                        end
                    end  
                end
                
            $display("Read in %1d lines", main_mem_line_count);      
            end
 end