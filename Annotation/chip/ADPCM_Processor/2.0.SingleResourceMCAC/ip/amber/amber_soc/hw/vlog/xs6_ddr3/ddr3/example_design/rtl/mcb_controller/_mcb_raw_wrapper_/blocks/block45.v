               assign mig_p5_cmd_en      =      1'b0;
               assign mig_p5_cmd_ra      =      15'd0;
               assign mig_p5_cmd_ba      =      3'd0;
               assign mig_p5_cmd_ca      =      12'd0;
               
               assign mig_p5_cmd_instr   =      3'd0;
               assign mig_p5_cmd_bl      =      6'd0;
                             

                                
end
endgenerate
                              
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