assign imm_shift_amount_nxt = shift_imm ;

       
       
assign shift_imm_zero_nxt   = imm_shift_amount_nxt == 5'd0 &&       
                              barrel_shift_amount_sel_nxt == 2'd2;  
