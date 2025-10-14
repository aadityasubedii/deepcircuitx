a25_barrel_shift u_barrel_shift  (
    .clk            ( clk                     ),
    .reset          ( reset                   ),
    .scan_enable    ( scan_enable             ),
    .test_mode      ( test_mode               ),

    .i_in             ( barrel_shift_in           ),
    .i_carry_in       ( carry_in                  ),
    .i_shift_amount   ( shift_amount              ),
    .i_shift_imm_zero ( i_shift_imm_zero          ),
    .i_function       ( i_barrel_shift_function   ),

    .o_out            ( barrel_shift_out          ),
    .o_carry_out      ( barrel_shift_carry        ),
    .o_stall          ( barrel_shift_stall        ));