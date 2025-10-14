  assign prech_done_pre = (((init_state_r == INIT_RDLVL_STG1_READ) || (init_state_r == INIT_RDLVL_STG1_WRITE_READ) ||  
                           ((rdlvl_last_byte_done_r || prbs_last_byte_done_r) && (init_state_r == INIT_RDLVL_ACT_WAIT) && cnt_cmd_done_r) ||
                            (dqs_found_prech_req && (init_state_r == INIT_RDLVL_ACT_WAIT)) ||
                            (init_state_r == INIT_MPR_RDEN) ||
                            ((init_state_r == INIT_WRCAL_ACT_WAIT) && cnt_cmd_done_r) ||
                            (init_state_r == INIT_OCAL_CENTER_ACT) ||
                            ((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT) && complex_oclkdelay_calib_start_r1) ||
                            ((init_state_r == INIT_OCLKDELAY_ACT_WAIT) && cnt_cmd_done_r) ||
                            ((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) && prbs_last_byte_done_r) ||  
                            (wrlvl_final && (init_state_r == INIT_REFRESH_WAIT) && cnt_cmd_done_r && ~oclkdelay_calib_done)) &&
                           prech_pending_r && 
                           !prech_req_posedge_r);