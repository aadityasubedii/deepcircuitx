always @*
    case ( i_rs_sel )
       4'd0  :  o_rd = r0_out  ;
       4'd1  :  o_rd = r1_out  ; 
       4'd2  :  o_rd = r2_out  ; 
       4'd3  :  o_rd = r3_out  ; 
       4'd4  :  o_rd = r4_out  ; 
       4'd5  :  o_rd = r5_out  ; 
       4'd6  :  o_rd = r6_out  ; 
       4'd7  :  o_rd = r7_out  ; 
       4'd8  :  o_rd = r8_rds  ; 
       4'd9  :  o_rd = r9_rds  ; 
       4'd10 :  o_rd = r10_rds ; 
       4'd11 :  o_rd = r11_rds ; 
       4'd12 :  o_rd = r12_rds ; 
       4'd13 :  o_rd = r13_rds ; 
       4'd14 :  o_rd = r14_rds ; 
       default: o_rd = r15_out_rm_nxt ; 
    endcase