assign firq_request = firq && !i_execute_status_bits[26];
assign irq_request  = irq  && !i_execute_status_bits[27];
assign swi_request  = type == SWI;
assign dabt_request = dabt_reg;
