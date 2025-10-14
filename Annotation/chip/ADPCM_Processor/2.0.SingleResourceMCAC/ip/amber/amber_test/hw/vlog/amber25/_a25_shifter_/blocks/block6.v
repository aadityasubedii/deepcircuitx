else begin : quick_lsr

    
    assign lsr_out = i_shift_imm_zero             ? {i_in[31], 32'd0             } :
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in            } :  
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0],  1'd0, i_in[31: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1],  2'd0, i_in[31: 2]} :
                                                    {i_in[ 2],  3'd0, i_in[31: 3]} ; 

end