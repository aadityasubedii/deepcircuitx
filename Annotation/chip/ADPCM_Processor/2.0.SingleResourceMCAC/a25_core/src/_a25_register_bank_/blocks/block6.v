

assign r8_rds  = i_mode_rds_exec[OH_FIRQ] ? r8_firq  : r8;
assign r9_rds  = i_mode_rds_exec[OH_FIRQ] ? r9_firq  : r9;
assign r10_rds = i_mode_rds_exec[OH_FIRQ] ? r10_firq : r10;
assign r11_rds = i_mode_rds_exec[OH_FIRQ] ? r11_firq : r11;
assign r12_rds = i_mode_rds_exec[OH_FIRQ] ? r12_firq : r12;

assign r13_rds = i_mode_rds_exec[OH_USR]  ? r13      :
                 i_mode_rds_exec[OH_SVC]  ? r13_svc  :
                 i_mode_rds_exec[OH_IRQ]  ? r13_irq  :
                                            r13_firq ;
                       
assign r14_rds = i_mode_rds_exec[OH_USR]  ? r14      :
                 i_mode_rds_exec[OH_SVC]  ? r14_svc  :
                 i_mode_rds_exec[OH_IRQ]  ? r14_irq  :
                                            r14_firq ;