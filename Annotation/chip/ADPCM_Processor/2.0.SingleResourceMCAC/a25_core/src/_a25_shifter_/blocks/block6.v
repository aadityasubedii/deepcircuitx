if (FULL_BARREL == 1) begin : full_asr

                                              
    assign asr_out = i_shift_imm_zero         ? {i_in[31], {32{i_in[31]}}             } :
                     i_shift_amount == 8'd 0  ? {i_carry_in, i_in                     } :  
                     i_shift_amount == 8'd 1  ? {i_in[ 0], { 2{i_in[31]}}, i_in[30: 1]} :
                     i_shift_amount == 8'd 2  ? {i_in[ 1], { 3{i_in[31]}}, i_in[30: 2]} :
                     i_shift_amount == 8'd 3  ? {i_in[ 2], { 4{i_in[31]}}, i_in[30: 3]} :
                     i_shift_amount == 8'd 4  ? {i_in[ 3], { 5{i_in[31]}}, i_in[30: 4]} :
                     i_shift_amount == 8'd 5  ? {i_in[ 4], { 6{i_in[31]}}, i_in[30: 5]} :
                     i_shift_amount == 8'd 6  ? {i_in[ 5], { 7{i_in[31]}}, i_in[30: 6]} :
                     i_shift_amount == 8'd 7  ? {i_in[ 6], { 8{i_in[31]}}, i_in[30: 7]} :
                     i_shift_amount == 8'd 8  ? {i_in[ 7], { 9{i_in[31]}}, i_in[30: 8]} :
                     i_shift_amount == 8'd 9  ? {i_in[ 8], {10{i_in[31]}}, i_in[30: 9]} :
                        
                     i_shift_amount == 8'd10  ? {i_in[ 9], {11{i_in[31]}}, i_in[30:10]} :
                     i_shift_amount == 8'd11  ? {i_in[10], {12{i_in[31]}}, i_in[30:11]} :
                     i_shift_amount == 8'd12  ? {i_in[11], {13{i_in[31]}}, i_in[30:12]} :
                     i_shift_amount == 8'd13  ? {i_in[12], {14{i_in[31]}}, i_in[30:13]} :
                     i_shift_amount == 8'd14  ? {i_in[13], {15{i_in[31]}}, i_in[30:14]} :
                     i_shift_amount == 8'd15  ? {i_in[14], {16{i_in[31]}}, i_in[30:15]} :
                     i_shift_amount == 8'd16  ? {i_in[15], {17{i_in[31]}}, i_in[30:16]} :
                     i_shift_amount == 8'd17  ? {i_in[16], {18{i_in[31]}}, i_in[30:17]} :
                     i_shift_amount == 8'd18  ? {i_in[17], {19{i_in[31]}}, i_in[30:18]} :
                     i_shift_amount == 8'd19  ? {i_in[18], {20{i_in[31]}}, i_in[30:19]} :

                     i_shift_amount == 8'd20  ? {i_in[19], {21{i_in[31]}}, i_in[30:20]} :
                     i_shift_amount == 8'd21  ? {i_in[20], {22{i_in[31]}}, i_in[30:21]} :
                     i_shift_amount == 8'd22  ? {i_in[21], {23{i_in[31]}}, i_in[30:22]} :
                     i_shift_amount == 8'd23  ? {i_in[22], {24{i_in[31]}}, i_in[30:23]} :
                     i_shift_amount == 8'd24  ? {i_in[23], {25{i_in[31]}}, i_in[30:24]} :
                     i_shift_amount == 8'd25  ? {i_in[24], {26{i_in[31]}}, i_in[30:25]} :
                     i_shift_amount == 8'd26  ? {i_in[25], {27{i_in[31]}}, i_in[30:26]} :
                     i_shift_amount == 8'd27  ? {i_in[26], {28{i_in[31]}}, i_in[30:27]} :
                     i_shift_amount == 8'd28  ? {i_in[27], {29{i_in[31]}}, i_in[30:28]} :
                     i_shift_amount == 8'd29  ? {i_in[28], {30{i_in[31]}}, i_in[30:29]} :
                     i_shift_amount == 8'd30  ? {i_in[29], {31{i_in[31]}}, i_in[30   ]} :
                     i_shift_amount == 8'd31  ? {i_in[30], {32{i_in[31]}}             } :
                                                {i_in[31], {32{i_in[31]}}             } ; 

end