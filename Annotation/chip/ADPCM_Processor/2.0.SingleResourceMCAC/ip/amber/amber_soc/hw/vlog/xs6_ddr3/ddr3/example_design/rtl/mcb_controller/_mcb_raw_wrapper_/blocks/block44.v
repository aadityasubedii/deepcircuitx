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