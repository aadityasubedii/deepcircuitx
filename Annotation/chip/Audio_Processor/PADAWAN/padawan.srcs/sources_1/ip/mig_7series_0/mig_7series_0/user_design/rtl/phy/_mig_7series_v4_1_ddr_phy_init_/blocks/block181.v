  
  assign prech_req = oclk_prech_req | rdlvl_prech_req | wrcal_prech_req | prbs_rdlvl_prech_req | 
                    (dqs_found_prech_req & (init_state_r == INIT_RDLVL_STG2_READ_WAIT));