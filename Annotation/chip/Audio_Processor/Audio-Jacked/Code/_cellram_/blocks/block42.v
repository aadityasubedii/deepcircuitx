    wire [31:0] dq_out_buf = (data_out_valid ? data_out : {32{1'bx}} );
    bufif1 buf_dq [31:0]  (dq_out, dq_out_buf, {{32 - DQ_BITS{1'b0}} , {DQ_BITS{data_out_enable}} & by_out});