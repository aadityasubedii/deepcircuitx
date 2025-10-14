  assign E_logic_result = (R_logic_op == 2'b00)? (~(E_src1 | E_src2)) :
    (R_logic_op == 2'b01)? (E_src1 & E_src2) :
    (R_logic_op == 2'b10)? (E_src1 | E_src2) :
    (E_src1 ^ E_src2);