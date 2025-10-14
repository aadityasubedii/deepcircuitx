  assign D_ctrl_alu_subtract = D_op_sub|
    D_op_cmplti|
    D_op_cmpltui|
    D_op_cmplt|
    D_op_cmpltu|
    D_op_blt|
    D_op_bltu|
    D_op_cmpgei|
    D_op_cmpgeui|
    D_op_cmpge|
    D_op_cmpgeu|
    D_op_bge|
    D_op_bgeu;