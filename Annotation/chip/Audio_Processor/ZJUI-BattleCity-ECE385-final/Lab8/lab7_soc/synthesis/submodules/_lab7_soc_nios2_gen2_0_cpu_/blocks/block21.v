  assign D_ctrl_ignore_dst = D_op_br|
    D_op_bge|
    D_op_blt|
    D_op_bne|
    D_op_beq|
    D_op_bgeu|
    D_op_bltu|
    D_op_stb|
    D_op_sth|
    D_op_stw|
    D_op_stbio|
    D_op_sthio|
    D_op_stwio|
    D_op_jmpi;