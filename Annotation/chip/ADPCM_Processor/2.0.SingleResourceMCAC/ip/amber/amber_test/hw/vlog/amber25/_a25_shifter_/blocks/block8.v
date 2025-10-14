else begin : quick_lsl

    
    assign lsl_out = i_shift_imm_zero        ? {i_carry_in, i_in              } : 
                     i_shift_amount == 2'd0  ? {i_carry_in, i_in              } : 
                     i_shift_amount == 2'd1  ? {i_in[31],   i_in[30: 0],  1'd0} :
                     i_shift_amount == 2'd2  ? {i_in[30],   i_in[29: 0],  2'd0} :
                                               {i_in[29],   i_in[28: 0],  3'd0} ; 

end