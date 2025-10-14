   always @ (posedge clk_i) begin
    if (rst_i[0])
         force_wrcmd_gen <= #TCQ  1'b0;
    else if (buf_avail_r == 63)
         force_wrcmd_gen <= #TCQ  1'b0;
    else if (instr_vld_dly1 && pipe_data_in[32]== 1 && pipe_data_in[41:35] > 16)
         force_wrcmd_gen <= #TCQ  1'b1;
    end