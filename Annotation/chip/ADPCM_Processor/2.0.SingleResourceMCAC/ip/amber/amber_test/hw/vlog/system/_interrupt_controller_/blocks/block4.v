assign irq0_interrupts  = {raw_interrupts[31:1], softint_0_reg} & irq0_enable_reg;
assign firq0_interrupts =  raw_interrupts                       & firq0_enable_reg;
assign irq1_interrupts  = {raw_interrupts[31:1], softint_1_reg} & irq1_enable_reg;
assign firq1_interrupts  = raw_interrupts                       & firq1_enable_reg;



assign irq_0  = |{irq0_interrupts,  i_test_reg_irq};
assign firq_0 = |{firq0_interrupts, i_test_reg_firq};
assign irq_1  = |irq1_interrupts;
assign firq_1 = |firq1_interrupts;

assign o_irq  = irq_0  | irq_1;
assign o_firq = firq_0 | firq_1;