  assign D_logic_op = D_ctrl_alu_force_xor ? 2'b11 : 
    D_ctrl_alu_force_and ? 2'b01 :
    D_logic_op_raw;