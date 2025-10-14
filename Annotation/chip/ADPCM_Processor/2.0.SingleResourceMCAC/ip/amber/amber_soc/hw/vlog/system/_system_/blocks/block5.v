generate
if (WB_DWIDTH == 32) begin : boot_mem32
    boot_mem32 u_boot_mem (
        .i_wb_clk               ( sys_clk         ),
        .i_wb_adr               ( s_wb_adr  [1]   ),
        .i_wb_sel               ( s_wb_sel  [1]   ),
        .i_wb_we                ( s_wb_we   [1]   ),
        .o_wb_dat               ( s_wb_dat_r[1]   ),
        .i_wb_dat               ( s_wb_dat_w[1]   ),
        .i_wb_cyc               ( s_wb_cyc  [1]   ),
        .i_wb_stb               ( s_wb_stb  [1]   ),
        .o_wb_ack               ( s_wb_ack  [1]   ),
        .o_wb_err               ( s_wb_err  [1]   )
    );
end
else begin : boot_mem128
    boot_mem128 u_boot_mem (
        .i_wb_clk               ( sys_clk         ),
        .i_wb_adr               ( s_wb_adr  [1]   ),
        .i_wb_sel               ( s_wb_sel  [1]   ),
        .i_wb_we                ( s_wb_we   [1]   ),
        .o_wb_dat               ( s_wb_dat_r[1]   ),
        .i_wb_dat               ( s_wb_dat_w[1]   ),
        .i_wb_cyc               ( s_wb_cyc  [1]   ),
        .i_wb_stb               ( s_wb_stb  [1]   ),
        .o_wb_ack               ( s_wb_ack  [1]   ),
        .o_wb_err               ( s_wb_err  [1]   )
    );
end
endgenerate