always @ ( posedge i_clk )
    if (!i_fetch_stall)
        begin
        r0       <=  i_reg_bank_wen[0 ]              ? i_reg : r0;  
        r1       <=  i_reg_bank_wen[1 ]              ? i_reg : r1;  
        r2       <=  i_reg_bank_wen[2 ]              ? i_reg : r2;  
        r3       <=  i_reg_bank_wen[3 ]              ? i_reg : r3;  
        r4       <=  i_reg_bank_wen[4 ]              ? i_reg : r4;  
        r5       <=  i_reg_bank_wen[5 ]              ? i_reg : r5;  
        r6       <=  i_reg_bank_wen[6 ]              ? i_reg : r6;  
        r7       <=  i_reg_bank_wen[7 ]              ? i_reg : r7;  
        
        r8       <= (i_reg_bank_wen[8 ] && !firq_idec) ? i_reg : r8;  
        r9       <= (i_reg_bank_wen[9 ] && !firq_idec) ? i_reg : r9;  
        r10      <= (i_reg_bank_wen[10] && !firq_idec) ? i_reg : r10; 
        r11      <= (i_reg_bank_wen[11] && !firq_idec) ? i_reg : r11; 
        r12      <= (i_reg_bank_wen[12] && !firq_idec) ? i_reg : r12; 
        
        r8_firq  <= (i_reg_bank_wen[8 ] &&  firq_idec) ? i_reg : r8_firq;
        r9_firq  <= (i_reg_bank_wen[9 ] &&  firq_idec) ? i_reg : r9_firq;
        r10_firq <= (i_reg_bank_wen[10] &&  firq_idec) ? i_reg : r10_firq;
        r11_firq <= (i_reg_bank_wen[11] &&  firq_idec) ? i_reg : r11_firq;
        r12_firq <= (i_reg_bank_wen[12] &&  firq_idec) ? i_reg : r12_firq;

        r13      <= (i_reg_bank_wen[13] &&  usr_idec)  ? i_reg : r13;
        r14      <= (i_reg_bank_wen[14] &&  usr_idec)  ? i_reg : r14;
     
        r13_svc  <= (i_reg_bank_wen[13] &&  svc_idec)  ? i_reg : r13_svc;
        r14_svc  <= (i_reg_bank_wen[14] &&  svc_idec)  ? i_reg : r14_svc;   
       
        r13_irq  <= (i_reg_bank_wen[13] &&  irq_idec)  ? i_reg : r13_irq;
        r14_irq  <= (i_reg_bank_wen[14] &&  irq_idec)  ? i_reg : r14_irq;       
      
        r13_firq <= (i_reg_bank_wen[13] &&  firq_idec) ? i_reg : r13_firq;
        r14_firq <= (i_reg_bank_wen[14] &&  firq_idec) ? i_reg : r14_firq;  
        
        r15      <=  i_pc_wen                          ?  i_pc : r15;
        end