  assign E_shift_rot_fill_bit = R_ctrl_shift_logical ? 1'b0 :
    (R_ctrl_rot_right ? E_shift_rot_result[0] : 
    E_shift_rot_result[31]);