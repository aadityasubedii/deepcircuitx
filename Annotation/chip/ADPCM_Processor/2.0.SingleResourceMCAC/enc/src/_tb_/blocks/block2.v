task display_registers;
begin
    $display("");
    $display("----------------------------------------------------------------------------");
    $display("Amber Core");

    case (`U_EXECUTE.status_bits_mode)
        FIRQ:    $display("         User       > FIRQ         IRQ          SVC"); 
        IRQ:     $display("         User         FIRQ       > IRQ          SVC"); 
        SVC:     $display("         User         FIRQ         IRQ        > SVC"); 
        default: $display("       > User         FIRQ         IRQ          SVC"); 
    endcase

    $display("r0       0x%08x", `U_REGISTER_BANK.r0);
    $display("r1       0x%08x", `U_REGISTER_BANK.r1);
    $display("r2       0x%08x", `U_REGISTER_BANK.r2);
    $display("r3       0x%08x", `U_REGISTER_BANK.r3);
    $display("r4       0x%08x", `U_REGISTER_BANK.r4);
    $display("r5       0x%08x", `U_REGISTER_BANK.r5);
    $display("r6       0x%08x", `U_REGISTER_BANK.r6);
    $display("r7       0x%08x", `U_REGISTER_BANK.r7);
    $display("r8       0x%08x   0x%08x ", `U_REGISTER_BANK.r8,  `U_REGISTER_BANK.r8_firq);
    $display("r9       0x%08x   0x%08x ", `U_REGISTER_BANK.r9,  `U_REGISTER_BANK.r9_firq);
    $display("r10      0x%08x   0x%08x ", `U_REGISTER_BANK.r10, `U_REGISTER_BANK.r10_firq);
    $display("r11      0x%08x   0x%08x ", `U_REGISTER_BANK.r11, `U_REGISTER_BANK.r11_firq);
    $display("r12      0x%08x   0x%08x ", `U_REGISTER_BANK.r12, `U_REGISTER_BANK.r12_firq);
    
    $display("r13      0x%08x   0x%08x   0x%08x   0x%08x", 
                                               `U_REGISTER_BANK.r13, 
                                               `U_REGISTER_BANK.r13_firq, 
                                               `U_REGISTER_BANK.r13_irq,
                                               `U_REGISTER_BANK.r13_svc);
    $display("r14 (lr) 0x%08x   0x%08x   0x%08x   0x%08x", 
                                               `U_REGISTER_BANK.r14, 
                                               `U_REGISTER_BANK.r14_firq, 
                                               `U_REGISTER_BANK.r14_irq,
                                               `U_REGISTER_BANK.r14_svc);


    $display("r15 (pc) 0x%08x", {6'd0,`U_REGISTER_BANK.r15,2'd0});
    $display("");
    $display("Status Bits: N=%d, Z=%d, C=%d, V=%d, IRQ Mask %d, FIRQ Mask %d, Mode = %s",  
       `U_EXECUTE.status_bits_flags[3],
       `U_EXECUTE.status_bits_flags[2],
       `U_EXECUTE.status_bits_flags[1],
       `U_EXECUTE.status_bits_flags[0],
       `U_EXECUTE.status_bits_irq_mask,
       `U_EXECUTE.status_bits_firq_mask,
       mode_name (`U_EXECUTE.status_bits_mode) );
    $display("----------------------------------------------------------------------------");
    $display("");       

end