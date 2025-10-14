    assign phy_init_done = 1'd1;

    main_mem #(
                .WB_DWIDTH             ( WB_DWIDTH             ),
                .WB_SWIDTH             ( WB_SWIDTH             )
                )
    u_main_mem (
               .i_clk                  ( sys_clk               ),
               .i_mem_ctrl             ( test_mem_ctrl         ),
               .i_wb_adr               ( s_wb_adr  [2]         ),
               .i_wb_sel               ( s_wb_sel  [2]         ),
               .i_wb_we                ( s_wb_we   [2]         ),
               .o_wb_dat               ( s_wb_dat_r[2]         ),
               .i_wb_dat               ( s_wb_dat_w[2]         ),
               .i_wb_cyc               ( s_wb_cyc  [2]         ),
               .i_wb_stb               ( s_wb_stb  [2]         ),
               .o_wb_ack               ( s_wb_ack  [2]         ),
               .o_wb_err               ( s_wb_err  [2]         )
            );