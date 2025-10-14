generate
if (FULL_BARREL == 1) begin : full_ror

                                                  
    assign ror_out = i_shift_imm_zero              ? {i_in[ 0], i_carry_in,  i_in[31: 1]} :  

                     i_shift_amount[7:0] == 8'd 0  ? {i_carry_in, i_in                  } :  
                     
                     i_shift_amount[4:0] == 5'd 0  ? {i_in[31], i_in                    } :  
                     i_shift_amount[4:0] == 5'd 1  ? {i_in[ 0], i_in[    0], i_in[31: 1]} :
                     i_shift_amount[4:0] == 5'd 2  ? {i_in[ 1], i_in[ 1: 0], i_in[31: 2]} :
                     i_shift_amount[4:0] == 5'd 3  ? {i_in[ 2], i_in[ 2: 0], i_in[31: 3]} :
                     i_shift_amount[4:0] == 5'd 4  ? {i_in[ 3], i_in[ 3: 0], i_in[31: 4]} :
                     i_shift_amount[4:0] == 5'd 5  ? {i_in[ 4], i_in[ 4: 0], i_in[31: 5]} :
                     i_shift_amount[4:0] == 5'd 6  ? {i_in[ 5], i_in[ 5: 0], i_in[31: 6]} :
                     i_shift_amount[4:0] == 5'd 7  ? {i_in[ 6], i_in[ 6: 0], i_in[31: 7]} :
                     i_shift_amount[4:0] == 5'd 8  ? {i_in[ 7], i_in[ 7: 0], i_in[31: 8]} :
                     i_shift_amount[4:0] == 5'd 9  ? {i_in[ 8], i_in[ 8: 0], i_in[31: 9]} :
                        
                     i_shift_amount[4:0] == 5'd10  ? {i_in[ 9], i_in[ 9: 0], i_in[31:10]} :
                     i_shift_amount[4:0] == 5'd11  ? {i_in[10], i_in[10: 0], i_in[31:11]} :
                     i_shift_amount[4:0] == 5'd12  ? {i_in[11], i_in[11: 0], i_in[31:12]} :
                     i_shift_amount[4:0] == 5'd13  ? {i_in[12], i_in[12: 0], i_in[31:13]} :
                     i_shift_amount[4:0] == 5'd14  ? {i_in[13], i_in[13: 0], i_in[31:14]} :
                     i_shift_amount[4:0] == 5'd15  ? {i_in[14], i_in[14: 0], i_in[31:15]} :
                     i_shift_amount[4:0] == 5'd16  ? {i_in[15], i_in[15: 0], i_in[31:16]} :
                     i_shift_amount[4:0] == 5'd17  ? {i_in[16], i_in[16: 0], i_in[31:17]} :
                     i_shift_amount[4:0] == 5'd18  ? {i_in[17], i_in[17: 0], i_in[31:18]} :
                     i_shift_amount[4:0] == 5'd19  ? {i_in[18], i_in[18: 0], i_in[31:19]} :

                     i_shift_amount[4:0] == 5'd20  ? {i_in[19], i_in[19: 0], i_in[31:20]} :
                     i_shift_amount[4:0] == 5'd21  ? {i_in[20], i_in[20: 0], i_in[31:21]} :
                     i_shift_amount[4:0] == 5'd22  ? {i_in[21], i_in[21: 0], i_in[31:22]} :
                     i_shift_amount[4:0] == 5'd23  ? {i_in[22], i_in[22: 0], i_in[31:23]} :
                     i_shift_amount[4:0] == 5'd24  ? {i_in[23], i_in[23: 0], i_in[31:24]} :
                     i_shift_amount[4:0] == 5'd25  ? {i_in[24], i_in[24: 0], i_in[31:25]} :
                     i_shift_amount[4:0] == 5'd26  ? {i_in[25], i_in[25: 0], i_in[31:26]} :
                     i_shift_amount[4:0] == 5'd27  ? {i_in[26], i_in[26: 0], i_in[31:27]} :
                     i_shift_amount[4:0] == 5'd28  ? {i_in[27], i_in[27: 0], i_in[31:28]} :
                     i_shift_amount[4:0] == 5'd29  ? {i_in[28], i_in[28: 0], i_in[31:29]} :

                     i_shift_amount[4:0] == 5'd30  ? {i_in[29], i_in[29: 0], i_in[31:30]} :
                                                     {i_in[30], i_in[30: 0], i_in[31:31]} ;

end
else begin : quick_ror
    
    assign ror_out = i_shift_imm_zero             ? {i_in[ 0], i_carry_in,  i_in[31: 1]} :  
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in                  } :  
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0], i_in[    0], i_in[31: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1], i_in[ 1: 0], i_in[31: 2]} :
                                                    {i_in[ 2], i_in[ 2: 0], i_in[31: 3]} ; 

end
endgenerate