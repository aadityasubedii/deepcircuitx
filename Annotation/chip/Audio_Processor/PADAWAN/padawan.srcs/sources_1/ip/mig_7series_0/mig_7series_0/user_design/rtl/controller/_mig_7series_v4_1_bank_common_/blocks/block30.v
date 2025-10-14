  generate





    if (nOP_WAIT == 0) begin : op_mode_disabled
      assign op_exit_grant = {nBANK_MACHS{1'b0}};
    end

    else begin : op_mode_enabled
      reg [BM_CNT_WIDTH:0] idle_cnt_r;
      reg [BM_CNT_WIDTH:0] idle_cnt_ns;