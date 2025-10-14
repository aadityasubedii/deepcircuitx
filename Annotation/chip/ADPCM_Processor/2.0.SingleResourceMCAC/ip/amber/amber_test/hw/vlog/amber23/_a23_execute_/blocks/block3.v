a23_multiply u_multiply (
    .i_clk          ( i_clk                 ),
    .i_fetch_stall  ( i_fetch_stall         ),
    .i_a_in         ( rs                    ),
    .i_b_in         ( rm                    ),
    .i_function     ( i_multiply_function   ),
    .i_execute      ( execute               ),
    .o_out          ( multiply_out          ),
    .o_flags        ( multiply_flags        ),  
    .o_done         ( o_multiply_done       )     
);