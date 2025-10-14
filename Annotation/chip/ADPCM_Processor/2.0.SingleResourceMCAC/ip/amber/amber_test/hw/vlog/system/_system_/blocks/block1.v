ethmac_wb #(
    .WB_DWIDTH              ( WB_DWIDTH         ),
    .WB_SWIDTH              ( WB_SWIDTH         )
    )
u_ethmac_wb (
    
    .o_m_wb_adr             ( m_wb_adr   [0]    ),
    .o_m_wb_sel             ( m_wb_sel   [0]    ),
    .o_m_wb_we              ( m_wb_we    [0]    ),
    .i_m_wb_rdat            ( m_wb_dat_r [0]    ),
    .o_m_wb_wdat            ( m_wb_dat_w [0]    ),
    .o_m_wb_cyc             ( m_wb_cyc   [0]    ),
    .o_m_wb_stb             ( m_wb_stb   [0]    ),
    .i_m_wb_ack             ( m_wb_ack   [0]    ),
    .i_m_wb_err             ( m_wb_err   [0]    ),

    
    .i_s_wb_adr             ( s_wb_adr   [0]    ),
    .i_s_wb_sel             ( s_wb_sel   [0]    ),
    .i_s_wb_we              ( s_wb_we    [0]    ),
    .i_s_wb_cyc             ( s_wb_cyc   [0]    ),
    .i_s_wb_stb             ( s_wb_stb   [0]    ),
    .o_s_wb_ack             ( s_wb_ack   [0]    ),
    .i_s_wb_wdat            ( s_wb_dat_w [0]    ),
    .o_s_wb_rdat            ( s_wb_dat_r [0]    ),
    .o_s_wb_err             ( s_wb_err   [0]    ),

    
    .i_m_wb_adr             ( emm_wb_adr        ),
    .i_m_wb_sel             ( emm_wb_sel        ),
    .i_m_wb_we              ( emm_wb_we         ),
    .o_m_wb_rdat            ( emm_wb_rdat       ),
    .i_m_wb_wdat            ( emm_wb_wdat       ),
    .i_m_wb_cyc             ( emm_wb_cyc        ),
    .i_m_wb_stb             ( emm_wb_stb        ),
    .o_m_wb_ack             ( emm_wb_ack        ),
    .o_m_wb_err             ( emm_wb_err        ),

    
    .o_s_wb_adr             ( ems_wb_adr        ),
    .o_s_wb_sel             ( ems_wb_sel        ),
    .o_s_wb_we              ( ems_wb_we         ),
    .i_s_wb_rdat            ( ems_wb_rdat       ),
    .o_s_wb_wdat            ( ems_wb_wdat       ),
    .o_s_wb_cyc             ( ems_wb_cyc        ),
    .o_s_wb_stb             ( ems_wb_stb        ),
    .i_s_wb_ack             ( ems_wb_ack        ),
    .i_s_wb_err             ( ems_wb_err        )
);