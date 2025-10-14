      else begin : op_cnt
        reg [OP_WIDTH-1:0] op_cnt_r;
        wire [OP_WIDTH-1:0] op_cnt_ns =
                                   (passing_open_bank || op_exit_grant || rst)
                                       ? ZERO[OP_WIDTH-1:0]
                                       : end_rtp_lcl
                                         ? nOP_WAIT[OP_WIDTH-1:0]
                                         : |op_cnt_r
                                            ? op_cnt_r - ONE[OP_WIDTH-1:0]
                                            : op_cnt_r;