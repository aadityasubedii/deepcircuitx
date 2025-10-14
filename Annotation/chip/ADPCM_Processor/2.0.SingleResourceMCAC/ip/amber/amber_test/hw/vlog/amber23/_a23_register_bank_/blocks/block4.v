always @*
    case (i_rds_sel)
       4'd0  :  o_rs = r0_out  ;
       4'd1  :  o_rs = r1_out  ; 
       4'd2  :  o_rs = r2_out  ; 
       4'd3  :  o_rs = r3_out  ; 
       4'd4  :  o_rs = r4_out  ; 
       4'd5  :  o_rs = r5_out  ; 
       4'd6  :  o_rs = r6_out  ; 
       4'd7  :  o_rs = r7_out  ; 
       4'd8  :  o_rs = r8_rds  ; 
       4'd9  :  o_rs = r9_rds  ; 
       4'd10 :  o_rs = r10_rds ; 
       4'd11 :  o_rs = r11_rds ; 
       4'd12 :  o_rs = r12_rds ; 
       4'd13 :  o_rs = r13_rds ; 
       4'd14 :  o_rs = r14_rds ; 
       default: o_rs = r15_out_rn ; 
    endcase