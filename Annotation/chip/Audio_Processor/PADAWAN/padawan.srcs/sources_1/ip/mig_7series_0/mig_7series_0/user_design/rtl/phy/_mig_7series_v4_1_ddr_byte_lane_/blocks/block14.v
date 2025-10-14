generate
  if (PI_DIV2_INCDEC == "TRUE") begin: phaser_in_div2_clk
    (* ASYNC_REG = "TRUE" *) reg  pi_phase_locked_r1;
    (* ASYNC_REG = "TRUE" *) reg  pi_phase_locked_r2;
    (* ASYNC_REG = "TRUE" *) reg  pi_phase_locked_r3;
    reg  pi_phase_locked_r4;

    (* ASYNC_REG = "TRUE" *) reg  pi_dqs_found_r1;
    (* ASYNC_REG = "TRUE" *) reg  pi_dqs_found_r2;
    (* ASYNC_REG = "TRUE" *) reg  pi_dqs_found_r3;
    reg  pi_dqs_found_r4;

    (* ASYNC_REG = "TRUE" *) reg [5:0] pi_counter_read_val_r1;
    (* ASYNC_REG = "TRUE" *) reg [5:0] pi_counter_read_val_r2;
    (* ASYNC_REG = "TRUE" *) reg [5:0] pi_counter_read_val_r3;
    reg [5:0] pi_counter_read_val_r4;
