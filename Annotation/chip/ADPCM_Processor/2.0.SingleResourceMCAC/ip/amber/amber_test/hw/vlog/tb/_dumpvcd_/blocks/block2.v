initial
    begin
    $display ("VCD Dump enabled from %d to %d", 
    ( `AMBER_DUMP_START                ),
    ( `AMBER_DUMP_START + `AMBER_DUMP_LENGTH ) );
    
    $dumpfile(`AMBER_VCD_FILE);
    $dumpvars(1, `U_TB.clk_count);
    
    $dumpvars(1, `U_DECOMPILE.xINSTRUCTION_EXECUTE);
    $dumpvars(1, `U_EXECUTE.o_write_enable);
    $dumpvars(1, `U_EXECUTE.o_exclusive);
    $dumpvars(1, `U_EXECUTE.o_write_data);
    $dumpvars(1, `U_EXECUTE.base_address);
    $dumpvars(1, `U_EXECUTE.pc);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r0);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r1);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r2);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r3);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r4);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r5);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r6);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r7);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r8);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r9);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r10);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r11);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r12);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r13_out);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r14_out);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r14_irq);
    $dumpvars(1, `U_EXECUTE.u_register_bank.r15);


    $dumpvars(1, `U_FETCH);
    $dumpvars(1, `U_CACHE);
    $dumpvars(1, `U_DECODE);
    $dumpvars(1, `U_WISHBONE);
    $dumpvars(1, `U_AMBER);    
     
    `ifdef AMBER_A25_CORE
    $dumpvars(1, `U_MEM);
    $dumpvars(1, `U_DCACHE);
    `endif
    
    $dumpoff;    
    end