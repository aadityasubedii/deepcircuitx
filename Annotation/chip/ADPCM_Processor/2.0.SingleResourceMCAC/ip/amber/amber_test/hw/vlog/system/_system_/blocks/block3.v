`endif


`ifdef XILINX_SPARTAN6_FPGA
    
    
    
    
    wb_xs6_ddr3_bridge   #(
        .WB_DWIDTH              ( WB_DWIDTH             ),
        .WB_SWIDTH              ( WB_SWIDTH             )
        )
    u_wb_xs6_ddr3_bridge(
        .i_clk                  ( sys_clk               ),

        .o_cmd_en               ( c3_p0_cmd_en          ),
        .o_cmd_instr            ( c3_p0_cmd_instr       ),
        .o_cmd_byte_addr        ( c3_p0_cmd_byte_addr   ),
        .i_cmd_full             ( c3_p0_cmd_full        ),
        .i_wr_full              ( c3_p0_wr_full         ),
        .o_wr_en                ( c3_p0_wr_en           ),
        .o_wr_mask              ( c3_p0_wr_mask         ),
        .o_wr_data              ( c3_p0_wr_data         ),
        .i_rd_data              ( c3_p0_rd_data         ),
        .i_rd_empty             ( c3_p0_rd_empty        ),

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


    
    
    
    ddr3 u_ddr3  (

                
               .mcb3_dram_dq            ( ddr3_dq               ),
               .mcb3_dram_a             ( ddr3_addr             ),
               .mcb3_dram_ba            ( ddr3_ba               ),
               .mcb3_dram_ras_n         ( ddr3_ras_n            ),
               .mcb3_dram_cas_n         ( ddr3_cas_n            ),
               .mcb3_dram_we_n          ( ddr3_we_n             ),
               .mcb3_dram_odt           ( ddr3_odt              ),
               .mcb3_dram_reset_n       ( ddr3_reset_n          ),
               .mcb3_dram_cke           ( ddr3_cke              ),
               .mcb3_dram_udm           ( ddr3_dm[1]            ),
               .mcb3_dram_dm            ( ddr3_dm[0]            ),
               .mcb3_rzq                ( mcb3_rzq              ),
               .mcb3_dram_udqs          ( ddr3_dqs_p[1]         ),
               .mcb3_dram_dqs           ( ddr3_dqs_p[0]         ),
               .mcb3_dram_udqs_n        ( ddr3_dqs_n[1]         ),
               .mcb3_dram_dqs_n         ( ddr3_dqs_n[0]         ),
               .mcb3_dram_ck            ( ddr3_ck_p             ),
               .mcb3_dram_ck_n          ( ddr3_ck_n             ),

               .c3_sys_clk              ( clk_200               ),
               .c3_sys_rst_i            ( brd_rst               ), 
               .c3_clk0                 (                       ),
               .c3_rst0                 (                       ),
               .c3_calib_done           ( phy_init_done         ),

               .c3_p0_cmd_clk           ( sys_clk               ),

               .c3_p0_cmd_en            ( c3_p0_cmd_en          ),
               .c3_p0_cmd_instr         ( c3_p0_cmd_instr       ),
               .c3_p0_cmd_bl            ( 6'd0                  ),
               .c3_p0_cmd_byte_addr     ( c3_p0_cmd_byte_addr   ),
               .c3_p0_cmd_empty         (                       ),
               .c3_p0_cmd_full          ( c3_p0_cmd_full        ),

               .c3_p0_wr_clk            ( sys_clk               ),

               .c3_p0_wr_en             ( c3_p0_wr_en           ),
               .c3_p0_wr_mask           ( c3_p0_wr_mask         ),
               .c3_p0_wr_data           ( c3_p0_wr_data         ),
               .c3_p0_wr_full           ( c3_p0_wr_full         ),
               .c3_p0_wr_empty          (                       ),
               .c3_p0_wr_count          (                       ),
               .c3_p0_wr_underrun       (                       ),
               .c3_p0_wr_error          (                       ),

               .c3_p0_rd_clk            ( sys_clk               ),

               .c3_p0_rd_en             ( 1'd1                  ),
               .c3_p0_rd_data           ( c3_p0_rd_data         ),
               .c3_p0_rd_full           (                       ),
               .c3_p0_rd_empty          ( c3_p0_rd_empty        ),
               .c3_p0_rd_count          (                       ),
               .c3_p0_rd_overflow       (                       ),
               .c3_p0_rd_error          (                       )
       );
`endif