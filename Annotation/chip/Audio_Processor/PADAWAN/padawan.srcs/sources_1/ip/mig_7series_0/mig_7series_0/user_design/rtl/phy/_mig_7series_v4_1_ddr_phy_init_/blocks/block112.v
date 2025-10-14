  assign rdlvl_wr = (init_state_r == INIT_OCLKDELAY_WRITE) ||
                    (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                    (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                    (init_state_r == INIT_WRCAL_WRITE);
  assign rdlvl_rd = (init_state_r == INIT_PI_PHASELOCK_READS) ||
                    ((init_state_r == INIT_RDLVL_STG1_READ) && ~rdlvl_pi_incdec) ||  
                    (init_state_r == INIT_RDLVL_COMPLEX_READ) ||
                    (init_state_r == INIT_RDLVL_STG2_READ) ||
                    (init_state_r == INIT_OCLKDELAY_READ) ||
                    (init_state_r == INIT_WRCAL_READ) ||
                    ((init_state_r == INIT_MPR_READ) && ~rdlvl_pi_incdec) ||
                    (init_state_r == INIT_WRCAL_MULT_READS);
  assign rdlvl_wr_rd = rdlvl_wr | rdlvl_rd;