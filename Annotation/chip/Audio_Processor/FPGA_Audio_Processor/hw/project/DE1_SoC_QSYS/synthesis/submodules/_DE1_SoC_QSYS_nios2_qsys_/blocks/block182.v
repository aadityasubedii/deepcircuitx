  assign E_shift_rot_result_nxt = (E_new_inst)? E_src1 :
    (R_ctrl_shift_rot_right)? {E_shift_rot_fill_bit, E_shift_rot_result[31 : 1]} :
    {E_shift_rot_result[30 : 0], E_shift_rot_fill_bit};