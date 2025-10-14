      INIT_OCAL_COMPLEX_ACT:
        init_next_state = INIT_OCAL_COMPLEX_ACT_WAIT;
      
      INIT_OCAL_COMPLEX_ACT_WAIT:
        if (complex_wait_cnt =='d15)
          init_next_state = INIT_RDLVL_STG1_WRITE;
          
      INIT_OCAL_COMPLEX_WRITE_WAIT:
        if (prech_req_posedge_r || (complex_oclkdelay_calib_done && ~complex_oclkdelay_calib_done_r1))
            init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (stg1_wr_rd_cnt == 'd1)
          init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;
        else if (complex_wait_cnt == 'd15)
          init_next_state = INIT_RDLVL_STG1_WRITE;    
    
      
      INIT_OCAL_COMPLEX_RESUME_WAIT:
        if (complex_oclk_calib_resume)
          init_next_state = INIT_RDLVL_STG1_WRITE;        
        else if (complex_oclkdelay_calib_done || complex_ocal_ref_req )        
            init_next_state = INIT_PRECHARGE_PREWAIT;          

      
      
      
      INIT_OCAL_CENTER_ACT: 
        init_next_state = INIT_OCAL_CENTER_ACT_WAIT;
          
      INIT_OCAL_CENTER_ACT_WAIT:
	    if (ocal_act_wait_cnt == 'd15)
	      init_next_state = INIT_OCAL_CENTER_WRITE_WAIT;
	  
	  INIT_OCAL_CENTER_WRITE:
        if(!oclk_center_write_resume && !lim_wr_req)
          init_next_state = INIT_OCAL_CENTER_WRITE_WAIT;
      
      INIT_OCAL_CENTER_WRITE_WAIT:
	    
		if (prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (lim_done && ~mask_lim_done && ~complex_mask_lim_done && oclkdelay_calib_done && ~oclkdelay_center_calib_start)
		  init_next_state = INIT_OCAL_COMPLEX_ACT_WAIT;
		else if (lim_done && ~mask_lim_done && ~complex_mask_lim_done && ~oclkdelay_center_calib_start)
		  init_next_state = INIT_OCLKDELAY_READ_WAIT; 
        else if (oclk_center_write_resume || lim_wr_req)
          init_next_state = INIT_OCAL_CENTER_WRITE;
     
      
      
      

      INIT_DONE:
        init_next_state = INIT_DONE;
