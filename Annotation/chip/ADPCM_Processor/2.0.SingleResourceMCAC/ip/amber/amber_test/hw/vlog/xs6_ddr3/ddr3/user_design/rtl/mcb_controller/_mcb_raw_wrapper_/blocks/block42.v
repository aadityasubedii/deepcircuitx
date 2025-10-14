generate   
if ( C_CALIB_SOFT_IP == "TRUE") begin: gen_term_calib


  

 
mcb_soft_calibration_top  # (

    .C_MEM_TZQINIT_MAXCNT (C_MEM_TZQINIT_MAXCNT),
    .C_MC_CALIBRATION_MODE(C_MC_CALIBRATION_MODE),
    .SKIP_IN_TERM_CAL     (C_SKIP_IN_TERM_CAL),
    .SKIP_DYNAMIC_CAL     (C_SKIP_DYNAMIC_CAL),
    .SKIP_DYN_IN_TERM     (C_SKIP_DYN_IN_TERM),
    .C_SIMULATION         (C_SIMULATION),
    .C_MEM_TYPE           (C_MEM_TYPE)
        )
  mcb_soft_calibration_top_inst (
    .UI_CLK               (ui_clk),               
    .RST                  (int_sys_rst),              
    .IOCLK                (ioclk0),               
    .DONE_SOFTANDHARD_CAL (DONE_SOFTANDHARD_CAL), 
    .PLL_LOCK             (gated_pll_lock),
    
    .SELFREFRESH_REQ      (soft_cal_selfrefresh_req),    
    .SELFREFRESH_MCB_MODE (selfrefresh_mcb_mode), 
    .SELFREFRESH_MCB_REQ  (selfrefresh_mcb_enter),
    .SELFREFRESH_MODE     (selfrefresh_mode),     
    
    
    
    .MCB_UIADD            (mcb_ui_add),
    .MCB_UISDI            (mcb_ui_sdi),
    .MCB_UOSDO            (uo_sdo),               
    .MCB_UODONECAL        (hard_done_cal),        
    .MCB_UOREFRSHFLAG     (uo_refrsh_flag),       
    .MCB_UICS             (mcb_ui_cs),            
    .MCB_UIDRPUPDATE      (mcb_ui_drp_update),    
    .MCB_UIBROADCAST      (mcb_ui_broadcast),     
    .MCB_UIADDR           (mcb_ui_addr),          
    .MCB_UICMDEN          (mcb_ui_cmd_en),        
    .MCB_UIDONECAL        (mcb_ui_done_cal),      
    .MCB_UIDQLOWERDEC     (mcb_ui_dq_lower_dec),
    .MCB_UIDQLOWERINC     (mcb_ui_dq_lower_inc),
    .MCB_UIDQUPPERDEC     (mcb_ui_dq_upper_dec),
    .MCB_UIDQUPPERINC     (mcb_ui_dq_upper_inc),
    .MCB_UILDQSDEC        (mcb_ui_ldqs_dec),
    .MCB_UILDQSINC        (mcb_ui_ldqs_inc),
    .MCB_UIREAD           (mcb_ui_read),          
    .MCB_UIUDQSDEC        (mcb_ui_udqs_dec),
    .MCB_UIUDQSINC        (mcb_ui_udqs_inc),
    .MCB_RECAL            (mcb_recal),
    .MCB_SYSRST           (MCB_SYSRST),           
    .MCB_UICMD            (mcb_ui_cmd),
    .MCB_UICMDIN          (mcb_ui_cmd_in),
    .MCB_UIDQCOUNT        (mcb_ui_dqcount),
    .MCB_UODATA           (uo_data),
    .MCB_UODATAVALID      (uo_data_valid),
    .MCB_UOCMDREADY       (uo_cmd_ready_in),
    .MCB_UO_CAL_START     (uo_cal_start),
    .RZQ_Pin              (rzq),
    .ZIO_Pin              (zio),
    .CKE_Train            (cke_train)
    
     );






        assign mcb_ui_clk = ui_clk;
end
endgenerate