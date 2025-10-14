always @( posedge i_clk )
    if ( wb_start_write )
        case ( i_wb_adr[15:0] )
            AMBER_IC_IRQ0_ENABLESET:  irq0_enable_reg  <=  irq0_enable_reg  | ( i_wb_dat);
            AMBER_IC_IRQ0_ENABLECLR:  irq0_enable_reg  <=  irq0_enable_reg  & (~i_wb_dat);
            AMBER_IC_FIRQ0_ENABLESET: firq0_enable_reg <=  firq0_enable_reg | ( i_wb_dat);
            AMBER_IC_FIRQ0_ENABLECLR: firq0_enable_reg <=  firq0_enable_reg & (~i_wb_dat);

            AMBER_IC_INT_SOFTSET_0:   softint_0_reg    <=  softint_0_reg   | ( i_wb_dat[0]);
            AMBER_IC_INT_SOFTCLEAR_0: softint_0_reg    <=  softint_0_reg   & (~i_wb_dat[0]);

            AMBER_IC_IRQ1_ENABLESET:  irq1_enable_reg  <=  irq1_enable_reg  | ( i_wb_dat);
            AMBER_IC_IRQ1_ENABLECLR:  irq1_enable_reg  <=  irq1_enable_reg  & (~i_wb_dat);
            AMBER_IC_FIRQ1_ENABLESET: firq1_enable_reg <=  firq1_enable_reg | ( i_wb_dat);
            AMBER_IC_FIRQ1_ENABLECLR: firq1_enable_reg <=  firq1_enable_reg & (~i_wb_dat);

            AMBER_IC_INT_SOFTSET_1:   softint_1_reg    <=  softint_1_reg   | ( i_wb_dat[0]);
            AMBER_IC_INT_SOFTCLEAR_1: softint_1_reg    <=  softint_1_reg   & (~i_wb_dat[0]);
        endcase