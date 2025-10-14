  assign F_jmp_direct_pc_hi = F_pc[26];
  assign D_jmp_direct_target_waddr = {F_jmp_direct_pc_hi, D_iw[31 : 6]};