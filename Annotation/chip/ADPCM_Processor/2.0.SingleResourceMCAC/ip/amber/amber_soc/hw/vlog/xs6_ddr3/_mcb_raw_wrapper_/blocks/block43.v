   MCB 
   # (         .PORT_CONFIG             (C_PORT_CONFIG),                                    
               .MEM_WIDTH              (C_NUM_DQ_PINS    ),        
               .MEM_TYPE                (C_MEM_TYPE       ), 
               .MEM_BURST_LEN            (C_MEM_BURST_LEN  ),  
               .MEM_ADDR_ORDER           (C_MEM_ADDR_ORDER),               
               .MEM_CAS_LATENCY          (C_MEM_CAS_LATENCY),        
               .MEM_DDR3_CAS_LATENCY      (C_MEM_DDR3_CAS_LATENCY   ),
               .MEM_DDR2_WRT_RECOVERY     (C_MEM_DDR2_WRT_RECOVERY  ),
               .MEM_DDR3_WRT_RECOVERY     (C_MEM_DDR3_WRT_RECOVERY  ),
               .MEM_MOBILE_PA_SR          (C_MEM_MOBILE_PA_SR       ),
               .MEM_DDR1_2_ODS              (C_MEM_DDR1_2_ODS         ),
               .MEM_DDR3_ODS                (C_MEM_DDR3_ODS           ),
               .MEM_DDR2_RTT                (C_MEM_DDR2_RTT           ),
               .MEM_DDR3_RTT                (C_MEM_DDR3_RTT           ),
               .MEM_DDR3_ADD_LATENCY        (C_MEM_DDR3_ADD_LATENCY   ),
               .MEM_DDR2_ADD_LATENCY        (C_MEM_DDR2_ADD_LATENCY   ),
               .MEM_MOBILE_TC_SR            (C_MEM_MOBILE_TC_SR       ),
               .MEM_MDDR_ODS                (C_MEM_MDDR_ODS           ),
               .MEM_DDR2_DIFF_DQS_EN        (C_MEM_DDR2_DIFF_DQS_EN   ),
               .MEM_DDR2_3_PA_SR            (C_MEM_DDR2_3_PA_SR       ),
               .MEM_DDR3_CAS_WR_LATENCY    (C_MEM_DDR3_CAS_WR_LATENCY),
               .MEM_DDR3_AUTO_SR           (C_MEM_DDR3_AUTO_SR       ),
               .MEM_DDR2_3_HIGH_TEMP_SR    (C_MEM_DDR2_3_HIGH_TEMP_SR),
               .MEM_DDR3_DYN_WRT_ODT       (C_MEM_DDR3_DYN_WRT_ODT   ),
               .MEM_RA_SIZE               (C_MEM_ADDR_WIDTH            ),
               .MEM_BA_SIZE               (C_MEM_BANKADDR_WIDTH            ),
               .MEM_CA_SIZE               (C_MEM_NUM_COL_BITS            ),
               .MEM_RAS_VAL               (MEM_RAS_VAL            ),  
               .MEM_RCD_VAL               (MEM_RCD_VAL            ),  
               .MEM_REFI_VAL               (MEM_REFI_VAL           ),  
               .MEM_RFC_VAL               (MEM_RFC_VAL            ),  
               .MEM_RP_VAL                (MEM_RP_VAL             ),  
               .MEM_WR_VAL                (MEM_WR_VAL             ),  
               .MEM_RTP_VAL               (MEM_RTP_VAL            ),  
               .MEM_WTR_VAL               (MEM_WTR_VAL            ),
               .CAL_BYPASS        (C_MC_CALIB_BYPASS),      
               .CAL_RA            (C_MC_CALIBRATION_RA),     
               .CAL_BA            (C_MC_CALIBRATION_BA ),    
               .CAL_CA            (C_MC_CALIBRATION_CA),  
               .CAL_CLK_DIV        (C_MC_CALIBRATION_CLK_DIV),        
               .CAL_DELAY         (C_MC_CALIBRATION_DELAY),
               .ARB_NUM_TIME_SLOTS         (C_ARB_NUM_TIME_SLOTS),
               .ARB_TIME_SLOT_0            (arbtimeslot0 )     ,    
               .ARB_TIME_SLOT_1            (arbtimeslot1 )     ,    
               .ARB_TIME_SLOT_2            (arbtimeslot2 )     ,    
               .ARB_TIME_SLOT_3            (arbtimeslot3 )     ,    
               .ARB_TIME_SLOT_4            (arbtimeslot4 )     ,    
               .ARB_TIME_SLOT_5            (arbtimeslot5 )     ,    
               .ARB_TIME_SLOT_6            (arbtimeslot6 )     ,    
               .ARB_TIME_SLOT_7            (arbtimeslot7 )     ,    
               .ARB_TIME_SLOT_8            (arbtimeslot8 )     ,    
               .ARB_TIME_SLOT_9            (arbtimeslot9 )     ,    
               .ARB_TIME_SLOT_10           (arbtimeslot10)   ,         
               .ARB_TIME_SLOT_11           (arbtimeslot11)            
             )  samc_0                                                
     (                                                              
                                                                    
             
             
             .PLLCLK            ({ioclk90,ioclk0}),
             .PLLCE              ({pll_ce_90,pll_ce_0})       ,

             .PLLLOCK       (1'b1),
             
             
             
             .DQSIOIN           (idelay_dqs_ioi_s),
             .DQSIOIP           (idelay_dqs_ioi_m),
             .UDQSIOIN          (idelay_udqs_ioi_s),
             .UDQSIOIP          (idelay_udqs_ioi_m),


               
               .DQI       (in_dq),
             
             .SYSRST         (MCB_SYSRST ), 
   
            
             .P0ARBEN            (mig_p0_arb_en),
             .P0CMDCLK           (mig_p0_cmd_clk),
             .P0CMDEN            (mig_p0_cmd_en),
             .P0CMDRA            (mig_p0_cmd_ra),
             .P0CMDBA            (mig_p0_cmd_ba),
             .P0CMDCA            (mig_p0_cmd_ca),
             
             .P0CMDINSTR         (mig_p0_cmd_instr),
             .P0CMDBL            (mig_p0_cmd_bl),
             .P0CMDEMPTY         (mig_p0_cmd_empty),
             .P0CMDFULL          (mig_p0_cmd_full),
             
             
            
             .P1ARBEN            (mig_p1_arb_en),
             .P1CMDCLK           (mig_p1_cmd_clk),
             .P1CMDEN            (mig_p1_cmd_en),
             .P1CMDRA            (mig_p1_cmd_ra),
             .P1CMDBA            (mig_p1_cmd_ba),
             .P1CMDCA            (mig_p1_cmd_ca),
             
             .P1CMDINSTR         (mig_p1_cmd_instr),
             .P1CMDBL            (mig_p1_cmd_bl),
             .P1CMDEMPTY         (mig_p1_cmd_empty),
             .P1CMDFULL          (mig_p1_cmd_full),

             
             
             .P2ARBEN            (mig_p2_arb_en),
             .P2CMDCLK           (mig_p2_cmd_clk),
             .P2CMDEN            (mig_p2_cmd_en),
             .P2CMDRA            (mig_p2_cmd_ra),
             .P2CMDBA            (mig_p2_cmd_ba),
             .P2CMDCA            (mig_p2_cmd_ca),
             
             .P2CMDINSTR         (mig_p2_cmd_instr),
             .P2CMDBL            (mig_p2_cmd_bl),
             .P2CMDEMPTY         (mig_p2_cmd_empty),
             .P2CMDFULL          (mig_p2_cmd_full),

             
             
             .P3ARBEN            (mig_p3_arb_en),
             .P3CMDCLK           (mig_p3_cmd_clk),
             .P3CMDEN            (mig_p3_cmd_en),
             .P3CMDRA            (mig_p3_cmd_ra),
             .P3CMDBA            (mig_p3_cmd_ba),
             .P3CMDCA            (mig_p3_cmd_ca),
                               
             .P3CMDINSTR         (mig_p3_cmd_instr),
             .P3CMDBL            (mig_p3_cmd_bl),
             .P3CMDEMPTY         (mig_p3_cmd_empty),
             .P3CMDFULL          (mig_p3_cmd_full),

             
             
             .P4ARBEN            (mig_p4_arb_en),
             .P4CMDCLK           (mig_p4_cmd_clk),
             .P4CMDEN            (mig_p4_cmd_en),
             .P4CMDRA            (mig_p4_cmd_ra),
             .P4CMDBA            (mig_p4_cmd_ba),
             .P4CMDCA            (mig_p4_cmd_ca),
                               
             .P4CMDINSTR         (mig_p4_cmd_instr),
             .P4CMDBL            (mig_p4_cmd_bl),
             .P4CMDEMPTY         (mig_p4_cmd_empty),
             .P4CMDFULL          (mig_p4_cmd_full),

             
             
             .P5ARBEN            (mig_p5_arb_en),
             .P5CMDCLK           (mig_p5_cmd_clk),
             .P5CMDEN            (mig_p5_cmd_en),
             .P5CMDRA            (mig_p5_cmd_ra),
             .P5CMDBA            (mig_p5_cmd_ba),
             .P5CMDCA            (mig_p5_cmd_ca),
                               
             .P5CMDINSTR         (mig_p5_cmd_instr),
             .P5CMDBL            (mig_p5_cmd_bl),
             .P5CMDEMPTY         (mig_p5_cmd_empty),
             .P5CMDFULL          (mig_p5_cmd_full),

              
             
             
             .DQIOWEN0        (dqIO_w_en_0),
             .DQSIOWEN90P     (dqsIO_w_en_90_p),
             .DQSIOWEN90N     (dqsIO_w_en_90_n),
             
             
             
             .ADDR         (address_90),  
             .BA           (ba_90 ),      
             .RAS         (ras_90 ),     
             .CAS         (cas_90 ),     
             .WE          (we_90  ),     
             .CKE          (cke_90 ),     
             .ODT          (odt_90 ),     
             .RST          (rst_90 ),     
             
             
             .IOIDRPCLK           (ioi_drp_clk    ),
             .IOIDRPADDR          (ioi_drp_addr   ),
             .IOIDRPSDO           (ioi_drp_sdo    ), 
             .IOIDRPSDI           (ioi_drp_sdi    ), 
             .IOIDRPCS            (ioi_drp_cs     ),
             .IOIDRPADD           (ioi_drp_add    ), 
             .IOIDRPBROADCAST     (ioi_drp_broadcast  ),
             .IOIDRPTRAIN         (ioi_drp_train    ),
             .IOIDRPUPDATE         (ioi_drp_update) ,
             
             
             
             .RECAL               (mcb_recal    ), 
             .UIREAD               (mcb_ui_read),
             .UIADD                (mcb_ui_add)    ,
             .UICS                 (mcb_ui_cs)     ,
             .UICLK                (mcb_ui_clk)    ,
             .UISDI                (mcb_ui_sdi)    ,
             .UIADDR               (mcb_ui_addr)   ,
             .UIBROADCAST          (mcb_ui_broadcast) ,
             .UIDRPUPDATE          (mcb_ui_drp_update) ,
             .UIDONECAL            (mcb_ui_done_cal)   ,
             .UICMD                (mcb_ui_cmd),
             .UICMDIN              (mcb_ui_cmd_in)     ,
             .UICMDEN              (mcb_ui_cmd_en)     ,
             .UIDQCOUNT            (mcb_ui_dqcount)    ,
             .UIDQLOWERDEC          (mcb_ui_dq_lower_dec),
             .UIDQLOWERINC          (mcb_ui_dq_lower_inc),
             .UIDQUPPERDEC          (mcb_ui_dq_upper_dec),
             .UIDQUPPERINC          (mcb_ui_dq_upper_inc),
             .UIUDQSDEC          (mcb_ui_udqs_dec),
             .UIUDQSINC          (mcb_ui_udqs_inc),
             .UILDQSDEC          (mcb_ui_ldqs_dec),
             .UILDQSINC          (mcb_ui_ldqs_inc),
             .UODATA             (uo_data),
             .UODATAVALID          (uo_data_valid),
             .UODONECAL            (hard_done_cal)  ,
             .UOCMDREADYIN         (uo_cmd_ready_in),
             .UOREFRSHFLAG         (uo_refrsh_flag),
             .UOCALSTART           (uo_cal_start)   ,
             .UOSDO                (uo_sdo),
                                                   
             
              .STATUS                    (status),
              .SELFREFRESHENTER          (selfrefresh_mcb_enter  ),
              .SELFREFRESHMODE           (selfrefresh_mcb_mode ),  



            
              .P0RDDATA         ( mig_p0_rd_data[31:0]    ), 
              .P1RDDATA         ( mig_p1_rd_data[31:0]   ), 
              .P2RDDATA         ( mig_p2_rd_data[31:0]  ), 
              .P3RDDATA         ( mig_p3_rd_data[31:0]       ),
              .P4RDDATA         ( mig_p4_rd_data[31:0] ), 
              .P5RDDATA         ( mig_p5_rd_data[31:0]        ), 
              .LDMN             ( dqnlm       ),
              .UDMN             ( dqnum       ),
              .DQON             ( dqo_n       ),
              .DQOP             ( dqo_p       ),
              .LDMP             ( dqplm       ),
              .UDMP             ( dqpum       ),
              
              .P0RDCOUNT          ( mig_p0_rd_count ), 
              .P0WRCOUNT          ( mig_p0_wr_count ),
              .P1RDCOUNT          ( mig_p1_rd_count ), 
              .P1WRCOUNT          ( mig_p1_wr_count ), 
              .P2COUNT           ( mig_p2_count  ), 
              .P3COUNT           ( mig_p3_count  ),
              .P4COUNT           ( mig_p4_count  ),
              .P5COUNT           ( mig_p5_count  ),
              
              
              
              .P0RDEMPTY        ( mig_p0_rd_empty), 
              .P0RDFULL         ( mig_p0_rd_full), 
              .P0RDOVERFLOW     ( mig_p0_rd_overflow), 
              .P0WREMPTY        ( mig_p0_wr_empty), 
              .P0WRFULL         ( mig_p0_wr_full), 
              .P0WRUNDERRUN     ( mig_p0_wr_underrun), 
              
              .P1RDEMPTY        ( mig_p1_rd_empty), 
              .P1RDFULL         ( mig_p1_rd_full), 
              .P1RDOVERFLOW     ( mig_p1_rd_overflow),  
              .P1WREMPTY        ( mig_p1_wr_empty), 
              .P1WRFULL         ( mig_p1_wr_full), 
              .P1WRUNDERRUN     ( mig_p1_wr_underrun),  
              
              
              .P2EMPTY          ( mig_p2_empty),
              .P2FULL           ( mig_p2_full),
              .P2RDOVERFLOW        ( mig_p2_overflow), 
              .P2WRUNDERRUN       ( mig_p2_underrun), 
              
              .P3EMPTY          ( mig_p3_empty ),
              .P3FULL           ( mig_p3_full ),
              .P3RDOVERFLOW        ( mig_p3_overflow), 
              .P3WRUNDERRUN       ( mig_p3_underrun ),
              
              .P4EMPTY          ( mig_p4_empty),
              .P4FULL           ( mig_p4_full),
              .P4RDOVERFLOW        ( mig_p4_overflow), 
              .P4WRUNDERRUN       ( mig_p4_underrun), 
              
              .P5EMPTY          ( mig_p5_empty ),
              .P5FULL           ( mig_p5_full ),
              .P5RDOVERFLOW        ( mig_p5_overflow), 
              .P5WRUNDERRUN       ( mig_p5_underrun), 
              
              
              .P0WREN        ( mig_p0_wr_en), 
              .P0RDEN        ( mig_p0_rd_en),                         
              .P1WREN        ( mig_p1_wr_en), 
              .P1RDEN        ( mig_p1_rd_en), 
              .P2EN          ( mig_p2_en),
              .P3EN          ( mig_p3_en), 
              .P4EN          ( mig_p4_en), 
              .P5EN          ( mig_p5_en), 
              
              .P0RWRMASK        ( mig_p0_wr_mask[3:0]), 
              .P1RWRMASK        ( mig_p1_wr_mask[3:0]),
              .P2WRMASK        ( mig_p2_wr_mask[3:0]),
              .P3WRMASK        ( mig_p3_wr_mask[3:0]), 
              .P4WRMASK        ( mig_p4_wr_mask[3:0]),
              .P5WRMASK        ( mig_p5_wr_mask[3:0]), 
              
              .P0WRDATA      ( mig_p0_wr_data[31:0]), 
              .P1WRDATA      ( mig_p1_wr_data[31:0]),
              .P2WRDATA      ( mig_p2_wr_data[31:0]),
              .P3WRDATA      ( mig_p3_wr_data[31:0]), 
              .P4WRDATA      ( mig_p4_wr_data[31:0]),
              .P5WRDATA      ( mig_p5_wr_data[31:0]),  
              
              .P0WRERROR     (mig_p0_wr_error),
              .P1WRERROR     (mig_p1_wr_error),
              .P0RDERROR     (mig_p0_rd_error),
              .P1RDERROR     (mig_p1_rd_error),
              
              .P2ERROR       (mig_p2_error),
              .P3ERROR       (mig_p3_error),
              .P4ERROR       (mig_p4_error),
              .P5ERROR       (mig_p5_error),
              
              
              
              .P0WRCLK            ( mig_p0_wr_clk  ),
              .P1WRCLK            ( mig_p1_wr_clk  ),
              .P0RDCLK            ( mig_p0_rd_clk  ),
              .P1RDCLK            ( mig_p1_rd_clk  ),
              .P2CLK              ( mig_p2_clk  ),
              .P3CLK              ( mig_p3_clk  ),
              .P4CLK              ( mig_p4_clk  ),
              .P5CLK              ( mig_p5_clk) 
              