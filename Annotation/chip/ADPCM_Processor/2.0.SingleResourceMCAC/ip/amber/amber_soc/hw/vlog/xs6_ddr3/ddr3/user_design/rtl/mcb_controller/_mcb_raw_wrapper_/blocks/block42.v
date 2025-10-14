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