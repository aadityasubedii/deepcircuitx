    wire [31:0] status_rdt;

    assign status_rdt = status_re ? sreg_rdt(status_addr) : 0;