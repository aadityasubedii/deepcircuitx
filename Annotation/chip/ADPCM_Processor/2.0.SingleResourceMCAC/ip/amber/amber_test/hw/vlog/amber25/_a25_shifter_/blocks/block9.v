if (FULL_BARREL == 1) begin : full_lsl

    assign lsl_out = i_shift_imm_zero         ? {i_carry_in, i_in              } :  

                     i_shift_amount == 8'd 0  ? {i_carry_in, i_in              } :  
                     i_shift_amount == 8'd 1  ? {i_in[31],   i_in[30: 0],  1'd0} :
                     i_shift_amount == 8'd 2  ? {i_in[30],   i_in[29: 0],  2'd0} :
                     i_shift_amount == 8'd 3  ? {i_in[29],   i_in[28: 0],  3'd0} :
                     i_shift_amount == 8'd 4  ? {i_in[28],   i_in[27: 0],  4'd0} :
                     i_shift_amount == 8'd 5  ? {i_in[27],   i_in[26: 0],  5'd0} :
                     i_shift_amount == 8'd 6  ? {i_in[26],   i_in[25: 0],  6'd0} :
                     i_shift_amount == 8'd 7  ? {i_in[25],   i_in[24: 0],  7'd0} :
                     i_shift_amount == 8'd 8  ? {i_in[24],   i_in[23: 0],  8'd0} :
                     i_shift_amount == 8'd 9  ? {i_in[23],   i_in[22: 0],  9'd0} :
                     i_shift_amount == 8'd10  ? {i_in[22],   i_in[21: 0], 10'd0} :
                     i_shift_amount == 8'd11  ? {i_in[21],   i_in[20: 0], 11'd0} :
                        
                     i_shift_amount == 8'd12  ? {i_in[20],   i_in[19: 0], 12'd0} :
                     i_shift_amount == 8'd13  ? {i_in[19],   i_in[18: 0], 13'd0} :
                     i_shift_amount == 8'd14  ? {i_in[18],   i_in[17: 0], 14'd0} :
                     i_shift_amount == 8'd15  ? {i_in[17],   i_in[16: 0], 15'd0} :
                     i_shift_amount == 8'd16  ? {i_in[16],   i_in[15: 0], 16'd0} :
                     i_shift_amount == 8'd17  ? {i_in[15],   i_in[14: 0], 17'd0} :
                     i_shift_amount == 8'd18  ? {i_in[14],   i_in[13: 0], 18'd0} :
                     i_shift_amount == 8'd19  ? {i_in[13],   i_in[12: 0], 19'd0} :
                     i_shift_amount == 8'd20  ? {i_in[12],   i_in[11: 0], 20'd0} :
                     i_shift_amount == 8'd21  ? {i_in[11],   i_in[10: 0], 21'd0} :

                     i_shift_amount == 8'd22  ? {i_in[10],   i_in[ 9: 0], 22'd0} :
                     i_shift_amount == 8'd23  ? {i_in[ 9],   i_in[ 8: 0], 23'd0} :
                     i_shift_amount == 8'd24  ? {i_in[ 8],   i_in[ 7: 0], 24'd0} :
                     i_shift_amount == 8'd25  ? {i_in[ 7],   i_in[ 6: 0], 25'd0} :
                     i_shift_amount == 8'd26  ? {i_in[ 6],   i_in[ 5: 0], 26'd0} :
                     i_shift_amount == 8'd27  ? {i_in[ 5],   i_in[ 4: 0], 27'd0} :
                     i_shift_amount == 8'd28  ? {i_in[ 4],   i_in[ 3: 0], 28'd0} :
                     i_shift_amount == 8'd29  ? {i_in[ 3],   i_in[ 2: 0], 29'd0} :
                     i_shift_amount == 8'd30  ? {i_in[ 2],   i_in[ 1: 0], 30'd0} :
                     i_shift_amount == 8'd31  ? {i_in[ 1],   i_in[ 0: 0], 31'd0} :
                     i_shift_amount == 8'd32  ? {i_in[ 0],   32'd0             } :  
                                                {1'd0,       32'd0             } ;  
                                            
end