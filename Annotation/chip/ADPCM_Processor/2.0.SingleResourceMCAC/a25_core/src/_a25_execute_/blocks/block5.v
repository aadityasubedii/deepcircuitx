a25_alu u_alu (
    .i_a_in                 ( rn                      ),
    .i_b_in                 ( barrel_shift_out        ),
    .i_barrel_shift_carry   ( barrel_shift_carry_alu  ),
    .i_status_bits_carry    ( status_bits_flags[1]    ),
    .i_function             ( i_alu_function          ),

    .o_out                  ( alu_out                 ),
    .o_flags                ( alu_flags               ));