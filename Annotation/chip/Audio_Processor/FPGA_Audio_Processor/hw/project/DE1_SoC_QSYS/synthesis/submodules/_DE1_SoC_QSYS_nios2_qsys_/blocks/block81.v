  assign D_ctrl_retaddr = D_op_call|
    D_op_rsv02|
    D_op_nextpc|
    D_op_callr|
    D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mul|
    D_op_muli|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60|
    D_op_break|
    D_op_hbreak;