  assign W_ienable_reg_nxt = ((E_wrctl_ienable & E_valid) ? 
    E_src1[31 : 0] : W_ienable_reg) & 32'b00000000000000000000000000000001;