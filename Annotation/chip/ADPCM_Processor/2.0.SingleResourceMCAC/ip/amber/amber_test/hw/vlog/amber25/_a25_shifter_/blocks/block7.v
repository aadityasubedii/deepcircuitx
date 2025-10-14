generate
if (FULL_BARREL == 1) begin : full_lsr

                                               
    assign lsr_out = i_shift_imm_zero         ? {i_in[31], 32'd0             } :
                     i_shift_amount == 8'd 0  ? {i_carry_in, i_in            } :  
                     i_shift_amount == 8'd 1  ? {i_in[ 0],  1'd0, i_in[31: 1]} :
                     i_shift_amount == 8'd 2  ? {i_in[ 1],  2'd0, i_in[31: 2]} :
                     i_shift_amount == 8'd 3  ? {i_in[ 2],  3'd0, i_in[31: 3]} :
                     i_shift_amount == 8'd 4  ? {i_in[ 3],  4'd0, i_in[31: 4]} :
                     i_shift_amount == 8'd 5  ? {i_in[ 4],  5'd0, i_in[31: 5]} :
                     i_shift_amount == 8'd 6  ? {i_in[ 5],  6'd0, i_in[31: 6]} :
                     i_shift_amount == 8'd 7  ? {i_in[ 6],  7'd0, i_in[31: 7]} :
                     i_shift_amount == 8'd 8  ? {i_in[ 7],  8'd0, i_in[31: 8]} :
                     i_shift_amount == 8'd 9  ? {i_in[ 8],  9'd0, i_in[31: 9]} :
                        
                     i_shift_amount == 8'd10  ? {i_in[ 9], 10'd0, i_in[31:10]} :
                     i_shift_amount == 8'd11  ? {i_in[10], 11'd0, i_in[31:11]} :
                     i_shift_amount == 8'd12  ? {i_in[11], 12'd0, i_in[31:12]} :
                     i_shift_amount == 8'd13  ? {i_in[12], 13'd0, i_in[31:13]} :
                     i_shift_amount == 8'd14  ? {i_in[13], 14'd0, i_in[31:14]} :
                     i_shift_amount == 8'd15  ? {i_in[14], 15'd0, i_in[31:15]} :
                     i_shift_amount == 8'd16  ? {i_in[15], 16'd0, i_in[31:16]} :
                     i_shift_amount == 8'd17  ? {i_in[16], 17'd0, i_in[31:17]} :
                     i_shift_amount == 8'd18  ? {i_in[17], 18'd0, i_in[31:18]} :
                     i_shift_amount == 8'd19  ? {i_in[18], 19'd0, i_in[31:19]} :

                     i_shift_amount == 8'd20  ? {i_in[19], 20'd0, i_in[31:20]} :
                     i_shift_amount == 8'd21  ? {i_in[20], 21'd0, i_in[31:21]} :
                     i_shift_amount == 8'd22  ? {i_in[21], 22'd0, i_in[31:22]} :
                     i_shift_amount == 8'd23  ? {i_in[22], 23'd0, i_in[31:23]} :
                     i_shift_amount == 8'd24  ? {i_in[23], 24'd0, i_in[31:24]} :
                     i_shift_amount == 8'd25  ? {i_in[24], 25'd0, i_in[31:25]} :
                     i_shift_amount == 8'd26  ? {i_in[25], 26'd0, i_in[31:26]} :
                     i_shift_amount == 8'd27  ? {i_in[26], 27'd0, i_in[31:27]} :
                     i_shift_amount == 8'd28  ? {i_in[27], 28'd0, i_in[31:28]} :
                     i_shift_amount == 8'd29  ? {i_in[28], 29'd0, i_in[31:29]} :

                     i_shift_amount == 8'd30  ? {i_in[29], 30'd0, i_in[31:30]} :
                     i_shift_amount == 8'd31  ? {i_in[30], 31'd0, i_in[31   ]} :
                     i_shift_amount == 8'd32  ? {i_in[31], 32'd0             } :
                                                {1'd0,     32'd0             } ;  

end
else begin : quick_lsr

    
    assign lsr_out = i_shift_imm_zero             ? {i_in[31], 32'd0             } :
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in            } :  
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0],  1'd0, i_in[31: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1],  2'd0, i_in[31: 2]} :
                                                    {i_in[ 2],  3'd0, i_in[31: 3]} ; 

end
endgenerate