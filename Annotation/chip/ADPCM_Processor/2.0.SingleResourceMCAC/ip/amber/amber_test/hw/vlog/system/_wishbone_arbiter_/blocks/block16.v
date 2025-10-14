always @( posedge i_wb_clk )
    begin
    current_master_r    <= current_master;
    m0_wb_hold_r        <= i_m0_wb_stb && !o_m0_wb_ack;
    m1_wb_hold_r        <= i_m1_wb_stb && !o_m1_wb_ack;
    end