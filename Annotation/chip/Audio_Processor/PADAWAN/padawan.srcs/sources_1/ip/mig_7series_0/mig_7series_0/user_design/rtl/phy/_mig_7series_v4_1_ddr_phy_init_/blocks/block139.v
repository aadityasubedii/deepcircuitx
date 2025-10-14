      INIT_OCAL_COMPLEX_RESUME_WAIT:
        if (complex_oclk_calib_resume)
          init_next_state = INIT_RDLVL_STG1_WRITE;        
        else if (complex_oclkdelay_calib_done || complex_ocal_ref_req )        