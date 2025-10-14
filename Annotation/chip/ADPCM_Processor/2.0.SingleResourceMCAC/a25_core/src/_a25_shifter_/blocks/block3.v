    assign asr_out = i_shift_imm_zero             ? {i_in[31], {32{i_in[31]}}             } :
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in                     } :  
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0], { 2{i_in[31]}}, i_in[30: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1], { 3{i_in[31]}}, i_in[30: 2]} :
                                                    {i_in[ 2], { 4{i_in[31]}}, i_in[30: 3]} ; 