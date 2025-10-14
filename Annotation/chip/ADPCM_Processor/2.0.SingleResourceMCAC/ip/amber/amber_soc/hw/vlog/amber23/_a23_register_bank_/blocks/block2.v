assign o_rn = i_rn_sel == 4'd0  ? r0_out  :
              i_rn_sel == 4'd1  ? r1_out  : 
              i_rn_sel == 4'd2  ? r2_out  : 
              i_rn_sel == 4'd3  ? r3_out  : 
              i_rn_sel == 4'd4  ? r4_out  : 
              i_rn_sel == 4'd5  ? r5_out  : 
              i_rn_sel == 4'd6  ? r6_out  : 
              i_rn_sel == 4'd7  ? r7_out  : 
              i_rn_sel == 4'd8  ? r8_out  : 
              i_rn_sel == 4'd9  ? r9_out  : 
              i_rn_sel == 4'd10 ? r10_out : 
              i_rn_sel == 4'd11 ? r11_out : 
              i_rn_sel == 4'd12 ? r12_out : 
              i_rn_sel == 4'd13 ? r13_out : 
              i_rn_sel == 4'd14 ? r14_out : 
                                  r15_out_rn ; 