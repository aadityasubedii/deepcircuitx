assign r0_out = r0;
assign r1_out = r1;
assign r2_out = r2;
assign r3_out = r3;
assign r4_out = r4;
assign r5_out = r5;
assign r6_out = r6;
assign r7_out = r7;

assign r8_out  = firq_exec ? r8_firq  : r8;
assign r9_out  = firq_exec ? r9_firq  : r9;
assign r10_out = firq_exec ? r10_firq : r10;
assign r11_out = firq_exec ? r11_firq : r11;
assign r12_out = firq_exec ? r12_firq : r12;

assign r13_out = usr_exec ? r13      :
                 svc_exec ? r13_svc  :
                 irq_exec ? r13_irq  :
                          r13_firq ;
                       
assign r14_out = usr_exec ? r14      :
                 svc_exec ? r14_svc  :
                 irq_exec ? r14_irq  :
                          r14_firq ;