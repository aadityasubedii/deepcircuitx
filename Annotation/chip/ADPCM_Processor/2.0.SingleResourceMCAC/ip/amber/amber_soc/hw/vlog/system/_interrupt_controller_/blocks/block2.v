always @( posedge i_clk )
    if ( wb_start_read )
        case ( i_wb_adr[15:0] )

            AMBER_IC_IRQ0_ENABLESET:    wb_rdata32 <= irq0_enable_reg;
            AMBER_IC_FIRQ0_ENABLESET:   wb_rdata32 <= firq0_enable_reg;
            AMBER_IC_IRQ0_RAWSTAT:      wb_rdata32 <= raw_interrupts;
            AMBER_IC_IRQ0_STATUS:       wb_rdata32 <= irq0_interrupts;
            AMBER_IC_FIRQ0_RAWSTAT:     wb_rdata32 <= raw_interrupts;
            AMBER_IC_FIRQ0_STATUS:      wb_rdata32 <= firq0_interrupts;

            AMBER_IC_INT_SOFTSET_0:     wb_rdata32 <= {31'd0, softint_0_reg};
            AMBER_IC_INT_SOFTCLEAR_0:   wb_rdata32 <= {31'd0, softint_0_reg};

            AMBER_IC_IRQ1_ENABLESET:    wb_rdata32 <= irq1_enable_reg;
            AMBER_IC_FIRQ1_ENABLESET:   wb_rdata32 <= firq1_enable_reg;
            AMBER_IC_IRQ1_RAWSTAT:      wb_rdata32 <= raw_interrupts;
            AMBER_IC_IRQ1_STATUS:       wb_rdata32 <= irq1_interrupts;
            AMBER_IC_FIRQ1_RAWSTAT:     wb_rdata32 <= raw_interrupts;
            AMBER_IC_FIRQ1_STATUS:      wb_rdata32 <= firq1_interrupts;

            AMBER_IC_INT_SOFTSET_1:     wb_rdata32 <= {31'd0, softint_1_reg};
            AMBER_IC_INT_SOFTCLEAR_1:   wb_rdata32 <= {31'd0, softint_1_reg};

            default:                    wb_rdata32 <= 32'h22334455;

        endcase