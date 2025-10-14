  assign D_ctrl_exception = D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mul|
    D_op_muli|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60;