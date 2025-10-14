  assign E_alu_result = ((R_ctrl_br_cmp | R_ctrl_rd_ctl_reg))? 0 :
    (R_ctrl_shift_rot)? E_shift_rot_result :
    (R_ctrl_logic)? E_logic_result :
    (R_ctrl_custom)? E_ci_result :
    E_arith_result;