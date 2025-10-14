  assign W_bstatus_reg_nxt = E_valid ? W_bstatus_reg_inst_nxt : W_bstatus_reg;
  assign W_ienable_reg_nxt = ((E_wrctl_ienable & E_valid) ? 
    E_src1[31 : 0] : W_ienable_reg) & 32'b00000000000000000000000000000001;

  assign W_ipending_reg_nxt = iactive & W_ienable_reg & oci_ienable & 32'b00000000000000000000000000000001;