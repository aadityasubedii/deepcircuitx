wishbone_arbiter #(
    .WB_DWIDTH              ( WB_DWIDTH         ),
    .WB_SWIDTH              ( WB_SWIDTH         )
    )
u_wishbone_arbiter (
    .i_wb_clk               ( sys_clk           ),

    
    .i_m0_wb_adr            ( m_wb_adr   [0]    ),
    .i_m0_wb_sel            ( m_wb_sel   [0]    ),
    .i_m0_wb_we             ( m_wb_we    [0]    ),
    .o_m0_wb_dat            ( m_wb_dat_r [0]    ),
    .i_m0_wb_dat            ( m_wb_dat_w [0]    ),
    .i_m0_wb_cyc            ( m_wb_cyc   [0]    ),
    .i_m0_wb_stb            ( m_wb_stb   [0]    ),
    .o_m0_wb_ack            ( m_wb_ack   [0]    ),
    .o_m0_wb_err            ( m_wb_err   [0]    ),


    
    .i_m1_wb_adr            ( m_wb_adr   [1]    ),
    .i_m1_wb_sel            ( m_wb_sel   [1]    ),
    .i_m1_wb_we             ( m_wb_we    [1]    ),
    .o_m1_wb_dat            ( m_wb_dat_r [1]    ),
    .i_m1_wb_dat            ( m_wb_dat_w [1]    ),
    .i_m1_wb_cyc            ( m_wb_cyc   [1]    ),
    .i_m1_wb_stb            ( m_wb_stb   [1]    ),
    .o_m1_wb_ack            ( m_wb_ack   [1]    ),
    .o_m1_wb_err            ( m_wb_err   [1]    ),


    
    .o_s0_wb_adr            ( s_wb_adr   [0]    ),
    .o_s0_wb_sel            ( s_wb_sel   [0]    ),
    .o_s0_wb_we             ( s_wb_we    [0]    ),
    .i_s0_wb_dat            ( s_wb_dat_r [0]    ),
    .o_s0_wb_dat            ( s_wb_dat_w [0]    ),
    .o_s0_wb_cyc            ( s_wb_cyc   [0]    ),
    .o_s0_wb_stb            ( s_wb_stb   [0]    ),
    .i_s0_wb_ack            ( s_wb_ack   [0]    ),
    .i_s0_wb_err            ( s_wb_err   [0]    ),


    
    .o_s1_wb_adr            ( s_wb_adr   [1]    ),
    .o_s1_wb_sel            ( s_wb_sel   [1]    ),
    .o_s1_wb_we             ( s_wb_we    [1]    ),
    .i_s1_wb_dat            ( s_wb_dat_r [1]    ),
    .o_s1_wb_dat            ( s_wb_dat_w [1]    ),
    .o_s1_wb_cyc            ( s_wb_cyc   [1]    ),
    .o_s1_wb_stb            ( s_wb_stb   [1]    ),
    .i_s1_wb_ack            ( s_wb_ack   [1]    ),
    .i_s1_wb_err            ( s_wb_err   [1]    ),


    
    .o_s2_wb_adr            ( s_wb_adr   [2]    ),
    .o_s2_wb_sel            ( s_wb_sel   [2]    ),
    .o_s2_wb_we             ( s_wb_we    [2]    ),
    .i_s2_wb_dat            ( s_wb_dat_r [2]    ),
    .o_s2_wb_dat            ( s_wb_dat_w [2]    ),
    .o_s2_wb_cyc            ( s_wb_cyc   [2]    ),
    .o_s2_wb_stb            ( s_wb_stb   [2]    ),
    .i_s2_wb_ack            ( s_wb_ack   [2]    ),
    .i_s2_wb_err            ( s_wb_err   [2]    ),


    
    .o_s3_wb_adr            ( s_wb_adr   [3]    ),
    .o_s3_wb_sel            ( s_wb_sel   [3]    ),
    .o_s3_wb_we             ( s_wb_we    [3]    ),
    .i_s3_wb_dat            ( s_wb_dat_r [3]    ),
    .o_s3_wb_dat            ( s_wb_dat_w [3]    ),
    .o_s3_wb_cyc            ( s_wb_cyc   [3]    ),
    .o_s3_wb_stb            ( s_wb_stb   [3]    ),
    .i_s3_wb_ack            ( s_wb_ack   [3]    ),
    .i_s3_wb_err            ( s_wb_err   [3]    ),


    
    .o_s4_wb_adr            ( s_wb_adr   [4]    ),
    .o_s4_wb_sel            ( s_wb_sel   [4]    ),
    .o_s4_wb_we             ( s_wb_we    [4]    ),
    .i_s4_wb_dat            ( s_wb_dat_r [4]    ),
    .o_s4_wb_dat            ( s_wb_dat_w [4]    ),
    .o_s4_wb_cyc            ( s_wb_cyc   [4]    ),
    .o_s4_wb_stb            ( s_wb_stb   [4]    ),
    .i_s4_wb_ack            ( s_wb_ack   [4]    ),
    .i_s4_wb_err            ( s_wb_err   [4]    ),


    
    .o_s5_wb_adr            ( s_wb_adr   [5]    ),
    .o_s5_wb_sel            ( s_wb_sel   [5]    ),
    .o_s5_wb_we             ( s_wb_we    [5]    ),
    .i_s5_wb_dat            ( s_wb_dat_r [5]    ),
    .o_s5_wb_dat            ( s_wb_dat_w [5]    ),
    .o_s5_wb_cyc            ( s_wb_cyc   [5]    ),
    .o_s5_wb_stb            ( s_wb_stb   [5]    ),
    .i_s5_wb_ack            ( s_wb_ack   [5]    ),
    .i_s5_wb_err            ( s_wb_err   [5]    ),


    
    .o_s6_wb_adr            ( s_wb_adr   [6]    ),
    .o_s6_wb_sel            ( s_wb_sel   [6]    ),
    .o_s6_wb_we             ( s_wb_we    [6]    ),
    .i_s6_wb_dat            ( s_wb_dat_r [6]    ),
    .o_s6_wb_dat            ( s_wb_dat_w [6]    ),
    .o_s6_wb_cyc            ( s_wb_cyc   [6]    ),
    .o_s6_wb_stb            ( s_wb_stb   [6]    ),
    .i_s6_wb_ack            ( s_wb_ack   [6]    ),
    .i_s6_wb_err            ( s_wb_err   [6]    ),


    
    .o_s7_wb_adr            ( s_wb_adr   [7]    ),
    .o_s7_wb_sel            ( s_wb_sel   [7]    ),
    .o_s7_wb_we             ( s_wb_we    [7]    ),
    .i_s7_wb_dat            ( s_wb_dat_r [7]    ),
    .o_s7_wb_dat            ( s_wb_dat_w [7]    ),
    .o_s7_wb_cyc            ( s_wb_cyc   [7]    ),
    .o_s7_wb_stb            ( s_wb_stb   [7]    ),
    .i_s7_wb_ack            ( s_wb_ack   [7]    ),
    .i_s7_wb_err            ( s_wb_err   [7]    )
    );